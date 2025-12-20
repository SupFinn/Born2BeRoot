*This project has been created as part of the 42 curriculum by rhssayn.*

# 🧠 Born2beRoot

## 📌 Description

**Born2beRoot** is an introductory **system administration & virtualization** project from the 42 curriculum.  
The objective is to build a **secure Linux server from scratch** inside a virtual machine while following strict security and configuration rules.

This project focuses on **understanding**, not just executing:
- How Linux systems work ⚙️
- How users and permissions are managed 🔐
- How services are secured 🛡️
- How to monitor a system without a GUI 📊

---

## 🎯 Project Goals

- 🖥️ Discover virtualization using **VirtualBox**
- 🐧 Install a minimal Linux server (no GUI)
- 🔒 Apply strong security policies
- 👥 Manage users, groups, and permissions
- 🌐 Configure essential services (SSH, firewall)
- 📈 Monitor system health via a bash script
- 🚀 Gain autonomy in Linux system administration

---

## 🐧 Operating System Choice

### ✅ Chosen OS: **Debian (Stable)**

**Why Debian?**
- ⭐ Very stable and reliable
- 📚 Excellent documentation
- 👶 Beginner-friendly for system administration
- 👍 Recommended by 42

**Pros**
- Stable long-term support
- Simple package management (`apt`)
- Native **AppArmor** integration

**Cons**
- Packages may be slightly older
- Less enterprise-oriented than Rocky Linux

---

## ⚙️ Technical Choices & Configuration

### 🧱 Virtualization
- **VirtualBox** used (mandatory)
- ❌ No snapshots (strictly forbidden)

### 💾 Partitioning
- **LVM** used for flexibility
- 🔐 At least **two encrypted partitions**
- Logical volumes to allow scalability

### 🔐 Security
- **AppArmor** enabled at startup
- Strong password policy:
  - 🔢 Minimum 10 characters
  - 🔠 Uppercase + lowercase + numbers
  - ⏳ Password expiration every 30 days
  - ⚠️ Warning 7 days before expiration
- 🚫 Root login via SSH disabled
- 🔌 SSH running on port **4242**

### 🔥 Firewall
- **UFW** enabled and active at startup
- ✅ Only port **4242** open

### 👤 User Management
- Root user properly secured
- User **rhssayn** created
- Member of:
  - `user42`
  - `sudo`

### 🛠️ Sudo Configuration
- ⛔ Max 3 authentication attempts
- 💬 Custom error message
- 📝 All sudo actions logged in `/var/log/sudo/`
- 🖥️ TTY mode enabled
- 🔒 Restricted executable paths

---

## 📊 Monitoring Script (`monitoring.sh`)

A bash script that displays system information **every 10 minutes** using `wall`.

### 📋 Displayed Information
- 🏗️ OS architecture & kernel version
- 🧠 Physical CPU count
- ⚡ Virtual CPU count
- 🧮 RAM usage & percentage
- 💽 Disk usage & percentage
- 🔄 CPU load
- ⏰ Last reboot date
- 📦 LVM status
- 🌐 Active TCP connections
- 👥 Logged-in users
- 📡 IPv4 & MAC address
- 🔑 Number of sudo commands executed

### ⏱️ Automation
- Managed using **cron**
- Runs at system startup
- ❌ No errors displayed

---

## ▶️ Instructions

### 📦 Requirements
- VirtualBox
- Debian Stable ISO

### 🚀 Setup Steps
1. Create a VirtualBox virtual machine
2. Install Debian (no graphical interface)
3. Apply all mandatory configurations
4. Enable firewall & SSH
5. Ensure `monitoring.sh` runs every 10 minutes
6. Generate disk signature and save it in `signature.txt`

---

## ⚖️ Comparisons

### 🐧 Debian vs 🪨 Rocky Linux
| Debian | Rocky Linux |
|------|-------------|
| Community-focused | Enterprise-focused |
| Beginner-friendly | More complex |
| AppArmor | SELinux |

### 🛡️ AppArmor vs SELinux
- **AppArmor** → simpler, profile-based
- **SELinux** → more powerful, label-based

### 🔥 UFW vs firewalld
- **UFW** → simple & efficient
- **firewalld** → dynamic & advanced

### 🖥️ VirtualBox vs UTM
- **VirtualBox** → cross-platform & stable
- **UTM** → macOS & ARM optimized

---

## 🤖 AI Usage

AI tools were used **only for learning purposes**, such as:
- 📖 Understanding system administration concepts
- 🧠 Clarifying Linux commands & logic
- ✍️ Improving documentation readability

No scripts, configuration files, or commands were copied directly.  
All implementations were written, tested, and understood manually, in respect of the 42 AI policy.

---

## 📚 Resources

- 📄 **Born2beRoot Subject (42 PDF)**  
  [https://cdn.intra.42.fr/pdf/pdf/189107/en.subject.pdf](https://cdn.intra.42.fr/pdf/pdf/189107/en.subject.pdf)

- 📘 **Debian Official Documentation**  
  [https://www.debian.org/doc/](https://www.debian.org/doc/)

- 📄 **Linux Manual Pages (man pages)**  
  [https://man7.org/linux/man-pages/](https://man7.org/linux/man-pages/)

- 🧑‍🎓 **42 Intranet Resources**  
  [https://intra.42.fr](https://intra.42.fr)  
  *(Access restricted to 42 students)*

- 🛡️ **AppArmor Documentation**  
  [https://gitlab.com/apparmor/apparmor/-/wikis/home](https://gitlab.com/apparmor/apparmor/-/wikis/home)

- 🔥 **UFW (Uncomplicated Firewall) Documentation**  
  [https://help.ubuntu.com/community/UFW](https://help.ubuntu.com/community/UFW)

- ⏱️ **Cron Documentation**  
  [https://man7.org/linux/man-pages/man8/cron.8.html](https://man7.org/linux/man-pages/man8/cron.8.html)

---

## 👨‍💻 Author

- **rhssayn**
- 🌍 42 Network — Born2beRoot
