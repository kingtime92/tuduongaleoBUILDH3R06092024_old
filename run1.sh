#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of three parties.

The private key and address of the first bidder.
private_key: APrivateKey1zkp78MpWEMmbq5smzQsaJf7zt8Ysy9a46zuEYPh3gqGYoPG
address : aleo13vlrfw2xxjutu95h40xjwvm6mk0l08a534gxzm8m23uly9yzxgzs5r79nu

The private key and address of the second bidder.
private_key: APrivateKey1zkpJL7Jti3Gsj9EU6LCspdsbE3HjCNmJmihApJAXSXfnLTR
address: aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk

The private key and address of the auctioneer.
private_key: APrivateKey1zkp6YgcENUjxsgyUdyJrrFDTqNx5haNE4Tk6aAECP5AwewQ
address: aleo16mstx5rfya04gxwgmrp4ta4f57ntmr6d998yy09vh0ed4zpgzyzs6tr6sn
"

echo "
Let's start an auction!

###############################################################################
########                                                               ########
########           Step 0: Initialize a new 2-party auction            ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |         |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Let's take the role of the first bidder - we'll swap in the private key and address of the first bidder to .env.

# We're going to run the transition function "place_bid", slotting in the first bidder's public address and the amount that is being bid. The inputs are the user's public address and the amount being bid.

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp78MpWEMmbq5smzQsaJf7zt8Ysy9a46zuEYPh3gqGYoPG
ADDRESS=aleo13vlrfw2xxjutu95h40xjwvm6mk0l08a534gxzm8m23uly9yzxgzs5r79nu
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run place_bid $ADDRESS 39u64


echo "
###############################################################################
########                                                               ########
########         Step 1: The first bidder places a bid of 10           ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |  39    |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

#

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpJL7Jti3Gsj9EU6LCspdsbE3HjCNmJmihApJAXSXfnLTR
ADDRESS=aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

# Have the second bidder place a bid of 90.
leo run place_bid $ADDRESS 41u64

echo "
###############################################################################
########                                                               ########
########          Step 2: The second bidder places a bid of 90         ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   39    |   41    |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Now, let's take the role of the auctioneer, so we can determine which bid wins. Let's swap our keys to the auctioneer and run the resolve command on the output of the two bids from before. The resolve command takes the two output records from the bids as inputs and compares them to determine which bid wins.


# leo run resolve "{
#    owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#   bidder: aleo13vlrfw2xxjutu95h40xjwvm6mk0l08a534gxzm8m23uly9yzxgzs5r79nu.private,
#     amount: 10u64.private,
#     is_winner: false.private,
#     _nonce: 4668394794828730542675887906815309351994017139223602571716627453741502624516group.public
# }" "{
#    owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#   bidder: aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk.private,
#     amount: 41u64.private,
#     is_winner: false.private,
#     _nonce: 5952811863753971450641238938606857357746712138665944763541786901326522216736group.public
# }"


# Swaps in the private key of the auctioneer to .env.
# echo "
# NETWORK=testnet
# PRIVATE_KEY=APrivateKey1zkp6YgcENUjxsgyUdyJrrFDTqNx5haNE4Tk6aAECP5AwewQ
# " > .env

# # Have the auctioneer select the winning bid.
# leo run resolve "{
#         owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#         bidder: aleo13vlrfw2xxjutu95h40xjwvm6mk0l08a534gxzm8m23uly9yzxgzs5r79nu.private,
#         amount: 39u64.private,
#         is_winner: false.private,
#         _nonce: 4668394794828730542675887906815309351994017139223602571716627453741502624516group.public
#     }" "{
#         owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#         bidder: aleo1esqchvevwn7n5p84e735w4dtwt2hdtu4dpguwgwy94tsxm2p7qpqmlrta4.private,
#         amount: 41u64.private,
#         is_winner: false.private,
#         _nonce: 5952811863753971450641238938606857357746712138665944763541786901326522216736group.public
#     }"

# echo "
# ###############################################################################
# ########                                                               ########
# ########     Step 3: The auctioneer determines the winning bidder      ########
# ########                                                               ########
# ########                -------------------------------                ########
# ########                |  OPEN   |    A    |  → B ←  |                ########
# ########                -------------------------------                ########
# ########                |   Bid   |   39    |  → 41 ← |                ########
# ########                -------------------------------                ########
# ########                                                               ########
# ###############################################################################
# "

# echo "
# Keeping the key environment the same since we're still the auctioneer, let's finalize the auction and label the winning output as the winner. The finish transition takes the winning output bid as the input and marks it as such.
# Swap in the private key of the second bidder to .env.
# echo "
# NETWORK=testnet
# PRIVATE_KEY=APrivateKey1zkpJL7Jti3Gsj9EU6LCspdsbE3HjCNmJmihApJAXSXfnLTR
# ENDPOINT=https://api.explorer.aleo.org/v1
# " > .env

# leo run finish "{
#    owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#   bidder: aleo1hzc65jht40czugm3m0cyxsa5xy7lys4khmvvljzn8uzec7p5uqyqq4p5hk.private,
#   amount: 41u64.private,
#   is_winner: false.private,
#   _nonce: 3179340044458851034345982069704482938035049861938661083177828778882449319356group.public
# }"
# # Have the auctioneer finish the auction.
# leo run finish "{
#         owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.private,
#         bidder: aleo1esqchvevwn7n5p84e735w4dtwt2hdtu4dpguwgwy94tsxm2p7qpqmlrta4.private,
#         amount: 41u64.private,
#         is_winner: false.private,
#         _nonce: 5952811863753971450641238938606857357746712138665944763541786901326522216736group.public
#     }"

# echo "
# ###############################################################################
# ########                                                               ########
# ########              The auctioneer completes the auction.            ########
# ########                                                               ########
# ########                -------------------------------                ########
# ########                |  CLOSE  |    A    |  → B ←  |                ########
# ########                -------------------------------                ########
# ########                |   Bid   |   39    |  → 41 ← |                ########
# ########                -------------------------------                ########
# ########                                                               ########
# ###############################################################################
# "
