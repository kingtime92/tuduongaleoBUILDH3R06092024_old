#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp6YgcENUjxsgyUdyJrrFDTqNx5haNE4Tk6aAECP5AwewQ
ADDRESS=aleo16mstx5rfya04gxwgmrp4ta4f57ntmr6d998yy09vh0ed4zpgzyzs6tr6sn
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run finish "{
  owner: aleo16mstx5rfya04gxwgmrp4ta4f57ntmr6d998yy09vh0ed4zpgzyzs6tr6sn.private,
  bidder: aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk.private,
  amount: 41u64.private,
  is_winner: false.private,
  _nonce: 3311415611996398874992028486979183504969562255228010971421927860741198372967group.public
}"