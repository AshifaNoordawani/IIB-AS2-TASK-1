# DS1202 AS02 - Server Access and Git Project

## What this project is
A small project on the lab Linux server (iib-as2) to practise secure SSH access,
directory permissions, shell scripting and Git/GitHub. It contains `scripts/sysinfo.sh`,
a shell script that prints a system-information report: hostname, OS and kernel version,
uptime and CPU load, memory usage and disk usage. The enhanced version also saves each
report to a timestamped file in `logs/`.

## Step-by-step setup
1. **Generate an SSH key (on Windows PowerShell):**

        ssh-keygen -t ed25519 -C "your.email@pb.edu.bn"

2. **Copy the public key to the server** (ssh-copy-id is not on Windows, so the key is piped over SSH):

        type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh 26FTT1116@iib-as2 "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

3. **Log in without a password:**

        ssh 26FTT1116@iib-as2

4. **Create the project directories with permissions (on the server):**

        mkdir -p ~/ds1202-project/{scripts,docs,logs}
        chmod 755 ~/ds1202-project

5. **Create `scripts/sysinfo.sh` and make it executable:**

        chmod +x ~/ds1202-project/scripts/sysinfo.sh

## How to run the script

        ~/ds1202-project/scripts/sysinfo.sh

It prints the report to the screen and saves a copy in `logs/`.

## Git workflow used
1. `git init` in the project folder, then a first commit with the directory structure and script.
2. Created a branch with `git switch -c feature-logging`.
3. Enhanced `sysinfo.sh` on that branch (uptime, CPU load, log file output) and committed.
4. Switched back with `git switch main` and merged with `git merge --no-ff feature-logging`.
5. Added a public GitHub repository as `origin` and pushed both branches:

        git remote add origin git@github.com:AshifaNoordawani/IIB-AS2-TASK-1.git
        git push -u origin main
        git push origin feature-logging

## Screenshots in the evidence PDF
1. ssh-keygen output showing the Ed25519 key was generated
2. Passwordless SSH login to the server
3. `ls -la` of `~/ds1202-project` showing the structure and permissions
4. Output of running the enhanced `sysinfo.sh` after the merge
5. `git log --graph --oneline --all` showing commits and branches
