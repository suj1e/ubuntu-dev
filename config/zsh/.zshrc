# Zsh 配置 — Ubuntu Server
# 路径: ~/.zshrc
# 对齐 macOS .zshrc，适配服务器环境

# ============================================
# 1. 环境变量
# ============================================
export EDITOR="nvim"
export PYTHONIOENCODING="utf-8"

# Claude Code API
export ANTHROPIC_AUTH_TOKEN="2G9fKnHzzFtVZsWmoTApZBUW5w0crnTuXUVznw9Unvd8KJuSZpe8HUpX1WueIn1LZ"
export ANTHROPIC_BASE_URL="https://api.stepfun.com/step_plan"

# mise 初始化
export PATH="$HOME/.local/share/mise/shims:$PATH"

# ============================================
# 2. 插件
# ============================================
# zsh-autosuggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh-history-substring-search
if [ -f /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# zsh-completions
if [ -d /usr/share/zsh-completions ]; then
    fpath=(/usr/share/zsh-completions $fpath)
fi

# ============================================
# 3. bat 作为 man pager
# ============================================
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export BAT_THEME="Catppuccin Mocha"

# ============================================
# 4. fzf
# ============================================
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# ============================================
# 5. 别名（对齐 macOS）
# ============================================
# eza — 现代 ls
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --git --group-directories-first'
alias la='eza -la --icons --git --group-directories-first'
alias lt='eza -T --icons'
alias ltree='eza -T --icons --level=3'
alias l2='eza -T --icons --level=2'
alias l1='eza -T --icons --level=1'

# bat — 语法高亮 cat（Ubuntu 上为 batcat）
if command -v bat &>/dev/null; then
    alias cat='bat --paging=never'
    alias less='bat --paging=always'
elif command -v batcat &>/dev/null; then
    alias cat='batcat --paging=never'
    alias less='batcat --paging=always'
fi

# fd — 现代 find（Ubuntu 上为 fdfind）
if command -v fd &>/dev/null; then
    alias find='fd'
    alias fname='fd --glob'
    alias ffull='fd --fixed-strings'
elif command -v fdfind &>/dev/null; then
    alias find='fdfind'
    alias fname='fdfind --glob'
    alias ffull='fdfind --fixed-strings'
fi

# ripgrep — 现代 grep
alias grep='rg'
alias igrep='rg -i'
alias fgrep='rg -F'

# lazygit
alias lg='lazygit'

# nvim
alias vim='nvim'

# ============================================
# 6. 函数
# ============================================
# 快速目录跳转
function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }

# 目录大小（类似 dust）
function du {
    if command -v dust &>/dev/null; then
        dust "$@"
    else
        du -sh "$@" 2>/dev/null | sort -hr | head -20
    fi
}

# 进程查看（类似 procs）
function psg {
    if command -v procs &>/dev/null; then
        procs "$@"
    else
        ps aux | grep -i "$@"
    fi
}

# ============================================
# 7. zoxide — 智能目录跳转
# ============================================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# ============================================
# 8. starship — Prompt 美化
# ============================================
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# ============================================
# 9. direnv — 进入目录自动加载 .envrc
# ============================================
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ============================================
# 10. mise — 多语言版本管理
# ============================================
if command -v mise &>/dev/null; then
    eval "$(mise activate zsh)"
fi

# ============================================
# 11. 启动信息
# ============================================
echo -e "\n\033[36mUbuntu Server + zsh + mise + starship\033[0m"
echo -e "\033[37m工具: eza/bat/fd/rg/delta/zoxide/fzf/lazygit/just/jq/btop/dust/procs/tldr/yq/direnv/lazydocker/hyperfine/sd/xh\033[0m\n"
