#!/bin/bash

source /path/to/this/script/waxcache_node/wax_config.sh #👋 update me

#antelopecache stuff
export ANTELOPE_CACHE_SITE="www.antelopecache.com"
export SCRIPT_SUMMARY="Automated mining script for the antelope{cache} protocol"
export DEVELOPER_MESSAGE="built with caffinated ❤️ -lc"

#█▀▄ █▀▀ █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▄░█ █▀▀ █▄█   █▀▀ █░█ █▀▀ █▀▀ █▄▀
#█▄▀ ██▄ █▀▀ ██▄ █░▀█ █▄▀ ██▄ █░▀█ █▄▄ ░█░   █▄▄ █▀█ ██▄ █▄▄ █░█
# added as a courtsey for new nodes

# Check for cleos
if ! command -v cleos &>/dev/null; then
  echo "${RED}cleos could not be found, please install EOSIO software.${RESET_STYLE}"
fi
# Check for jq
if ! command -v jq &>/dev/null; then
  echo "${RED}jq could not be found, please install jq.${RESET_STYLE}"
fi

#█░░ █▀█ █▀▀ █▀▀ █ █░░ █▀▀
#█▄▄ █▄█ █▄█ █▀░ █ █▄▄ ██▄

if [ -e "$SRC_LOG_PATH_AND_NAME" ]; then
  echo "${GREEN}Log file $SRC_LOG_PATH_AND_NAME exists.${RESET_STYLE}"
else
  echo "${GREEN}Log file  $SRC_LOG_PATH_AND_NAME does not exist. Creating a new one...${RESET_STYLE}"
  touch "$SRC_LOG_PATH_AND_NAME"
  echo "${GREEN}Saved file here: ${SRC_LOG_PATH_AND_NAME}${RESET_STYLE}"
fi

echo "${SRC_NETWORK_COLOR}"
echo "██████████████████████████████████████████████████████████████████████████████"
echo "██████████████████████████████████████████████████████████████████████████████"
echo "                     ░██╗░░░░░░░██╗░█████╗░██╗░░██╗                           "
echo "                     ░██║░░██╗░░██║██╔══██╗╚██╗██╔╝                           "
echo "                     ░╚██╗████╗██╔╝███████║░╚███╔╝░                           "
echo "                     ░░████╔═████║░██╔══██║░██╔██╗░                           "
echo "                     ░░╚██╔╝░╚██╔╝░██║░░██║██╔╝╚██╗                           "
echo "                     ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝                           "
echo "  ░█████╗░░█████╗░░█████╗░██╗░░██╗███████╗███╗░░██╗░█████╗░██████╗░███████╗   "
echo "  ██╔══██╗██╔══██╗██╔══██╗██║░░██║██╔════╝████╗░██║██╔══██╗██╔══██╗██╔════╝   "
echo "  ██║░░╚═╝███████║██║░░╚═╝███████║█████╗░░██╔██╗██║██║░░██║██║░░██║█████╗░░   "
echo "  ██║░░██╗██╔══██║██║░░██╗██╔══██║██╔══╝░░██║╚████║██║░░██║██║░░██║██╔══╝░░   "
echo "  ╚█████╔╝██║░░██║╚█████╔╝██║░░██║███████╗██║░╚███║╚█████╔╝██████╔╝███████╗   "
echo "  ░╚════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚══╝░╚════╝░╚═════╝░╚══════╝   "
echo "███████████████████████████████████████████████████████████████████████████████"
echo "███████████████████████████████████████████████████████████████████████████████"
printf "%*s\n" $(((${#SCRIPT_SUMMARY} + $COLUMNS) / 2)) "$SCRIPT_SUMMARY"
echo ""
printf "%*s\n" $(((${#DEVELOPER_MESSAGE} + $COLUMNS) / 2)) "$DEVELOPER_MESSAGE"
printf "%*s\n" $(((${#ANTELOPE_CACHE_SITE} + $COLUMNS) / 2)) "$ANTELOPE_CACHE_SITE"

echo ""
echo "( ＾◡＾)っ  Welcome $SRC_CACHENODE, lets get ready for some mining ( ＾◡＾)っ "
sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo ""
echo "Before we dive into mining, let's make sure we've got all our gear checked and ready!"
sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo ""

echo "SCRIPT NOTE:"
echo "This script assumes that you have already installed the necessary dependencies, including 'eosio' and 'jq'. It also presumes you have created a wallet, set up a relevant Antelope network account, updated this script with your wallet directory, and have access to your private keys. Ensure your account has sufficient balances for the operations intended by this script."

echo ""
sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo ""
echo "DISCLAIMER: "
echo "By interacting with this script, contract, site, or any actions directly or indirectly associated with this contract or others, you, the user, acknowledge and accept all risks associated with these interactions. You expressly agree that you are solely responsible for any losses or damages that may arise from such interactions. This contract is experimental, this script is created as a courtsey, and all interactions are at your own risk. Additionally, you confirm that you have reviewed and accepted the Ricardian clauses/contracts associated with this contract prior to your engagement. You hereby relinquish any right to hold anyone but yourself accountable for any outcomes resulting from the use of this contract or related actions."

echo ""

read -t 1 -n 10000 discard
read -p "${SRC_NETWORK_COLOR}${BOLD}Would you like to read the raw contract abi & ricardian contract/clauses?${BLINK}(${GREEN}y${SRC_NETWORK_COLOR}/${RED}n${SRC_NETWORK_COLOR}):${RESET_STYLE}" request_ricardian
echo -ne "\033[1A\033[2K"

echo "${SRC_NETWORK_COLOR}"

if [[ $request_ricardian == "y" ]]; then
  echo "gettin that abi 📜 for you..."
  sleep $SRC_SCRIPT_INTERVAL_SECONDS
  echo "✦ . 　˚　　. . 　　.　　　　.　　　　* .　　. ✦ 　˚ . ✦ ✦　ﾟ　　.　　　.  　　. ✦  . ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　　　 ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　 ✦ 　　　˚ 　　.　　　　. ✦ 　🌕　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　 ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　　　,　　　　　. .    　　. 　　.　　　. ✦ 　   　, 　　, . .　　　 　. ˚   . ,　　　　　　　. .    ✦ ✦　　　　.　　　　. ✦ ✦ .. 　　　˚　　　　. 　 　　. 　 　　.　　　　　　.　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　.　　　ﾟ　  　　　* .　　　　. ✦ 　˚ . ✦ ✦　ﾟ　　　　　.　　　　　. , " 　　　　　　　　　　　　　　
  sleep $SRC_SCRIPT_INTERVAL_SECONDS
  cleos -u $SRC_ENDPOINTS get abi $SRC_CACHE_CONTRACT

  echo "✦ . 　˚　　. . 　　.　　　　.　　　　* .　　. ✦ 　˚ . ✦ ✦　ﾟ　　.　　　.  　　. ✦  . ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　　　 ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　 ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　 ✦ 　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　　　.　　　ﾟ　 　　　.　　　　　✦ 　　　,　　　　　. .    　　. 　　.　　　. ✦ 　   　, 　　, . .　　　 　. ˚   . ,　　　　　　　. .    ✦ ✦　　　　.　　　　. ✦ ✦ .. 　　　˚　　　　. 　 　　. 　 　　.　　　　　　.　　　˚ 　　.　　　　. ✦ 　　　, .　　　　　.　　　ﾟ　  　　　* .　　　　. ✦ 　˚ . ✦ ✦　ﾟ　　　　　.　　　　　. , " 　　　　　　　　　　　　　　
  echo ""
  echo "      ╱|、    "
  echo "     (˚ˎ 。7    "
  echo "     |、˜〵    "
  echo "     じしˍ,)ノ ... end of abi..."
  echo ""
  echo $SEPERATOR
else
  sleep $SRC_SCRIPT_INTERVAL_SECONDS
  echo "Opted out requesting abi"
fi

sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo ""

echo "
█▀ ▀█▀ ▄▀█ ▀█▀ █▀▀   █▀█ █▀▀   █▀▀ ▄▀█ █▀▀ █░█ █▀▀
▄█ ░█░ █▀█ ░█░ ██▄   █▄█ █▀░   █▄▄ █▀█ █▄▄ █▀█ ██▄
"
echo ""

echo "Just some useful $SRC_CACHE_CONTRACT tables and associated data for your convienence."

echo ""

current_era=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHE_INFLATION_TABLE --index 2 --key-type i64 --limit 1 --reverse 2>/dev/null | jq -r '.rows[0].era // empty' 2>/dev/null)
current_block_subsidy=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHE_INFLATION_TABLE --limit 21 2>/dev/null | jq -r '[.rows[]] | max_by(.time_reached) | .block_subsidy // empty')

echo "current block subsidy: $current_block_subsidy"

echo "$SRC_NETWORK_COLOR$SRC_CACHECORE_TABLE table"
cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE 2>/dev/null | jq -r '.rows[0] // empty' 2>/dev/null
sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo "$SRC_NETWORK_COLOR$SRC_CACHE_CONFIG_TABLE table"
cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHE_CONFIG_TABLE 2>/dev/null | jq -r '.rows[0] // empty' 2>/dev/null
sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo "$SRC_NETWORK_COLOR$SRC_CACHE_CURRENCY_STATS_TABLE table"
cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_CACHE_CURRENCY_STATS_SCOPE $SRC_CACHE_CURRENCY_STATS_TABLE 2>/dev/null | jq -r '.rows[0]// empty' 2>/dev/null
sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo "$SRC_NETWORK_COLOR"
echo "
▄▀█ █▀▀ █▀▀ ▀█▀   █▀▄ █▀▀ ▀█▀ ▄▀█ █ █░░ █▀
█▀█ █▄▄ █▄▄ ░█░   █▄▀ ██▄ ░█░ █▀█ █ █▄▄ ▄█
"
echo "$SRC_CACHENODE"
echo ""
echo "$SRC_NETWORK_COLOR"
cleos --url $SRC_ENDPOINTS get account $SRC_CACHENODE

sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo ""

echo "
█▀ █▀▀ █▀█ █ █▀█ ▀█▀   █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
▄█ █▄▄ █▀▄ █ █▀▀ ░█░   ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█
"

echo "${SRC_NETWORK_COLOR}"
# Header
printf "%-45s %-20s\n" "Setting" "Value"
printf "%-45s %-20s\n" "-------" "-----"

# Data
printf "%-50s %-20s\n" "⚙️  SRC_SCRIPT_INTERVAL_SECONDS:" "$SRC_SCRIPT_INTERVAL_SECONDS"
printf "%-50s %-20s\n" "⚙️  SRC_API_TIMEOUT_SECONDS:" "$SRC_API_TIMEOUT_SECONDS"
printf "%-50s %-20s\n" "⚙️  SRC_CACHENODE_WALLET_NAME:" "$SRC_CACHENODE_WALLET_NAME"
printf "%-50s %-20s\n" "⚙️  SRC_MINING_MEMO:" "$SRC_MINING_MEMO"

echo ""
sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo "
█▀▀ █▄░█ █▀▄ █▀█ █▀█ █ █▄░█ ▀█▀   █▀█ █ █▄░█ █▀▀   █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀
██▄ █░▀█ █▄▀ █▀▀ █▄█ █ █░▀█ ░█░   █▀▀ █ █░▀█ █▄█   ▄█ ░█░ █▀█ ░█░ █▄█ ▄█
"
# Print table header
echo "---------------------------------------------------------------------------------"
printf "%-40s %-20s %-20s\n" "Endpoint" "Status" "Ping Time (ms)"
echo "---------------------------------------------------------------------------------${NC}"

# Iterate over each endpoint and ping them
for endpoint in "${SRC_ENDPOINTS[@]}"; do
  # Extract the hostname from the URL to use in the ping command. This strips away the protocol part and any path or query strings.
  host=$(echo "$endpoint" | sed -E 's|https?://([^/]+).*|\1|')

  # Ping the host and extract the average time
  ping_output=$(ping -c 1 $host 2>&1) # Ping only once
  if [[ $? -eq 0 ]]; then
    # If ping was successful, extract the average ping time
    ping_time=$(echo "$ping_output" | grep 'time=' | sed -E 's/.*time=([0-9.]+) ms.*/\1/')
    status="Online"
    color=$GREEN
  else
    ping_time="N/A"
    status="Offline"
    color=$RED
  fi

  # Print each row with the results
  echo -n "${color}"
  printf "%-40s %-20s %-20s\n" "$endpoint" "$status" "$ping_time"
  echo -n "${NC}"
done

echo -e "${SRC_NETWORK_COLOR}---------------------------------------------------------------------------------${NC}"

echo ""
sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo " 
█░█░█ ▄▀█ █░░ █░░ █▀▀ ▀█▀   █▀▄▀█ █▀▀ █▀▄▀█ ▀█▀
▀▄▀▄▀ █▀█ █▄▄ █▄▄ ██▄ ░█░   █░▀░█ █▄█ █░▀░█ ░█░
"

echo ""
cleos wallet open -n $SRC_CACHENODE_WALLET_NAME
echo -e "${BLUE}other wallets on this pc:"
cleos wallet list
echo "${SRC_NETWORK_COLOR}"
echo ""

read -t 1 -n 10000 discard
read -p "${SRC_NETWORK_COLOR}${BOLD}Unlock $SRC_CACHENODE_WALLET_NAME 🔐 ? ${BLINK}(${GREEN}y${SRC_NETWORK_COLOR}/${RED}n${SRC_NETWORK_COLOR}):${RESET_STYLE}" use_wallet
echo -ne "\033[1A\033[2K"

if [[ $use_wallet == "y" ]]; then
  # Check if the wallet exists
  if cleos wallet list | grep -q "$SRC_CACHENODE_WALLET_NAME"; then
    echo "${GREEN}Wallet '$SRC_CACHENODE_WALLET_NAME' exists.${RESET_STYLE}"
    cleos wallet unlock -n $SRC_CACHENODE_WALLET_NAME --password $SRC_WALLET_PASSWORD
  else
    echo "${RED}Wallet '$SRC_CACHENODE_WALLET_NAME' does not exist.${RESET_STYLE}"
    echo "${RED}Please create a wallet, and import private keys into this script and try again ${RESET_STYLE}"
    exit
  fi
else
  echo "${RED}DECLINED TO UNLOCK WALLET${RESET_STYLE}"
  echo "$use_wallet"
  exit
fi

sleep $SRC_SCRIPT_INTERVAL_SECONDS
echo "$SRC_NETWORK_COLOR"

echo "
█▄░█ █▀█ █▀▄ █▀▀   ▄▀█ █▀▀ ▀█▀ █ █░█ ▄▀█ ▀█▀ █ █▀█ █▄░█
█░▀█ █▄█ █▄▀ ██▄   █▀█ █▄▄ ░█░ █ ▀▄▀ █▀█ ░█░ █ █▄█ █░▀█
"

read -t 1 -n 10000 discard
read -p "${SRC_NETWORK_COLOR}${BOLD}🤖 Ready to activate node? ⚒️ ${BLINK}(${GREEN}y${SRC_NETWORK_COLOR}/${RED}n${SRC_NETWORK_COLOR}):${RESET_STYLE}" worker_activation
echo -ne "\033[1A\033[2K"

if [[ $worker_activation == "y" ]]; then
  echo "${GREEN}NODE ACTIVATED${RESET_STYLE}"
else
  echo "${RED}DECLINED TO ACTIVATE NODE ${RESET_STYLE}"
  echo "${RED}RELOCKING WALLET ${RESET_STYLE}"
  echo "${RED}EXITING SCRIPT ${RESET_STYLE}"
  cleos wallet lock -n $SRC_CACHENODE_WALLET_NAME
  exit
fi

echo ""
echo "${SRC_NETWORK_COLOR}"

echo "        ♡⸜(˶˃ ᵕ ˂˶)⸝♡      "
echo ""
echo " ⛏️ $CHAINNAME$SRC_CACHE_CONTRACT node initiated ⛏️ "
echo "
⠀⠀⠀⠀⠀⠠⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣷⣦⡀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BLINK}⢀⣴${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣇⠘⠿⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀${BLINK}⣰⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠙⢿⣷⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀${BLINK}⣾⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⠆⠀⠙⢿⣿⣿⡄⠀${BLINK}⠈⣿⡟⠀⠀⢸⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⠟⠁⠀⠀⠀⠈⠻⣿⣷⠀⠀${BLINK}⣿⠁⠀⠀⠀⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀⠀⣠⣾⣿⠟⠁⠀${BLINK}⢠⣦⣄${RESET_STYLE}${SRC_NETWORK_COLOR}⠀⠀⠀⠘⢿⡇⠀${BLINK}⠁⠀⠀⠀⠀⢹⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⢠⣾⣿⠟⠁⠀⠀⠀${BLINK}⠉⠙⠛⠛⠒${RESET_STYLE}${SRC_NETWORK_COLOR}⠀ ⠈⠃⠀⠀${BLINK} ⣴⣶⣾⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⢀⣴⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀${BLINK}⢀⣠⣴⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠙⠁⠀⠀⠀⠀⠀⠀⠀${BLINK}⢀⣠⣴⣾⣿⣿⡇⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BLINK} ⢸⣿⣿⣿⣿⣿⣃⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀⠀${BLINK}⣤⣤⣄⣀⡀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣶⣤⡄⠀⠀⠀⣠⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀${BLINK}⢀⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢰⣿⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀${BLINK}⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣽⣿⣿⣿${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
⠀⠀⠀${BLINK}⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛${RESET_STYLE}${SRC_NETWORK_COLOR}⠀
"
echo ""

sleep $SRC_SCRIPT_INTERVAL_SECONDS

echo "${SRC_NETWORK_COLOR}$SEPERATOR${RESET_STYLE}"

check_cache_contract_existance() {
  local retry_count=0

  while true; do
    current_time_point=$(date +%s)
    echo -e "${SRC_NETWORK_COLOR}🔭🦔 Looking for $SRC_CACHE_CONTRACT contract... Attempt $((retry_count + 1)) @ $current_time_point ${RESET_STYLE}"

    # Check for contract and block time existence without outputting to screen
    output=$(cleos -u $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE 2>&1)
    block_time_existence=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE 2>/dev/null | jq -r '.rows[0].nxt_block_time // empty' 2>/dev/null)

    # Check for specific error message and if block time is zero or empty
    if [[ "$output" == *"Fail to retrieve account for"* ]] || [[ -z "$block_time_existence" ]] || [[ "$block_time_existence" -eq 0 ]]; then
      echo "$output"
      ((retry_count++))
      echo -e "${RED}(｡•́︿•̀｡) Waiting $retry_interval seconds before retrying...please make sure the genesis block has been mined first${RESET_STYLE}"
      sleep $retry_interval

      for i in {1..6}; do echo -en "\033[1A\033[K"; done # Move cursor up and clear line
    else
      echo "${GREEN}(⌐■_■) Contract detected 🔗. Proceeding with mining operations."
      break
    fi
  done
}

fetch_api() {
  while true; do
    if ! timeout $SRC_API_TIMEOUT_SECONDS cleos --url "$endpoint" get info &>/dev/null; then
      echo "${RED}😞 Failed to connect to api endpoint: ${endpoint} ${RESET_STYLE}"
      for endpoint in "${SRC_ENDPOINTS[@]}"; do
        if timeout $SRC_API_TIMEOUT_SECONDS cleos --url "$endpoint" get info &>/dev/null; then
          echo "${GREEN}😃 Successfully connected to api endpoint: $endpoint! ${RESET_STYLE}"
          SRC_ENDPOINTS="$endpoint"
          echo ""
          return
        else
          echo "${RED}😡 Failed to connect to api endpoint: $endpoint ${RESET_STYLE}"
          sleep $retry_interval
        fi
      done
    else
      return
    fi
    echo "${RED}All SRC_ENDPOINTS failed. Retrying...${RESET_STYLE}"
    sleep $retry_interval
  done
}

check_cache_contract_existance
#█████████████████████████████████████████████████████████████████
#▒█▀▀▀█ ▒█▀▀█ ▒█▀▀█ ▀█▀ ▒█▀▀█ ▀▀█▀▀ 　 ▒█░░░ ▒█▀▀▀█ ▒█▀▀▀█ ▒█▀▀█
#░▀▀▀▄▄ ▒█░░░ ▒█▄▄▀ ▒█░ ▒█▄▄█ ░▒█░░ 　 ▒█░░░ ▒█░░▒█ ▒█░░▒█ ▒█▄▄█
#▒█▄▄▄█ ▒█▄▄█ ▒█░▒█ ▄█▄ ▒█░░░ ░▒█░░ 　 ▒█▄▄█ ▒█▄▄▄█ ▒█▄▄▄█ ▒█░░░
#█████████████████████████████████████████████████████████████████

export seconds_left_to_next_block=0

value=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE | jq '.rows[0].nxt_block_time')
currentblock=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE | jq '.rows[0].current_block')

while true; do

  # Ensure that 'seconds_left_to_next_block' and 'value' are properly initialized and numeric before proceeding
  if [ -z "$seconds_left_to_next_block" ] || ! [[ "$seconds_left_to_next_block" =~ ^-?[0-9]+$ ]]; then
    seconds_left_to_next_block=0
  fi

  if [ -z "$value" ] || ! [[ "$value" =~ ^-?[0-9]+$ ]]; then
    echo -en "\033[2K\r"
    fetch_api
  fi

  if [ "$seconds_left_to_next_block" -le 0 ]; then
    echo -en "\033[2K\r"
    fetch_api
    value=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE | jq -r '.rows[0].nxt_block_time // empty')
    currentblock=$(cleos --url $SRC_ENDPOINTS get table $SRC_CACHE_CONTRACT $SRC_SCOPE_CACHE_CONTRACT $SRC_CACHECORE_TABLE | jq -r '.rows[0].current_block')

  fi

  echo "$SRC_NETWORK_COLOR"

  current_time_point_sec_sinc_epoch=$(date +%s)
  time_left=$(expr $value - $current_time_point_sec_sinc_epoch)
  seconds_left_to_next_block=$time_left

  #############################
  #🄻🄾🄰🄳🄸🄽🄶 🄰🄽🄸🄼🄰🅃🄸🄾🄽
  #############################

  char="${spinstr:$i:1}"
  elapsed=$(($(date +%s) - $start_time))
  total=$(($value - $start_time))
  percent=$((elapsed * 100 / total))

  # Calculate the number of "=" characters needed
  num_equals=$((percent * 10 / 100))

  # Calculate the number of " " characters needed
  num_spaces=$((10 - num_equals))
  bar="[$(printf '%*s' "$num_equals" | tr ' ' '█')█$(printf '%*s' "$num_spaces" | tr ' ' '▒')] "
  remaining=$((($total - $elapsed) / 2)) # divide by 2 for smoother animation #LIKELY NOT NEEEDED 04.01.23

  if [ "$time_left" -lt 1 ]; then
    echo -en "\033[K\033[1A"
  else
    echo -en "\033[K\033[1A"
    echo -ne "\r${SRC_NETWORK_COLOR}${char} {$SRC_CHAINNAME}${SRC_CACHE_PROTOCOL_NAME} | Block #${currentblock}: ETA ${time_left}s ${char} ${bar} ${percent}% ( ▐▐ with 'p') ${RESET_STYLE}"
  fi
  sleep 0.5
  ((time_left--))
  ((i = (i + 1) % 4))

  #█▀▄▀█ █ █▄░█ █▀▀ █▄▄ █░░ █▀█ █▀▀ █▄▀
  #█░▀░█ █ █░▀█ ██▄ █▄█ █▄▄ █▄█ █▄▄ █░█

  if [ $current_time_point_sec_sinc_epoch -gt $value ]; then
    echo -en "\033[K\033[1A"

    cleos wallet unlock -n $SRC_CACHENODE_WALLET_NAME --password $SRC_WALLET_PASSWORD 2>/dev/null
    cleos -u $SRC_ENDPOINTS push action $SRC_CACHE_CONTRACT $SRC_CACHE_ACTION_MINEBLOCK "[\"$SRC_CACHENODE\", \"$SRC_MINING_MEMO\"]" -p $SRC_CACHENODE_ACTIVE_PERMISSION 2>&1 | tee -a "$SRC_LOG_PATH_AND_NAME"

    ram_bytes_available=$(cleos -u $SRC_ENDPOINTS get account $SRC_CACHENODE -j | jq '.ram_quota - .ram_usage')
    net_bytes_avaliable=$(cleos -u $SRC_ENDPOINTS get account $SRC_CACHENODE -j | jq '.net_limit.available')
    cpu_nanoseconds_available=$(cleos -u $SRC_ENDPOINTS get account $SRC_CACHENODE -j | jq '.cpu_limit.available')

    utc_date=$(date -u +"%Y-%m-%d")
    utc_time=$(date -u +"%H:%M:%S")
    start_time=$value+1

    #█▀█ █▀▀ █▀ █▀█ █░█ █▀█ █▀▀ █▀▀   █░█ █▀█ █▀▄ ▄▀█ ▀█▀ █▀▀
    #█▀▄ ██▄ ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄   █▄█ █▀▀ █▄▀ █▀█ ░█░ ██▄

    echo "${PINK}🔋 RESOURCE MANAGER UDPATE:"
    echo "${PINK}RAM bytes available: $ram_bytes_available"
    echo "NET bytes available: $net_bytes_avaliable"
    echo "CPU nanoseconds (µs) available: $cpu_nanoseconds_available ${RESET_STYLE}"
    echo "${SRC_NETWORK_COLOR}$SEPERATOR${RESET_STYLE}"
    echo ""
  fi

  #█▀█ ▄▀█ █░█ █▀ █▀▀   █▀ █▀▀ █▀█ █ █▀█ ▀█▀
  #█▀▀ █▀█ █▄█ ▄█ ██▄   ▄█ █▄▄ █▀▄ █ █▀▀ ░█░
  # Check if the user presses 'p' to pause

  read -n 1 -t 1 key
  if [ "$key" = 'p' ]; then
    echo -e "\r\033[K"
    echo ""
    echo -e "${RED}\n▐▐  Press 'c' to resume mining ▐▐${RESET_STYLE}"
    # Wait for the user to press 'c' to continue
    while true; do
      read -n 1 key
      if [ "$key" = 'c' ]; then
        echo -e "\r\033[K"
        echo -e "${GREEN}\n⚒️ Mining Resumed ⚒️${RESET_STYLE}"
        echo ""
        sleep $SRC_SCRIPT_INTERVAL_SECONDS
        break
      else
        read -t 1 -n 10000 discard
      fi
    done
  fi

done
