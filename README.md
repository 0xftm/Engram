# Engram Network - Tokio chain
![image](https://github.com/0xftm/Engram/assets/115777868/251c0848-3a49-4599-a156-915de297b2b5)
## Official Links
- Blockchain Explorer EL : [`Blockscout`](https://nodewatch.engram.tech/)
- Blockchain Explorer CL : [`Validator Rewards Monitor`](https://beaconscan-v2.engram.tech/)
- Node Monitor : [`Node Watch Clients`](https://nodewatch.engram.tech/)
- Faucet PoW : [`Mining Faucet`](https://faucet-pow.engram.tech/)
- Faucet Validator : [`Dencun Faucet`](https://faucet-v2.engram.tech/)
## Prerequisites
### Hardware
| Component | Minimum | Recommended |
|-----------|---------|-------------|
| RAM | 4GB | 8GB |
| CPU (amd64/x86 architecture) | 2 core | 	4 core |
| Storage (SSD) | 20-40 GB | 200-300 GB |
**OS Recommended Ubuntu 20.04 or 22.04**

### EVM wallet
Fill your wallet address to faucet GRAMt token from: [`Dencun Faucet`](https://faucet-v2.engram.tech/).

You can faucet 1 time each 24hrs to get 33 GRAMt.
### Validator wallet
Create one if you don't have by command:
```sh
eth2-val-tools mnemonic
```
And save it.
## Install guide
### - Auto
Run script below on terminal:
```sh
bash <(wget -qO- https://raw.githubusercontent.com/0xftm/Engram/main/run.sh)
```
When you see this one => enter => 0 => testnet => enter your password 2 times and finish
```sh
$ ***Using the tool on an offline and secure device is highly recommended to keep your mnemonic safe.***

Please choose your language ['1. العربية', '2. ελληνικά', '3. English', '4. Français', '5. Bahasa melayu', '6. Italiano', '7. 日本語', '8. 한국어', '9. Português do Brasil', '10. român', '11. Türkçe', '12. 简体中文']:  [English]:

Choose English or Press Enter.

$ Please repeat the index to confirm: 

Type "0" since it is the minimum height the data deposit will be created at.

$ Please enter your mnemonic separated by spaces (" "). Note: you only need to enter the first 4 letters of each word if you'd prefer.:

Add your already created mnemonic phrase to be extracted into a public key.

$ Please choose the (mainnet or testnet) network/chain name ['mainnet-soon', 'devnet-1', 'devnet-3', 'devnet-4', 'devnet-5', 'testnet']:  [mainnet-soon]:

Choose testnet and Enter

$ Create a password that secures your validator keystore(s). You will need to re-enter this to decrypt them when you setup your Ethereum validators.:

Create your password with a minimum word of 8 letters/numbers and create a file with the name "password.txt" and save it in the "custom_config_data" folder
after completing creating a password you will be referred like this: 

███████╗███╗░░██╗░██████╗░██████╗░░█████╗░███╗░░░███╗  ████████╗░█████╗░██╗░░██╗██╗░█████╗░
██╔════╝████╗░██║██╔════╝░██╔══██╗██╔══██╗████╗░████║  ╚══██╔══╝██╔══██╗██║░██╔╝██║██╔══██╗
█████╗░░██╔██╗██║██║░░██╗░██████╔╝███████║██╔████╔██║  ░░░██║░░░██║░░██║█████═╝░██║██║░░██║
██╔══╝░░██║╚████║██║░░╚██╗██╔══██╗██╔══██║██║╚██╔╝██║  ░░░██║░░░██║░░██║██╔═██╗░██║██║░░██║
███████╗██║░╚███║╚██████╔╝██║░░██║██║░░██║██║░╚═╝░██║  ░░░██║░░░╚█████╔╝██║░╚██╗██║╚█████╔╝
╚══════╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝  ░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░╚════╝░      
                                                                  
Creating your keys.
Creating your keys:               [####################################]  32/32          
Creating your keystores:          [####################################]  32/32          
Creating your depositdata:        [####################################]  32/32          
Verifying your keystores:         [####################################]  32/32
```

### - Manual
--updating--

## Check status
### Logs
```sh
docker logs -f striatum_el 
```
```sh
docker logs -f lighthouse_cl
```
```sh
docker logs -f striatum_el 
```
### Online
```sh
https://nodewatch.engram.tech/
```

## Stop node
```sh
sudo docker compose down
```
## Delete node





