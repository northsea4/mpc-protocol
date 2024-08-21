# MPC-HC Protocol

本项目参考了 [vlc-protocol](https://github.com/stefansundin/vlc-protocol)，需要VLC协议的也可以去看看。

- 测试环境
  - 系统: Windows10
  - MPC-HC版本: [clsid2/mpc-hc v2.3.4](https://github.com/clsid2/mpc-hc/releases/tag/2.3.4)

## 安装
1. [下载项目](https://github.com/northsea4/mpc-protocol/archive/refs/heads/main.zip)

2. 解压到任意目录
3. 将 `windows\bat` 目录下的3个文件复制到 `MPC-HC` 安装目录下，一般是`C:\Program Files\MPC-HC`
4. 在 `MPC-HC` 安装目录下运行 `mpc-protocol-register.bat`（有可能需要以管理员身份运行）

## 说明
格式: `mpc-hc://[媒体链接]`

示例:
媒体链接: `http://127.0.0.1:8080/path/to/movie.mp4`
调用链接: `mpc-hc://http://127.0.0.1:8080/path/to/movie.mp4`


---


To get this working in Firefox, you have to open `about:config`. Once there, enter `network.protocol-handler.expose.mpc-hc` in the search field and create it as a boolean. Once created, set the value to `false`.