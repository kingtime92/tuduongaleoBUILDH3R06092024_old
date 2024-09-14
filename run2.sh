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

leo run resolve "{
  owner: aleo16mstx5rfya04gxwgmrp4ta4f57ntmr6d998yy09vh0ed4zpgzyzs6tr6sn.private,
  bidder: aleo13vlrfw2xxjutu95h40xjwvm6mk0l08a534gxzm8m23uly9yzxgzs5r79nu.private,
  amount: 39u64.private,
  is_winner: false.private,
  _nonce: 3192756462016159377328010473124393846434221881590715818163774408860454476673group.public
}" "{
  owner: aleo16mstx5rfya04gxwgmrp4ta4f57ntmr6d998yy09vh0ed4zpgzyzs6tr6sn.private,
  bidder: aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk.private,
  amount: 41u64.private,
  is_winner: false.private,
  _nonce: 700603318556194088089857075280035664435662572484393152947680020311036560101group.public
}"