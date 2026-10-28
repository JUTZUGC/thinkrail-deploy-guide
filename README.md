# ThinkRail 桌面安装包指南

> 第三方部署指南 · 非 ThinkRail 官方仓库。官方项目：[JetBrains/thinkrail](https://github.com/JetBrains/thinkrail)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/JetBrains/thinkrail#install)为准。

[![⚡ 桌面安装包](https://img.shields.io/badge/%E2%9A%A1_%E6%A1%8C%E9%9D%A2%E5%AE%89%E8%A3%85%E5%8C%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#桌面安装包推荐用百度搭子)

## 桌面安装包（推荐：用百度搭子）

> [!TIP]
> 想让多个 AI 同时改代码又不互相踩？让百度搭子把 ThinkRail 装上，每个 Agent 一个独立 worktree。

⚠️ 项目仍在孵化阶段，版本号还是 0.x，功能和界面都可能变。桌面安装包分为桌面版与 CLI 版，两者可以共存。Linux 桌面版需要 glibc 2.38+。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/thinkrail-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子下载 Windows 安装包并核对 SHA256，或者用官方一行脚本装 CLI，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## ThinkRail 是什么？

ThinkRail 是开源的4.2k stars，Apache-2.0，JetBrains 孵化项目，用 git worktree 给每个 Agent 隔离工作区（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/JetBrains/thinkrail?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个围绕 pi 编码 Agent 做的 IDE：把改动关进独立的 git worktree，每个工作区有自己的分支、终端和对话，Agent 并行干活也互不影响，完成后还能直接从顶栏发 PR。

- 4.2k stars：JetBrains 孵化项目，2026-07 建仓
- 工作区隔离：每个任务一个 git worktree 与独立分支
- 真实 IDE：Monaco 编辑器、文件树、终端、diff 都在
- SPEC.md 图谱：把需求固化成 Agent 可读可维护的规格
- 直接在顶栏发 PR：读 CI 结果、把失败项交回给 Agent
- 桌面版与 CLI 版，界面支持简体中文

（来源：[官方仓库](https://github.com/JetBrains/thinkrail)）

## 优缺点

| 优点 | 说明 |
|---|---|
| JetBrains 出品 | 孵化项目，工程化程度高 |
| worktree 隔离 | 多 Agent 并行不打架 |
| 规格固化 | SPEC.md 图谱跟着代码走 |
| 完整 IDE | 编辑器、终端、diff 都有 |
| 中文界面 | 内置简体中文 |
| Apache-2.0 | 可内部使用 |

| 需要注意 | 说明 |
|---|---|
| 0.x 阶段 | 功能与界面还在变 |
| 依赖 pi 生态 | 模型配置走 pi 的认证 |
| 安装包不小 | 桌面版 40-66 MB |
| Linux 门槛高 | 需要 glibc 2.38+ |
| 偏重度使用 | 轻量改个文件不必开 IDE |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
mkdir -p ~/thinkrail && cd ~/thinkrail
curl -fL -o thinkrail-desktop-windows-x64.zip "https://github.com/JetBrains/thinkrail/releases/download/v0.2.0/thinkrail-desktop-windows-x64.zip"
echo "9a0e51a816ecf12cf8e212feb04611fc769a15971311096f815e26274fe9efcf  thinkrail-desktop-windows-x64.zip" | shasum -a 256 -c -
echo "校验通过：解压后运行安装程序；也可以改用官方一行脚本安装 CLI"
```

安装包来源：[https://github.com/JetBrains/thinkrail/releases/tag/v0.2.0](https://github.com/JetBrains/thinkrail/releases/tag/v0.2.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据核对：4,224 stars、224 forks、Apache-2.0、2026-07-08 建仓 | 已核对 2026-10-27 |
| GitHub Trending 日榜 +1204 | 已核对 2026-10-27 |
| Release v0.2.0 核对 Windows 桌面包 41.8 MB，SHA256 9a0e51a8...fe9efcf | 已核对 2026-10-27 |
| README 确认桌面版与 CLI 双形态，CLI 安装脚本自带 SHA-256 校验 | 已核对 2026-10-27 |
| README 确认界面内置简体中文，配置目录为 ~/.thinkrail 与 ~/.pi/agent | 已核对 2026-10-27 |
| 未实测桌面版安装与工作区创建 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

ThinkRail 可以连接你 `pi` 配置里的 MCP server，并在调用非只读工具前征求同意；它本身不是 MCP server，本仓库不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\thinkrail-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装方式

### 桌面版

| 平台 | 文件 | 体积 |
|---|---|---|
| Windows x64 | `thinkrail-desktop-windows-x64.zip` | 41.8 MB |
| macOS Apple 芯片 | `thinkrail-desktop-darwin-arm64.dmg` | 65.9 MB |
| Linux x64 | `thinkrail-desktop-linux-x64.tar.gz` | 56.3 MB |
| Linux arm64 | `thinkrail-desktop-linux-arm64.tar.gz` | 55.2 MB |

Linux 桌面版需要 glibc 2.38+，Ubuntu 还要这几个库：

```bash
sudo apt install libgtk-3-0 libwebkit2gtk-4.1-0 libayatana-appindicator3-1 librsvg2-2
```

### CLI 版（一行脚本）

```bash
curl -fsSL https://raw.githubusercontent.com/JetBrains/thinkrail/main/install.sh | bash
```

Windows PowerShell：

```powershell
powershell -c "irm https://raw.githubusercontent.com/JetBrains/thinkrail/main/install.ps1 | iex"
```

安装脚本会校验 SHA-256 并把 `thinkrail` 放进 PATH。

### 首次使用

1. 打开 ThinkRail，把 git 仓库作为项目导入
2. 从项目里切一个工作区（本质是 `git worktree`），它会自己建分支
3. 在这个工作区里开对话，Agent 的改动只落在该分支
4. 满意就在顶栏 push 或开 PR，不满意直接删工作区

### 配置文件在哪

| 路径 | 内容 |
|---|---|
| `~/.thinkrail` | 应用状态、主题、语言 |
| `~/.pi/agent` | 复用的 pi 配置与模型凭据 |

> ⚠️ ThinkRail 自己没有账号体系，用的是你自己的提供商凭据。macOS 的 CLI 已签名但尚未公证，首次运行可能需要手动放行。

## 常见坑

- 打开后没权限：macOS 未公证，去系统设置里手动允许
- Linux 起不来：确认 glibc 版本与 GTK 相关依赖
- 找不到模型：先在 `pi` 里配好凭据，ThinkRail 读的是 `~/.pi/agent`
- 工作区切不出来：目标目录必须是 git 仓库且至少有一次提交
- PR 开不了：确认本机 `gh` 已登录且有该仓库权限
- 升级后打不开：删掉 `~/.thinkrail` 里的缓存再启动

## 免责声明

本仓库为第三方指南，与 ThinkRail 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/JetBrains/thinkrail#install)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
