#!/bin/bash
# Ubuntu Server 开发环境一键安装脚本
# 运行: bash install.sh

set -e

echo "=== Ubuntu Server 开发环境安装 ==="

# ============================================
# 1. 系统更新
# ============================================
echo "[1/6] 系统更新..."
sudo apt update
sudo apt upgrade -y || echo "  apt upgrade 部分失败，继续安装必要包..."

# ============================================
# 2. 安装基础工具
# ============================================
echo "[2/6] 安装基础工具..."
sudo apt install -y \
    curl wget git vim nano \
    build-essential cmake pkg-config \
    software-properties-common apt-transport-https ca-certificates \
    gnupg lsb-release

# ============================================
# 3. 安装 CLI 工具
# ============================================
echo "[3/6] 安装 CLI 工具..."
sudo apt install -y \
    eza bat fd-find ripgrep git-delta \
    fzf just jq lnav \
    btop tldr \
    direnv gh neovim \
    htop iotop ncdu ufw ethtool \
    zsh

# ============================================
# 4. 安装 dust 和 procs（通过 cargo）
# ============================================
echo "[4/6] 安装 dust 和 procs..."
if ! command -v dust &>/dev/null; then
    echo "  安装 dust..."
    cargo install du-dust
fi

if ! command -v procs &>/dev/null; then
    echo "  安装 procs..."
    cargo install procs
fi

# ============================================
# 5. 安装 mise（版本管理）
# ============================================
echo "[5/6] 安装 mise..."
if ! command -v mise &>/dev/null; then
    curl https://mise.run | sh
    echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
fi

# 配置 mise
mkdir -p ~/.config/mise
cat > ~/.config/mise/config.toml << 'EOF'
[tools]
bun = "latest"
go = "1.24"
gradle = "latest"
java = "21"
maven = "latest"
node = "22"
pnpm = "latest"
python = "3.13"
EOF

# 安装语言版本
echo "  安装语言版本（这可能需要几分钟）..."
mise install

# ============================================
# 6. 安装 starship（Prompt）
# ============================================
echo "[6/6] 安装 starship..."
if ! command -v starship &>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# ============================================
# 配置 zsh
# ============================================
echo ""
echo "配置 zsh..."
if [ ! -f ~/.zshrc ]; then
    cp config/zsh/.zshrc ~/.zshrc
    echo "  ✓ .zshrc 已复制"
fi

# 设置 zsh 为默认 shell
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "  ✓ 默认 shell 已改为 zsh"
fi

# ============================================
# 配置 Claude Code
# ============================================
echo ""
echo "配置 Claude Code..."
if [ ! -f ~/.claude/settings.json ]; then
    mkdir -p ~/.claude
    cp config/claude/settings.json ~/.claude/settings.json
    echo "  ✓ Claude settings.json 已复制"
else
    echo "  ℹ️  Claude settings.json 已存在，跳过"
fi

# ============================================
# 完成
# ============================================
echo ""
echo "=== 安装完成 ==="
echo ""
echo "下一步:"
echo "  1. 重启 shell: exec zsh"
echo "  2. 配置 starship: cp config/starship/starship.toml ~/.config/starship/"
echo "  3. 配置 git: cp config/git/gitconfig ~/.gitconfig"
echo "  4. 配置 SSH: cp config/ssh/config ~/.ssh/config"
echo "  5. 配置 Claude: cp config/claude/settings.json ~/.claude/"
echo "  6. 运行 'mise install' 安装所有语言版本"
echo ""
