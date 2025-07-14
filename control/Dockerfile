FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=nointeractive

RUN apt-get update && \
    apt-get install -y tzdata sudo vim python3 python3-pip openssh-client sshpass ansible && \
    apt-get install -y curl iputils-ping net-tools iproute2 tree && \
    apt-get clean

# Create user Ansible
RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && \
    mkdir -p /home/ansible/.ssh && \
    chown -R ansible:ansible /home/ansible/.ssh && \
    echo 'ansible ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Copy & Grant Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


USER ansible
WORKDIR /home/ansible

CMD ["/entrypoint.sh"]