FROM ubuntu:focal

# Install ansible
RUN apt-get update \
  && apt-get install --no-install-recommends -y software-properties-common \
  && apt-add-repository --yes --update ppa:ansible/ansible \
  && apt-get install --no-install-recommends -y ansible

RUN apt-get install --no-install-recommends -y \
  wget unzip ansible \
  ssg-base ssg-debderived ssg-debian ssg-nondebian ssg-applications \
  libopenscap8

RUN wget -q https://github.com/ComplianceAsCode/content/releases/download/v0.1.64/scap-security-guide-0.1.64.zip

RUN unzip scap-security-guide-0.1.64.zip \
  && mv scap-security-guide-0.1.64/ /opt/stig/

# Provisioning by ansible
COPY playbook/ /tmp/playbook/
RUN ansible-playbook -v -b -i /dev/null /tmp/playbook/site.yml; exit 0
