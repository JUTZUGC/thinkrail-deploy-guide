#!/usr/bin/env bash
set -euo pipefail
# ThinkRail 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/JetBrains/thinkrail#install
# 更新日期：2026-10-27
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

mkdir -p ~/thinkrail && cd ~/thinkrail
curl -fL -o thinkrail-desktop-windows-x64.zip "https://github.com/JetBrains/thinkrail/releases/download/v0.2.0/thinkrail-desktop-windows-x64.zip"
echo "9a0e51a816ecf12cf8e212feb04611fc769a15971311096f815e26274fe9efcf  thinkrail-desktop-windows-x64.zip" | shasum -a 256 -c -
echo "校验通过：解压后运行安装程序；也可以改用官方一行脚本安装 CLI"

echo ""

echo "安装完成：打开 ThinkRail，把仓库作为项目导入，再从它切出一个工作区开始对话"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/JetBrains/thinkrail#install"
