# Ubuntu Server 开发环境 CLI 工具参考

> 本机配置：zsh + starship + mise
> 仓库：https://github.com/suj1e/ubuntu-dev

---

## 目录

1. [工具清单](#1-工具清单)
2. [Zsh 配置](#2-zsh-配置)
3. [starship 配置](#3-starship-配置)
4. [mise 配置](#4-mise-配置)
5. [Git 配置](#5-git-配置)
6. [SSH 配置](#6-ssh-配置)
7. [工具用法速查](#7-工具用法速查)
8. [常见组合](#8-常见组合)
9. [配置文件位置一览](#9-配置文件位置一览)
10. [换机器恢复](#10-换机器恢复)

---

## 1. 工具清单

### 已安装工具（apt + mise + cargo）

| 工具 | 版本 | 用途 | 安装方式 |
|------|------|------|----------|
| **zsh** | 最新 | Shell | apt |
| **starship** | 最新 | Prompt | 官方脚本 |
| **eza** | 最新 | 现代 ls | apt |
| **bat** | 最新 | 语法高亮 cat | apt（二进制名为 batcat） |
| **fd** | 最新 | 现代 find | apt (fd-find，二进制名为 fdfind) |
| **ripgrep** | 最新 | 现代 grep | apt |
| **delta** | 最新 | Git diff 美化 | apt (git-delta) |
| **zoxide** | 最新 | 智能目录跳转 | mise |
| **fzf** | 最新 | 模糊搜索 | apt |
| **lazygit** | 最新 | Git TUI | mise |
| **just** | 最新 | 命令 runner | apt |
| **jq** | 最新 | JSON 处理 | apt |
| **lnav** | 最新 | 日志查看器 | apt |
| **btop** | 最新 | 系统监控 | apt |
| **dust** | 最新 | 磁盘占用分析 | cargo |
| **procs** | 最新 | 进程列表 | cargo |
| **tldr** | 最新 | 简化版手册 | apt |
| **yq** | 最新 | YAML 处理 | mise |
| **direnv** | 最新 | 目录级环境变量 | apt |
| **lazydocker** | 最新 | Docker TUI | mise |
| **hyperfine** | 最新 | 命令性能对比 | apt |
| **sd** | 最新 | sed 替代 | mise |
| **xh** | 最新 | curl 替代 | mise |
| **mise** | 最新 | 多语言版本管理 | 官方脚本 |
| **neovim** | 最新 | 编辑器 | apt |
| **zellij** | 最新 | 终端复用器 | mise |
| **gh** | 最新 | GitHub CLI | apt |
| **Git** | 最新 | 版本控制 | apt |
| **htop** | 最新 | 系统监控 | apt |
| **iotop** | 最新 | I/O 监控 | apt |
| **ncdu** | 最新 | 磁盘占用分析 | apt |
| **ufw** | 最新 | 防火墙 | apt |
| **ethtool** | 最新 | 网络工具 | apt |

### 一键安装

```bash
# 克隆仓库
git clone https://github.com/suj1e/ubuntu-dev.git ~/ubuntu-dev

# 运行安装脚本
bash ~/ubuntu-dev/scripts/install.sh
```

---

## 2. Zsh 配置

**路径**: `~/.zshrc`
**来源**: `~/ubuntu-dev/config/zsh/.zshrc`

### 别名（对齐 macOS）

| 别名 | 命令 | 说明 |
|------|------|------|
| `ls` | `eza` | 现代 ls |
| `ll` | `eza -l --icons --git --group-directories-first` | 详细列表 |
| `la` | `eza -la --icons --git --group-directories-first` | 显示隐藏文件 |
| `lt` | `eza -T --icons` | 树形视图 |
| `cat` | `bat` / `batcat` | 语法高亮（Ubuntu 上为 batcat） |
| `less` | `bat` / `batcat` | 语法高亮分页（Ubuntu 上为 batcat） |
| `find` | `fd` / `fdfind` | 现代 find（Ubuntu 上为 fdfind） |
| `grep` | `rg` | 现代 grep |
| `lg` | `lazygit` | Git TUI |
| `vim` | `nvim` | Neovim |

### 函数

| 函数 | 说明 |
|------|------|
| `..` | 返回上级目录 |
| `...` | 返回上两级目录 |
| `du` | 目录大小分析（dust 或 du） |
| `psg <pattern>` | 进程搜索（procs 或 ps） |

### 模块

| 模块 | 说明 |
|------|------|
| `zoxide` | 智能目录跳转（`z <dir>`） |
| `direnv` | 进入目录自动加载 `.envrc` |
| `starship` | Prompt 美化 |
| `zsh-autosuggestions` | 灰色提示历史命令 |
| `zsh-syntax-highlighting` | 实时高亮 |
| `zsh-history-substring-search` | ↑↓ 搜索历史 |

---

## 3. starship 配置

**路径**: `~/.config/starship/starship.toml`
**来源**: `~/ubuntu-dev/config/starship/starship.toml`

### 配置项（对齐 macOS）

| 模块 | 说明 |
|------|------|
| `directory` | 目录路径，最多 3 层，git 仓库截断到根 |
| `git_branch` | Git 分支（紫色） |
| `git_status` | Git 状态（红色，!+ staged+ untracked?） |
| `python` | Python 版本（黄色 🐍） |
| `nodejs` | Node.js 版本（绿色 ⬢） |
| `rust` | Rust 版本（红色 🦀） |
| `java` | Java 版本（红色 ☕） |
| `cmd_duration` | 命令耗时（≥2 秒显示） |
| `character` | 提示符（❯ 绿色成功，红色失败） |

---

## 4. mise 配置

**路径**: `~/.config/mise/config.toml`

```toml
[tools]
bun = "latest"
go = "1.24"
java = "21"
node = "22"
python = "3.13"
```

### 常用命令

```bash
mise ls                    # 查看已激活版本
mise use --global node@22  # 设置全局默认版本
mise use node@20           # 项目级锁版本（生成 .tool-versions）
mise up                    # 升级所有到最新
```

---

## 5. Git 配置

**路径**: `~/.gitconfig`

```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    line-numbers = true
    theme = Catppuccin Mocha

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

---

## 6. SSH 配置

**路径**: `~/.ssh/config`

```ssh
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
    AddKeysToAgent yes
    IdentitiesOnly yes
```

---

## 7. 工具用法速查

### 文件操作

| 命令 | 说明 | 示例 |
|------|------|------|
| `eza` | 现代 ls | `eza -la --icons --git` |
| `bat` | 语法高亮 cat | `bat file.py` |
| `fd` | 现代 find | `fd '*.js'` |
| `dust` | 磁盘占用分析 | `dust` |
| `ncdu` | 交互式磁盘分析 | `ncdu /` |

### 搜索

| 命令 | 说明 | 示例 |
|------|------|------|
| `rg` | 现代 grep | `rg 'TODO' -t py` |
| `fzf` | 模糊搜索 | `Ctrl+R` 历史搜索 |
| `tldr` | 简化版手册 | `tldr tar` |

### Git

| 命令 | 说明 |
|------|------|
| `lazygit` | Git TUI（`lg` 别名） |
| `delta` | Git diff 美化（自动通过 git pager） |

### 系统

| 命令 | 说明 | 示例 |
|------|------|------|
| `btop` | 系统监控 | `btop` |
| `htop` | 进程监控 | `htop` |
| `iotop` | I/O 监控 | `sudo iotop` |
| `procs` | 进程列表 | `procs` |
| `psg <pattern>` | 进程搜索 | `psg node` |
| `hyperfine` | 命令性能对比 | `hyperfine "ls" "eza"` |
| `ufw` | 防火墙 | `sudo ufw status` |

### 开发

| 命令 | 说明 |
|------|------|
| `mise` | 版本管理（Node/Java/Python/Go/Bun） |
| `direnv` | 目录级环境变量 |
| `just` | 命令 runner（类似 make） |
| `jq` | JSON 处理 |
| `yq` | YAML 处理 |
| `xh` | HTTP 客户端（curl 替代） |
| `sd` | sed 替代 |
| `nvim` | 编辑器（`vim` 别名） |
| `zellij` | 终端复用器 |
| `lazydocker` | Docker TUI |
| `gh` | GitHub CLI |

---

## 8. 常见组合

```bash
# 搜索并打开文件
fd '*.ts' | fzf | xargs nvim

# Git 工作流
lg                    # 打开 lazygit
rg 'TODO' -t py       # 搜索 TODO
dust                  # 看哪个目录占空间

# 项目开发
cd myproject          # zoxide 智能跳转
direnv allow          # 加载项目环境变量
mise use node@20      # 项目级 Node 版本
nvim .                # 打开编辑器
```

---

## 9. 配置文件位置一览

| 配置 | 路径 | 来源 |
|------|------|------|
| Zsh | `~/.zshrc` | `config/zsh/.zshrc` |
| starship | `~/.config/starship/starship.toml` | `config/starship/` |
| mise | `~/.config/mise/config.toml` | `config/mise/` |
| Git | `~/.gitconfig` | `config/git/` |
| SSH | `~/.ssh/config` | `config/ssh/` |
| Neovim | `~/.config/nvim/` | 需单独配置 |
| zellij | `~/.config/zellij/` | 需单独配置 |

---

## 10. 换机器恢复

```bash
# 1. 克隆仓库
git clone https://github.com/suj1e/ubuntu-dev.git ~/ubuntu-dev

# 2. 运行安装脚本
bash ~/ubuntu-dev/scripts/install.sh

# 3. 重启 shell
exec zsh
```

---

## 11. 服务器特有工具

| 工具 | 用途 | 示例 |
|------|------|------|
| `htop` | 交互式进程监控 | `htop` |
| `iotop` | I/O 监控 | `sudo iotop` |
| `ncdu` | 交互式磁盘分析 | `ncdu /` |
| `ufw` | 防火墙 | `sudo ufw enable` |
| `ethtool` | 网卡配置 | `ethtool eth0` |
| `ss` | Socket 统计 | `ss -tulpn` |
| `journalctl` | 日志查看 | `journalctl -u nginx` |
| `systemctl` | 服务管理 | `sudo systemctl restart nginx` |

---

## 12. 注意事项

### Ubuntu 特有

| 问题 | 解决方案 |
|------|------|
| 中文路径 | 已配置 UTF-8，`PYTHONIOENCODING=utf-8` |
| 权限问题 | 使用 sudo 或配置 sudoers |
| 防火墙 | `sudo ufw enable` 开启，`sudo ufw allow 22/tcp` 开 SSH |
| SSH 密钥 | `ssh-keygen -t ed25519` 生成，复制到服务器 |

### 工具差异

| macOS | Ubuntu | 说明 |
|------|------|------|
| brew | apt + mise + cargo | 包管理不同 |
| zsh | zsh | 一致 |
| starship | starship | 一致 |
| bat | batcat | apt 包名为 bat，二进制名为 batcat |
| fd | fdfind | apt 包名为 fd-find，二进制名为 fdfind |
| dust/procs | cargo 编译安装 | apt 无包，mise 依赖 GitHub 下载 |
| mise | mise | 一致 |
| Ghostty | 无（SSH 客户端） | 服务器无 GUI |
| 其他工具 | 基本一致 | 跨平台工具版本一致 |
