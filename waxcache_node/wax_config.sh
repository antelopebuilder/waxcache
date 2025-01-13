#!/bin/bash
#conif.sh

#general
export SRC_CHAINNAME=wax

#CORE CONTRACT
export SRC_CORE_SYMBOL=" WAX" 
export SRC_CORE_TOKEN_CONTRACT=eosio.token
export SRC_CORE_BANDWIDTH_ACTION=delegatebw
export SRC_CORE_TRANSFER_ACTION=transfer

#CACHE CONTRACT
export SRC_CACHE_PROTOCOL_NAME=cache
export SRC_CACHE_CONTRACT=antelop${SRC_CACHE_PROTOCOL_NAME}

#wallet/node
export SRC_CACHENODE_WALLET_NAME=yourwalletname #👋 update me
export SRC_CACHENODE=yournodename #👋 update me
export SRC_WALLET_PASSWORD="yourwalletpassword" #👋 update me
export SRC_CACHENODE_ACTIVE_PERMISSION=$SRC_CACHENODE"@active"

#LOG FILE
export ANTELOPE_CACHE_SCRIPT_PATH=/path/to/this/script  #👋 update me
export LOG_FILENAME=${SRC_CHAINNAME}_nodelog.txt
export LOG_PATH=$ANTELOPE_CACHE_SCRIPT_PATH
export SRC_LOG_PATH_AND_NAME=$LOG_PATH$LOG_FILENAME

#ANTELOPECACHE VARIABLES
export SRC_SCOPE_CACHE_CONTRACT=$SRC_CACHE_CONTRACT
export SRC_CACHECORE_TABLE=miningstats
export SRC_CACHE_INFLATION_TABLE=inflation
export SRC_CACHE_CONFIG_TABLE=config
export SRC_CACHE_CURRENCY_STATS_TABLE=stat
export SRC_CACHE_CURRENCY_STATS_SCOPE=76176668312407

#CACHE ACTIONS
export SRC_CACHE_ACTION_MINEBLOCK=mineblock

#NODE SETTINGS
export SRC_MINING_MEMO='something cool, but equal to less than 256 bytes'       #👋 update me

#endpoints
export SRC_ENDPOINTS=(                   #👋 update me (optional)
  https://wax.greymass.com
  https://wax-history.eosdac.io
  https://api.wax.alohaeos.com
  https://wax.eosphere.io
  https://wax-hyperion.alcor.exchange
)

#INTERVALS
export SRC_SCRIPT_INTERVAL_SECONDS=1    #👋 update me (optional)
export SRC_API_TIMEOUT_SECONDS=5        #👋 update me (optional)

#COLORS & STYLES
export ALMOST_ANTELOPE_GREEN=$(tput setaf 48)  # Approximate color code for #4CFFB5
export EOS_REBRAND=$(tput setaf 202)  # Vibrant, saturated orange
export PURPLE=$(tput setaf 5)
export GREEN=$(tput setaf 2)
export RED=$(tput setaf 1)
export BLUE=$(tput setaf 4)
export ORANGE=$(tput setaf 208)
export PINK=$(tput setaf 205)
export YELLOW=$(tput setaf 3)
export CYAN=$(tput setaf 6)
export GREY=$(tput setaf 7)
export BLACK=$(tput setaf 0)
export BOLD=$(tput bold)
export BLINK=$(tput blink)
export RESET_BLINK='\e[25m'
export RESET_STYLE=$(tput sgr0)
export PROGRESS_BAR_LENGTH=10
export SEPERATOR="------------------------"
export COLUMNS=$(tput cols)

export SRC_NETWORK_COLOR=$ORANGE  #👋 update me (optional)

## other definitions
endpoint="${ENDPOINTS[0]}"
remaining=$1
spinstr='—\|/'
start_time=1
i=0
retry_interval=10
retry_count=0
start_time=$(date +%s)
