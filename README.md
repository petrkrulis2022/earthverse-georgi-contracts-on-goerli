# Earthverse contracts

```shell
npx hardhat run scripts/nftDollar/deploy.js --network goerliTestNet
npx hardhat run scripts/rnftDollar/deploy.js --network goerliTestNet
npx hardhat run scripts/nftLand/deploy.js --network goerliTestNet
npx hardhat run scripts/nftAugmentedReality/deploy.js --network goerliTestNet
npx hardhat run scripts/earthverseMarketplace/deploy.js --network goerliTestNet
npx hardhat run scripts/earthverseDeposit/deploy.js --network goerliTestNet
npx hardhat run scripts/rnftDollarDeposit/deploy.js --network goerliTestNet

::Goerli Test Net contract addresses::

NFTD (NFT Dollar) - 0x750dF7BE1082AC535B317f6C4DfcA74756D8ab6d
rNFTD (rNFT Dollar) - 0x2d9FC9A76Db8559fC382311f147Eae43354A5a9c
NFTL (NFT Land) - 0x8f33C22404fFd115248433c3afDC2a4AFAF023DD
NFTAR (NFTAugmentedReality) - 0xb3b2a29792fDd2B7762BE76437a2913b7b708b34
EarthverseMarketplace (Earthverse Marketplace) - 0x7e2386E09580d85F7f4Ceb2387a4d5A1764B2257
EarthverseDeposit (Earthverse Deposit) - 0x541bb0D8582Ad916f72C124B13ae206ccce70966
RNFTDollarDeposit (RNFTDollar Deposit) - 0x0630FeaA41872937cfbe675b74e134eA158943b9
npx hardhat verify --constructor-args arguments.js 0x0630FeaA41872937cfbe675b74e134eA158943b9
npx hardhat verify --network goerliTestNet 0x2d9FC9A76Db8559fC382311f147Eae43354A5a9c
npx hardhat verify --contract contracts/RNFTDollar.sol:RNFTDollar --network goerliTestNet 0x2d9FC9A76Db8559fC382311f147Eae43354A5a9c
```
