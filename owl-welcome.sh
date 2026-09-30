#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 🦉 OWL IT TERMINAL
#             PROGRAMMER / IT COMMAND
# =========================================================

clear

# ─────────────────────────────────────────────────────────
# COLORS
# ─────────────────────────────────────────────────────────

RESET="\033[0m"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

BRIGHT_GREEN="\033[1;32m"
BRIGHT_YELLOW="\033[1;33m"
BRIGHT_BLUE="\033[1;34m"
BRIGHT_MAGENTA="\033[1;35m"
BRIGHT_CYAN="\033[1;36m"
BRIGHT_WHITE="\033[1;37m"

# ─────────────────────────────────────────────────────────
# SYSTEM DATA
# ─────────────────────────────────────────────────────────

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
DATE_NOW=$(date '+%d/%m/%Y')
TIME_NOW=$(date '+%H:%M:%S')

DEVICE=$(getprop ro.product.model 2>/dev/null)
ANDROID=$(getprop ro.build.version.release 2>/dev/null)

[ -z "$DEVICE" ] && DEVICE="Android Device"
[ -z "$ANDROID" ] && ANDROID="Unknown"

# CPU
CPU=$(grep -m1 'Hardware' /proc/cpuinfo 2>/dev/null | cut -d: -f2 | xargs)
[ -z "$CPU" ] && CPU="Android CPU"

# RAM
MEM_TOTAL=$(awk '/MemTotal/ {printf "%.0f", $2/1024}' /proc/meminfo)
MEM_AVAILABLE=$(awk '/MemAvailable/ {printf "%.0f", $2/1024}' /proc/meminfo)

if [ -n "$MEM_TOTAL" ] && [ -n "$MEM_AVAILABLE" ]; then
    MEM_USED=$((MEM_TOTAL-MEM_AVAILABLE))
    RAM_PERCENT=$((MEM_USED*100/MEM_TOTAL))
else
    MEM_TOTAL="?"
    RAM_PERCENT="?"
fi

# STORAGE
STORAGE=$(df -h "$HOME" 2>/dev/null | awk 'NR==2 {print $5}')
[ -z "$STORAGE" ] && STORAGE="?"

# BATTERY
BATTERY="N/A"

if command -v termux-battery-status >/dev/null 2>&1; then
    BATTERY=$(termux-battery-status 2>/dev/null | jq -r '.percentage' 2>/dev/null)
    [ "$BATTERY" = "null" ] && BATTERY="N/A"
fi

# IP
IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}' | head -1)
[ -z "$IP" ] && IP="Offline"

# UPTIME
UPTIME=$(uptime -p 2>/dev/null)
[ -z "$UPTIME" ] && UPTIME="Unknown"

# ─────────────────────────────────────────────────────────
# OWL ASCII
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}"
cat << 'OWL'
             /\_/\\
            ( o.o )
             > ^ <
        ___/|     |\___
       /   /|     |\   \
      /___/ |_____| \___\
         🦉  OWL IT  🦉
OWL
echo -e "${RESET}"

# ─────────────────────────────────────────────────────────
# TITLE
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}"
figlet -f standard "OWL IT"
echo -e "${RESET}"

echo -e "${BRIGHT_BLUE}        ─── ${BRIGHT_WHITE}PROGRAMMER MODE${BRIGHT_BLUE} ───${RESET}"
echo

# ─────────────────────────────────────────────────────────
# MAIN PROFILE
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}╔══════════════════════════════════════════════════════╗${RESET}"
echo -e "${BRIGHT_CYAN}║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}"
echo -e "${GREEN}║${RESET}     โปรแกรมเมอร์จำเป็น                           ${BRIGHT_CYAN}║${RESET}"
echo -e "${CYAN}║${RESET}     ฝ่าย IT พร้อมลุย                             ${BRIGHT_CYAN}║${RESET}"
echo -e "${YELLOW}║${RESET}     รหัส/ตำแหน่ง : นกฮูก 🦉                    ${BRIGHT_CYAN}║${RESET}"
echo -e "${BRIGHT_CYAN}║${RESET}                                                      ${BRIGHT_CYAN}║${RESET}"
echo -e "${BRIGHT_CYAN}╚══════════════════════════════════════════════════════╝${RESET}"

echo

# ─────────────────────────────────────────────────────────
# SYSTEM STATUS
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_GREEN}[+]${RESET} Initializing Termux Environment... ${GREEN}OK${RESET}"
sleep 0.15

echo -e "${BRIGHT_GREEN}[+]${RESET} Loading Programmer Profile...... ${GREEN}OK${RESET}"
sleep 0.15

echo -e "${BRIGHT_GREEN}[+]${RESET} Checking System................. ${GREEN}OK${RESET}"
sleep 0.15

echo -e "${BRIGHT_GREEN}[+]${RESET} Connecting to IT Division...... ${GREEN}OK${RESET}"
sleep 0.15

echo -e "${BRIGHT_GREEN}[+]${RESET} Firewall & Security............. ${GREEN}OK${RESET}"
sleep 0.15

echo -e "${BRIGHT_GREEN}[+]${RESET} OWL Access...................... ${BRIGHT_GREEN}GRANTED${RESET}"

echo

# ─────────────────────────────────────────────────────────
# DATE / TIME
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}┌─ SYSTEM INFORMATION ────────────────────────────────┐${RESET}"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"DATE" "$DATE_NOW"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"TIME" "$TIME_NOW"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"USER" "$USER_NAME"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"DEVICE" "$DEVICE"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"ANDROID" "$ANDROID"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"HOSTNAME" "$HOST_NAME"

printf "${BRIGHT_CYAN}│${RESET} %-12s : ${GREEN}%s${RESET}\n" \
"UPTIME" "$UPTIME"

echo -e "${BRIGHT_CYAN}└──────────────────────────────────────────────────────┘${RESET}"

echo

# ─────────────────────────────────────────────────────────
# RESOURCE USAGE
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}┌─ RESOURCE USAGE ────────────────────────────────────┐${RESET}"

printf "${BRIGHT_CYAN}│${RESET} CPU       : ${CYAN}%-30s${RESET}\n" "$CPU"

printf "${BRIGHT_CYAN}│${RESET} RAM       : ${GREEN}%s%%${RESET}\n" "$RAM_PERCENT"

printf "${BRIGHT_CYAN}│${RESET} STORAGE   : ${YELLOW}%s${RESET}\n" "$STORAGE"

printf "${BRIGHT_CYAN}│${RESET} BATTERY   : ${GREEN}%s%%${RESET}\n" "$BATTERY"

printf "${BRIGHT_CYAN}│${RESET} IP        : ${CYAN}%s${RESET}\n" "$IP"

echo -e "${BRIGHT_CYAN}└──────────────────────────────────────────────────────┘${RESET}"

echo

# ─────────────────────────────────────────────────────────
# QUICK ACCESS
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_CYAN}┌─ QUICK ACCESS ──────────────────────────────────────┐${RESET}"

echo -e "${BRIGHT_CYAN}│${RESET} ${YELLOW}cd${RESET}       : ไปยังไดเรกทอรี"
echo -e "${BRIGHT_CYAN}│${RESET} ${CYAN}ls${RESET}       : แสดงไฟล์"
echo -e "${BRIGHT_CYAN}│${RESET} ${GREEN}pkg${RESET}      : จัดการแพ็กเกจ"
echo -e "${BRIGHT_CYAN}│${RESET} ${BLUE}git${RESET}      : ระบบควบคุมเวอร์ชัน"
echo -e "${BRIGHT_CYAN}│${RESET} ${RED}nano${RESET}     : แก้ไขไฟล์"
echo -e "${BRIGHT_CYAN}│${RESET} ${MAGENTA}htop${RESET}     : ดูการใช้งานระบบ"
echo -e "${BRIGHT_CYAN}│${RESET} ${CYAN}neofetch${RESET} : ข้อมูลระบบ"

echo -e "${BRIGHT_CYAN}└──────────────────────────────────────────────────────┘${RESET}"

echo

# ─────────────────────────────────────────────────────────
# READY BOX
# ─────────────────────────────────────────────────────────

echo -e "${BRIGHT_GREEN}╔══════════════════════════════════════════════════════╗${RESET}"
echo -e "${BRIGHT_GREEN}║${RESET}                                                      ${BRIGHT_GREEN}║${RESET}"
echo -e "${BRIGHT_GREEN}║${RESET}            ${BRIGHT_GREEN}>>> SYSTEM READY <<<${RESET}               ${BRIGHT_GREEN}║${RESET}"
echo -e "${BRIGHT_GREEN}║${RESET}                                                      ${BRIGHT_GREEN}║${RESET}"
echo -e "${BRIGHT_GREEN}║${RESET}          ${BRIGHT_CYAN}>>> READY FOR MISSION <<<${RESET}            ${BRIGHT_GREEN}║${RESET}"
echo -e "${BRIGHT_GREEN}║${RESET}                                                      ${BRIGHT_GREEN}║${RESET}"
echo -e "${BRIGHT_GREEN}╚══════════════════════════════════════════════════════╝${RESET}"

echo

echo -e "${BRIGHT_CYAN}──── 🦉 OWL IT :: PROGRAMMER MODE ENABLED ────${RESET}"

echo
echo -e "${BRIGHT_BLUE}# Termux Terminal${RESET}  ${CYAN}|${RESET}  ${BRIGHT_MAGENTA}# Programmer${RESET}  ${CYAN}|${RESET}  ${GREEN}# IT Team${RESET}  ${CYAN}|${RESET}  ${YELLOW}# Owl${RESET}"

echo
echo -e "${BRIGHT_GREEN}owl@it${RESET}:${BRIGHT_BLUE}~${RESET}$ "
