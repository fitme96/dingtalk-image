## 构建镜像
- sh build.sh 
## 运行容器
- xhost +
- sudo docker run -d --name dingtalk -v /tmp/.X11-unix:/tmp/.X11-unix  -e DISPLAY=unix$DISPLAY -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime -e GDK_SCALE -e GDK_DPI_SCALE fitme96/dingtalk:1.3.0.20214

## 挂载钉钉文件下载目录
- sudo docker run -d --name dingtalk -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/fitme/:/root -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE fitme96/dingtalk:1.3.0.20214
## 镜像说明
- 基于ubuntu:18.04
- 安装搜狗输入法
- 本地构建，避免拉取镜像慢
## 构建dingtalk命令方便启动
- 脚本dingtalk
- mv dingtalk /usr/local/bin/
