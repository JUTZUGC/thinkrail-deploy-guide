# ThinkRail 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/JetBrains/thinkrail#install
# 更新日期：2026-10-27
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\thinkrail" | Out-Null
Set-Location "$env:USERPROFILE\thinkrail"
curl.exe -L --fail -o thinkrail-desktop-windows-x64.zip "https://github.com/JetBrains/thinkrail/releases/download/v0.2.0/thinkrail-desktop-windows-x64.zip"
if ((Get-FileHash thinkrail-desktop-windows-x64.zip -Algorithm SHA256).Hash.ToLower() -ne '9a0e51a816ecf12cf8e212feb04611fc769a15971311096f815e26274fe9efcf') { throw 'SHA256 校验失败，请重新下载' }
Expand-Archive -Path thinkrail-desktop-windows-x64.zip -DestinationPath . -Force

Write-Host ''

Write-Host '安装完成：打开 ThinkRail，把仓库作为项目导入，再从它切出一个工作区开始对话'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/JetBrains/thinkrail#install'
