# Defi Empire, A Simple DeFI Kingdom Clone

# Setup Guide

## Overview

This guide will help you set up an Ubuntu environment on Windows Subsystem for Linux (WSL), install the Avalanche CLI, and create and deploy a subnet. Follow these steps to get your DeFi Empire project up and running.

## Prerequisites

- Windows 10 or later
- WSL installed and set up with Ubuntu

## Step 1: Install WSL and Ubuntu

1. **Enable WSL**:
Open PowerShell as Administrator and run:
```sh
   wsl --install
``` 
2: Update and Upgrade Ubuntu
  Open the Ubuntu terminal and run the following commands to update and upgrade your system:
  ```sh
  sudo apt update
  sudo apt upgrade -y
 ```
3: Install Required Dependencies
Install necessary packages:
 ```sh
sudo apt install -y build-essential git curl

 ```
4: Path Setup (Temporary)
 ```sh
export PATH=~/bin:$PATH
 ```
5. Check For successfull installation
 ```sh
avalanche --version
 ```

### Create a Subnet
1. Creation
 ```sh
avalanche subnet create ambujsub
 ```
Select following options

 ```sh
✔ Subnet-EVM
✔ Use latest release version
✔ Yes
✔ Yes
 ```
2. Enter the Chain ID (AVAX)
 ```sh
12343
 ```
3. Add token symbol
 ```sh
DOPA
 ```
Select follwoing option
 ```sh
✔ Low disk use    / Low Throughput    1.5 mil gas/s (C-Chain's setting)
✔ Airdrop 1 million tokens to the default ewoq address (do not use in production)
 ```

### Deploy Subnet 

 ```sh
avalanche subnet deploy ambujsub
 ```
Select 
 ```sh
✔ Local Network
 ```
## On Metamask 

1. Go to add network
```sh
select add network manually
and furnish details you got after successfull deploying subnet
 ```
2. In account section 
```sh
Import account and add private key provided 
```
This will enable you to use the created currency on to interact with smart contract 
```sh
Deploy code on Remix
inject provider as metamask
and play around
```

### Interacting with Smart Contract 
```sh
deploy ERC20.sol file first 
```

```sh
Copy the deployemEnt address
```


go to vault.sol file 
```sh
Deploy Vault.sol at the address 
```



## Author
ambuj

## LICENSE
This project is licensed under the [MIT license](LICENSE).
