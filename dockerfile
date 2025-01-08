# 使用 Debian Bookworm 镜像
FROM debian:bookworm

# 更新包列表并安装 Samba
RUN apt-get update && \
    apt-get install -y samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY smb.conf /etc/samba/smb.conf



# 暴露 Samba 端口
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

# 启动 Samba 服务
CMD ["smbd", "--interactive"]


# docker build -t samba-server .
# docker run -it debian:bookworm bash 
# docker run -d --name samba-server -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 -v /Users/zen:/share samba-server bash
  