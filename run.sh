#!/bin/bash

banner() {
clear
cat << "EOF"
 _______  ___      __   __  _______  _______  __   __  _______  _______  __    _ 
|       ||   |    |  | |  ||       ||       ||  |_|  ||       ||       ||  |  | |
|    ___||   |    |  |_|  ||_     _||   _   ||       ||   _   ||   _   ||   |_| |
|   |___ |   |    |       |  |   |  |  | |  ||       ||  | |  ||  | |  ||       |
|    ___||   |___ |_     _|  |   |  |  |_|  ||       ||  |_|  ||  |_|  ||  _    |
|   |    |       |  |   |    |   |  |       || ||_|| ||       ||       || | |   |
|___|    |_______|  |___|    |___|  |_______||_|   |_||_______||_______||_|  |__|  

EOF
}
banner;

echo "===========Engram Network Installing======= " && sleep 1

# Constants
folder_to_check="$HOME/tokio-docker/"
# Declare varibles
reward=""
evm_address=""
evm_private_key=""

identity=""
enr_address=""
graffiti=""
ethstats=""

while [ -z "$reward" ] || [ -z "$evm_address" ] || [ -z "$evm_private_key" ]; do
    read -p "Enter 24 characters NODE_WALLET: " reward
    read -p "Enter EVM_WALLET address: " evm_address
    read -p "Enter EVM_WALLET private key: " evm_private_key

    if [ -z "$reward" ] || [ -z "$evm_address" ] || [ -z "$evm_private_key" ]; then
        echo "Please fill full information."
    fi
done

if [ -d "$folder_to_check" ]; then
    echo "Folder exists. Deleting..."
    rm -r "$folder_to_check" 
    echo "Folder deleted."
else
    echo "Folder not exists."
fi

# sudo apt update && apt upgrade -y

git clone https://github.com/engram-network/tokio-docker.git 
cd tokio-docker
git checkout dencun
sudo chmod +x ./scripts/*.sh
./scripts/install-docker.sh
./scripts/install-asdf.sh
mkdir -p execution consensus

echo "Update file: validator-deposit-data.sh"
# sudo nano ./scripts/validator-deposit-data.sh
sed -i "s/^amount=32000000000/amount=20000000000/g" ./scripts/validator-deposit-data.sh
sed -i "s/test test test test test test test test test test test junk/$reward/g" ./scripts/validator-deposit-data.sh
sed -i "s/0x000000000000000000000000000000000000000b/$evm_address/g" ./scripts/validator-deposit-data.sh
sed -i "s/0x000000000000.....................0000000000000/$evm_private_key/g" ./scripts/validator-deposit-data.sh
sleep 1;
bash ./scripts/validator-deposit-data.sh
./scripts/validator-build.sh

while [ -z "$identity" ] || [ -z "$enr_address" ] || [ -z "$graffiti" ] || [ -z "$ethstats" ]; do
    read -p "Enter Node Name (in https://nodewatch.engram.tech/): " ethstats
    read -p "Enter Discord Name: " identity
    read -p "Enter Node IP public: " enr_address
    read -p "Enter unique name: " graffiti

    # Kiểm tra nếu bất kỳ trường nào là rỗng, yêu cầu người dùng nhập lại
    if [ -z "$identity" ] || [ -z "$enr_address" ] || [ -z "$graffiti" ]  || [ -z "$ethstats" ]; then
        echo "Vui lòng điền đầy đủ thông tin."
    fi
done

sed -i "s/      - --identity=Huemint # Change With Your userdiscord without handle or hastag/      - --identity=$identity /g" ./docker-compose.yml
sed -i "s/      - --enr-address=0.0.0.0/      - --enr-address=$enr_address /g" ./docker-compose.yml
sed -i "s/      - --graffiti=Huemint /      - --graffiti=$graffiti /g" ./docker-compose.yml
sed -i "s/      - --ethstats=YourNameNodeHere:engramstats@nodewatch.engram.tech/      - --ethstats=$ethstats:engramstats@nodewatch.engram.tech /g" ./docker-compose.yml
sed -i "s/      - --suggested-fee-recipient=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266/      - --suggested-fee-recipient=$evm_address /g" ./docker-compose.yml

sleep 1;

sudo docker compose up -d
sleep 1;
