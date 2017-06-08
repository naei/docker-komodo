[<img src="https://user-images.githubusercontent.com/10995534/26951304-35f65c0a-4cd3-11e7-8ee0-e6f256f0344f.png" width="300" title="Komodo Platform">](https://komodoplatform.com)  

Run [Komodo](https://github.com/jl777/komodo) daemon in a Docker container.

*Note: I am not related to Komodo or SuperNET. This repository is a personnal project with few notes in order to help people to start with Komodo. This is still in development, use it at your own risk!*

### Quick start

1. Edit komodo.conf with your configuration if necessary
2. Build `docker build -t naei/komodo .`
3. Run `docker run -it -v ~/.kmd:/root/.komodo naei/komodo`  
   (replace `~/.kmd` by the path in your host in which you want to sync all your data)

### Useful commands

> *There is no transactions commands here as it has not been tested yet.*

`./src/komodo-cli help`  
`./src/komodo-cli help <command_name>`

##### List the addresses of the current account ("" by default)
`./src/komodo-cli getaddressesbyaccount ""`

##### Get the private key of one of your wallet address 
`./src/komodo-cli dumpprivkey <your_wallet_address>`

##### Validate an address 
`./src/komodo-cli validateaddress <kmd_address>`

##### Import an existing account into your wallet
`./src/komodo-cli importprivkey <your_private_key> <"optional_account_name">`

##### Check the blockchain sync advancement
If the "blocks" number from `./src/komodo-cli getinfo` is equal to the "height" number of http://kmd.explorer.supernet.org/api/blocks?limit=1 the blockchain is fully sync.

##### Get the wallet info
./src/komodo-cli getwalletinfo
Note: If the blockchain is not fully sync, the data here might be wrong

##### List balances by receiving address.
`./src/komodo-cli listreceivedbyaddress 0 true`

### What is the Komodo Platform ?

> *The Komodo Platform is a cryptocurrency project that focuses on providing anonymity through zero knowledge proofs and security through a novel Delayed Proof of Work (dPoW) protocol. The Komodo Platform was forked from Zcash by the SuperNET team and it is the evolution of the BitcoinDark cryptocurrency.* ([source](https://www.cryptocompare.com/coins/guides/what-is-the-komodo-platform))

### Resources

##### Komodo
   - https://komodoplatform.com/
   - https://twitter.com/komodoplatform
   - https://github.com/jl777/komodo

##### SuperNET
   - https://supernet.org
   - https://github.com/SuperNETorg
   - http://slackinvite.supernet.org
