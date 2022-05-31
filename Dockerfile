FROM ubuntu:18.04
ARG DINGTALK_URL
ARG DINGTALK_VERSION
ENV LANG zh_CN.UTF-8
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt update && apt install -y wget && \
    wget -q $DINGTALK_URL && \
    ### 内网地址搜狗deb包
    wget -q 192.168.190.112:82/sogoupinyin_4.0.1.2123_amd64.deb  && \
    apt install -y  libglib2.0-0 libglu1-mesa libglu1-mesa libglu1-mesa libxmu6  \
    libatk1.0-0 libcairo2 libgdk-pixbuf2.0-0 libxinerama1 libxi6  libxrandr2 libxcursor1 \
    libxcomposite1 libxdamage1 libthai0 libnss3 libatk-bridge2.0-0 libatk-bridge2.0-0 libgbm1 \
    libatk-bridge2.0-0 libgbm1 libgbm1 libxss1 libcups2 libpulse-mainloop-glib0 libpulse-mainloop-glib0 \
    libgraphite2-3 libc6 libasound2 libxkbcommon-x11-0  language-pack-zh-hans  ttf-wqy-microhei \
    ttf-wqy-zenhei xfonts-wqy libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2 libgsettings-qt1 \
    fcitx lsb-release  libcanberra-gtk-module libcanberra-gtk3-module dbus-x11 \
    dbus-x11  libgomp1 && \
    dpkg -i com.alibabainc.dingtalk_${DINGTALK_VERSION}_amd64.deb && \
    dpkg -i sogoupinyin_4.0.1.2123_amd64.deb && \
    sed 2'i\fcitx' /opt/apps/com.alibabainc.dingtalk/files/Elevator.sh -i && \
    rm -f *.deb
CMD ["/opt/apps/com.alibabainc.dingtalk/files/Elevator.sh"]
