#!/bin/bash
set -e

source ./variables.env

#colors
RED='\033[0;31m'
NC='\033[0m' #no color
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

#symbols
CHECK_SYMBOL="\033[0;32m\xE2\x9C\x94\033[0m"
WRENCH_SYMBOL="\xE2\x9C\xA8"

#timestamps
function get_timestamp {
    date +"%l:%M:%S:%3N%p"
}

function print_log_and_eval {
  local command=$1
  echo "$(get_timestamp) .......... $command" >> "$LOG_FILE"
  eval "$command"
}

function print_log {
  local command=$1
  echo "$(get_timestamp) .......... $command" >> "$LOG_FILE"
}

function arrow_loader {
  local message="$1"
  local arrows=("←" "↖" "↑" "↗" "→" "↘" "↓" "↙")

  if [[ -z "$ARROW_INDEX" ]]; then
    ARROW_INDEX=0
  fi

  printf "\r${CYAN}%s${NC} %s" "${arrows[ARROW_INDEX]}" "$message"
  ARROW_INDEX=$(( (ARROW_INDEX + 1) % ${#arrows[@]} ))
}

function is_container_running() {
  local container=$1
  local status

  status=$(docker inspect -f '{{.State.Running}}' "$container" 2>/dev/null) || {
    echo "false"
    return
  }

  if [[ "$status" == "true" ]]; then
    echo "true"
  else
    echo "false"
  fi

  print_log "$container is running: $status"
}

function validate_if_container_running() {
  local container=$1

  if [[ "$(is_container_running "$container")" == "false" ]]; then
    printf "\n"
    echo -e "${RED}container $container isn't running${NC}"
    return 1
  fi
}