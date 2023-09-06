To get this working in Firefox, you have to open `about:config`. Once there, enter `network.protocol-handler.expose.mpc-hc` in the search field and create it as a boolean. Once created, set the value to `false`.

## Windows安装
1. [下载项目](https://github.com/northsea4/mpc-protocol/archive/refs/heads/main.zip)

2. 解压到任意目录
3. 将 `windows\bat` 目录下的3个文件复制到 `MPC-HC` 安装目录下，一般是`C:\Program Files\MPC-HC`
4. 在 `MPC-HC` 安装目录下运行 `mpc-protocol-register.bat`（有可能需要以管理员身份运行）
5. OK