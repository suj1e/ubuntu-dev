# ubuntu-dev

Ubuntu Server 开发环境配置（zsh + starship + mise）。

和 macOS/Windows 工具链对齐：eza/bat/fd/rg/delta/zoxide/fzf/lazygit/just/jq/btop/dust/procs/tldr/yq/direnv/lazydocker/hyperfine/sd/xh。

## 快速开始

```bash
# 1. 克隆仓库
git clone https://github.com/suj1e/ubuntu-dev.git ~/ubuntu-dev

# 2. 运行安装脚本
bash ~/ubuntu-dev/scripts/install.sh

# 3. 重启 shell
exec zsh
```

## 仓库结构

```
ubuntu-dev/
├── README.md                          # 本文件
├── scripts/
│   └── install.sh                     # 一键安装脚本
├── config/
│   ├── zsh/
│   │   └── .zshrc                     # Zsh 配置（对齐 macOS）
│   ├── starship/
│   │   └── starship.toml              # starship Prompt
│   ├── mise/
│   │   └── config.toml                # 版本管理
│   ├── git/
│   │   └── gitconfig                  # Git 配置
│   └── ssh/
│       └── config                     # SSH 配置
└── docs/
    └── CLI-Tools-Reference-Ubuntu.md  # 完整工具参考
```

## 核心配置

| 组件 | 配置 | 说明 |
|------|------|------|
| Shell | zsh | 和 macOS 一致 |
| Prompt | starship | 和 macOS 一致 |
| 包管理 | apt + mise | apt 装系统工具，mise 装语言和 CLI 工具 |
| 版本管理 | mise | 和 macOS 一致 |

## 和 macOS 的区别

| 组件 | macOS | Ubuntu Server |
|------|-------|---------------|
| 终端 | Ghostty | SSH 客户端（本地终端） |
| Shell | zsh | zsh（一致） |
| 包管理 | brew | apt + mise |
| 其他 | 完全一致 | 完全一致 |

## 服务器特有工具

| 工具 | 用途 |
|------|------|
| `htop` | 交互式进程监控 |
| `iotop` | I/O 监控 |
| `ncdu` | 交互式磁盘分析 |
| `ufw` | 防火墙 |
| `ethtool` | 网卡配置 |
| `ss` | Socket 统计 |

## 文档

- [CLI 工具完整参考](docs/CLI-Tools-Reference-Ubuntu.md)

## License

MIT
