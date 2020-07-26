[<img src="https://camo.githubusercontent.com/fe9eb7a4c63312374274b645cf5e37fc75337dd1/68747470733a2f2f692e696d6775722e636f6d2f45384c746b41612e706e67" width="300" title="Komodo Platform">](https://komodoplatform.com)  

Run [Komodo](https://github.com/KomodoPlatform/komodo) daemon in a Docker container. This **does not** build the project from source but fetch and install the latest Linux release instead.

*Note: I am not related to Komodo or SuperNET. This project is still in development, use it at your own risk!*

### Quick start

1. Edit komodo.conf with your configuration as needed
2. Build: `docker build -t naei/komodo .`  
3. Run: `docker run -dt -p 7770-7771:7770-7771 --name komodo -v ~/.komodo:/root/.komodo naei/komodo`  
  (Replace `~/.komodo` by the path on your host in which you want to sync all your wallet data)  
  To attach container: `docker exec -it komodo /bin/bash`  


### Useful commands

`./komodo-cli help`  
`./komodo-cli help <command_name>`

##### List the addresses of the current account ("" by default)
`./komodo-cli getaddressesbyaccount ""`

##### Get the private key of one of your wallet address 
`./komodo-cli dumpprivkey <your_wallet_address>`

##### Validate an address 
`./komodo-cli validateaddress <kmd_address>`

##### Import an existing account into your wallet
`./komodo-cli importprivkey <your_private_key> <"optional_account_name">`

##### Check the blockchain sync advancement
If the "blocks" number from `./komodo-cli getinfo` is equal to the "height" number of http://kmd.explorer.supernet.org/api/blocks?limit=1 the blockchain is fully sync.

##### Get the wallet info
`./komodo-cli getwalletinfo`
Note: If the blockchain is not fully sync, the data here might be wrong

##### List balances by receiving address.
`./src/komodo-cli listreceivedbyaddress 0 true`

### What is the Komodo Platform ?

> *The Komodo Platform is a cryptocurrency project that focuses on providing anonymity through zero knowledge proofs and security through a novel Delayed Proof of Work (dPoW) protocol. The Komodo Platform was forked from Zcash by the SuperNET team and it is the evolution of the BitcoinDark cryptocurrency.* ([source](https://en.bitcoinwiki.org/wiki/Komodo))

### Resources

- https://komodoplatform.com/
- https://twitter.com/komodoplatform
- https://github.com/KomodoPlatform/komodo
- https://www.reddit.com/r/komodoplatform/