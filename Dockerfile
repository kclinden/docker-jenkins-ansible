FROM jenkins/ssh-agent:latest
LABEL maintainer="Kasey Linden"
ENV pip_packages "ansible molecule"


# Update and install python3
RUN apt update -y \
    && apt upgrade -y \
    && apt install python3 python3-pip sshpass -y \
    && apt autoremove -y

# Install Ansible via Pip.
RUN pip3 install $pip_packages

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV PATH /ansible/bin:$PATH