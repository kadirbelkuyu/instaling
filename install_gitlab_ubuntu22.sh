#!/bin/bash

# Güncellemeleri ve gerekli paketleri yükle
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata postfix

# GitLab CE reposunu ekleyip yükle
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce

# GitLab'ı yapılandır
sudo gitlab-ctl reconfigure

# GitLab Runner reposunu ekleyip yükle
curl -LJO "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh"
sudo bash script.deb.sh
sudo apt-get install gitlab-runner

