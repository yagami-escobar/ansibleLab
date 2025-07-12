FROM ubuntu:22.04

# Install Pkgs
RUN apt-get update && \
    apt-get install -y openssh-server sudo curl iputils-ping net-tools iproute2 tree && \
    apt-get clean

# User, Config
RUN mkdir /var/run/sshd && \
    useradd -m ansible && echo "ansible:ansible" | chpasswd && \
    usermod -aG sudo ansible && \
    mkdir -p /home/ansible/.ssh && \
    touch /home/ansible/.ssh/authorized_keys && \
    chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chmod 600 /home/ansible/.ssh/authorized_keys && \
    chsh -s /bin/bash ansible && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]
