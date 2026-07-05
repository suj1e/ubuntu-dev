#!/bin/bash
# Ubuntu Server 开发环境一键安装脚本
# 运行: bash install.sh

set -e

echo "=== Ubuntu Server 开发环境安装 ==="

# ============================================
# 1. 系统更新
# ============================================
echo "[1/5] 系统更新..."
sudo apt update && sudo apt upgrade -y

# ============================================
# 2. 安装基础工具
# ============================================
echo "[2/5] 安装基础工具..."
sudo apt install -y \
    curl wget git vim nano \
    build-essential cmake pkg-config \
    software-properties-common apt-transport-https ca-certificates \
    gnupg lsb-release

# ============================================
# 3. 安装 CLI 工具
# ============================================
echo "[3/5] 安装 CLI 工具..."
sudo apt install -y \
    eza bat fd-find ripgrep git-delta \
    fzf just jq lnav \
    btop dust procs tldr \
    direnv gh neovim \
    htop iotop ncdu ufw ethtool \
    zsh

# ============================================
# 4. 安装 mise（版本管理）
# ============================================
echo "[4/5] 安装 mise..."
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
java = "21"
node = "22"
python = "3.13"
EOF

# 安装语言版本
echo "  安装语言版本（这可能需要几分钟）..."
mise install

# ============================================
# 5. 安装 starship（Prompt）
# ============================================
echo "[5/5] 安装 starship..."
if ! command -v starship &>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# ============================================
# 6. 配置 zsh
# ============================================
echo "[6/6] 配置 zsh..."
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
echo "  5. 运行 'mise install' 安装所有语言版本"
echo ""
