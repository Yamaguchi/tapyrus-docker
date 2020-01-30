# Tapyrus Docker
Dockerfile for tapyrus core, tapyrus signer, electrs-tapyrus,...

# Usage

```
git clone https://github.com/Yamaguchi/tapyrus-docker

cd tapyrus-docker

docker-compose build

docker-compose up -d redis tapyrus

(wait for a minites, during initial block download(IBD) on tapyrus core)

docker-compose up -d signer1 signer2 signer3 electrs

(wait until 100 blocks generated...)
```

Then instances below will wake up.
- Tapyrus Core: 1
- Tapyrus Signer: 3
- Redis: 1
- Electrs for Tapyrus: 1
- RPC Client for debug(only bitcoinrb installed): 1
 
# Compatible versions

|Core|Signer|Electrs|
| -- | -- | -- |
|v0.3.0|v0.3.0|v0.1.0|
 

# TODO 

- Write how to generate private keys and genesis block in README.
- Multiple core.
- docker-compose.yml for running as mainnet or testnet.
- Include tapyrus-seeder.

