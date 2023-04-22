FROM ubuntu:focal

# Install ansible
RUN apt-get update \
  && apt-get install --no-install-recommends -y software-properties-common \
  && apt-add-repository --yes --update ppa:ansible/ansible \
  && apt-get install --no-install-recommends -y ansible

# Provisioning by ansible
COPY playbook/ /tmp/playbook/
RUN ansible-playbook -v -b -i /dev/null /tmp/playbook/ssg/ubuntu2004-playbook-standard.yml
