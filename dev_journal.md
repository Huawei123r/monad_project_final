---
**Journal Entry: MyERC1155Token (Core Token Standard)**

* **Project Name:** MyERC1155Token
* **Category:** Core Token Standard
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 11:30:00 AM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xcaa53094C46e34Acb10D642377047c149ae87CE1
* **Key Files Created:**
    * `contracts/MyERC1155Token.sol`
    * `scripts/DeployMyERC1155Token.s.sol`
* **Project Summary:** This project deploys a basic ERC-1155 multi-token standard contract. It includes functions for minting and burning tokens, with initial tokens minted during deployment.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC1155, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To check the balance of a token ID for an address:
           `cast call 0xcaa53094C46e34Acb10D642377047c149ae87CE1 "balanceOf(address,uint256)(uint256)" YOUR_ADDRESS TOKEN_ID --rpc-url https://testnet-rpc.monad.xyz`
        4. To mint new tokens (only by owner):
           `cast send 0xcaa53094C46e34Acb10D642377047c149ae87CE1 "mint(address,uint256,uint256,bytes)" RECIPIENT_ADDRESS TOKEN_ID AMOUNT "0x" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployMyERC1155Token.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/MyERC1155Token.sol -vvvv`
---
---
**Journal Entry: TimeLock (Basic Utility)**

* **Project Name:** TimeLock
* **Category:** Basic Utility
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 11:40:00 AM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x7e87758eC535318E7730fc7994A99Bd5c28Dc63d
* **Key Files Created:**
    * `contracts/TimeLock.sol`
    * `scripts/DeployTimeLock.s.sol`
* **Project Summary:** This project implements a time-locked wallet that allows users to deposit ETH or ERC-20 tokens, which can only be withdrawn after a specified unlock time. The owner can set the unlock time for any user.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To deposit ETH:
           `cast send 0x7e87758eC535318E7730fc7994A99Bd5c28Dc63d "deposit()" --value 1ether --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To withdraw ETH (after lock time):
           `cast send 0x7e87758eC535318E7730fc7994A99Bd5c28Dc63d "withdraw()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To set a new lock time for a user (only by owner):
           `cast send 0x7e87758eC535318E7730fc7994A99Bd5c28Dc63d "setLockTime(address,uint256)" USER_ADDRESS NEW_LOCK_TIMESTAMP --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployTimeLock.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/TimeLock.sol -vvvv`
---
---
**Journal Entry: Voting (Governance)**

* **Project Name:** Voting
* **Category:** Governance
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 11:50:00 AM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x3BCc94206A67D057Fd9ad66dCC928B795e58ed25
* **Key Files Created:**
    * `contracts/Voting.sol`
    * `scripts/DeployVoting.s.sol`
* **Project Summary:** This project implements a basic decentralized voting contract. The owner can create proposals, and users can vote on them. Each user can vote only once.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To create a proposal (only by owner):
           `cast send 0x3BCc94206A67D057Fd9ad66dCC928B795e58ed25 "createProposal(string)" "My First Proposal" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To vote on a proposal:
           `cast send 0x3BCc94206A67D057Fd9ad66dCC928B795e58ed25 "vote(uint256)" PROPOSAL_ID --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To get proposal details:
           `cast call 0x3BCc94206A67D057Fd9ad66dCC928B795e58ed25 "getProposal(uint256)(uint256,string,uint256)" PROPOSAL_ID --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployVoting.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/Voting.sol -vvvv`
---
---
**Journal Entry: Crowdsale (Basic DeFi Protocol)**

* **Project Name:** Crowdsale
* **Category:** Basic DeFi Protocol
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:00:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * MyToken: https://testnet.monadexplorer.com/address/0x2109797f8B0c989Bb1D018C55749c386095189cc
    * Crowdsale: https://testnet.monadexplorer.com/address/0xd05d259573879953593F2dcf17493F7567cb6a38
* **Key Files Created:**
    * `contracts/Crowdsale.sol`
    * `scripts/DeployCrowdsale.s.sol`
* **Project Summary:** This project implements a basic crowdsale contract where users can purchase a custom ERC-20 token (MyCrowdsaleToken) with ETH. The crowdsale has a defined rate (tokens per ETH) and a cap on the total ETH raised. The ownership of the ERC-20 token is transferred to the Crowdsale contract upon deployment.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC20, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To buy tokens:
           `cast send 0xd05d259573879953593F2dcf17493F7567cb6a38 "buyTokens(address)" YOUR_ADDRESS --value 0.1ether --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To withdraw funds (only by owner):
           `cast send 0xd05d259573879953593F2dcf17493F7567cb6a38 "withdrawFunds()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To check the total supply of MyCrowdsaleToken:
           `cast call 0x2109797f8B0c989Bb1D018C55749c386095189cc "totalSupply()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployCrowdsale.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/Crowdsale.sol -vvvv`
---
---
**Journal Entry: StakingRewards (Basic DeFi Protocol)**

* **Project Name:** StakingRewards
* **Category:** Basic DeFi Protocol
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:10:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * StakingRewards: https://testnet.monadexplorer.com/address/0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd
    * MyFirstToken (Staking Token): https://testnet.monadexplorer.com/address/0xC7323a25F743dC6E63A78b5A3af5038E2810Eda4
    * SecondToken (Rewards Token): https://testnet.monadexplorer.com/address/0x412043B6ADfC627f8F8ACfEC9a996191B08AD4E8
* **Key Files Created:**
    * `contracts/StakingRewards.sol`
    * `scripts/DeployStakingRewards.s.sol`
* **Project Summary:** This project implements a basic staking rewards contract where users can stake a specific ERC-20 token (MyFirstToken) and earn rewards in another ERC-20 token (SecondToken). The contract owner can set the reward rate and distribute rewards.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (IERC20, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. Approve the StakingRewards contract to spend your staking tokens:
           `cast send STAKING_TOKEN_ADDRESS "approve(address,uint256)" STAKING_REWARDS_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To stake tokens:
           `cast send 0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd "stake(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To withdraw staked tokens:
           `cast send 0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd "withdraw(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        6. To get rewards:
           `cast send 0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd "getReward()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        7. To set reward rate (only by owner):
           `cast send 0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd "setRewardRate(uint256)" RATE --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        8. To distribute rewards (only by owner):
           `cast send REWARDS_TOKEN_ADDRESS "approve(address,uint256)" STAKING_REWARDS_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
           `cast send 0xF7E4616A75BD80a72D3cE5FA32E61471a30161cd "distributeRewards(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployStakingRewards.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/StakingRewards.sol -vvvv`
---
---
**Journal Entry: LendingBorrowing (Basic DeFi Protocol)**

* **Project Name:** LendingBorrowing
* **Category:** Basic DeFi Protocol
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:20:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * LendingBorrowing: https://testnet.monadexplorer.com/address/0xbD9fE258DCa1f1f0d3005B776B46E20Bf3FE7F53
    * MyFirstToken (Collateral Token): https://testnet.monadexplorer.com/address/0xA2808A2acc8948F8bC36BD3DAbE32d6c7Db4f004
    * SecondToken (Borrow Token): https://testnet.monadexplorer.com/address/0x59568a2Fe0A412eC8Aaf29545b79d62020504d1A
* **Key Files Created:**
    * `contracts/LendingBorrowing.sol`
    * `scripts/DeployLendingBorrowing.s.sol`
* **Project Summary:** This project implements a basic lending and borrowing protocol. Users can deposit collateral (MyFirstToken) and borrow another token (SecondToken) against it. The contract includes functions for depositing/withdrawing collateral, borrowing/repaying tokens, and liquidation for undercollateralized loans.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (IERC20, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. Approve the LendingBorrowing contract to spend your collateral tokens:
           `cast send COLLATERAL_TOKEN_ADDRESS "approve(address,uint256)" LENDING_BORROWING_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To deposit collateral:
           `cast send 0xbD9fE258DCa1f1f0d3005B776B46E20Bf3FE7F53 "depositCollateral(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To borrow tokens:
           `cast send 0xbD9fE258DCa1f1f0d3005B776B46E20Bf3FE7F53 "borrow(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        6. To repay tokens:
           `cast send BORROW_TOKEN_ADDRESS "approve(address,uint256)" LENDING_BORROWING_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
           `cast send 0xbD9fE258DCa1f1f0d3005B776B46E20Bf3FE7F53 "repay(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        7. To liquidate a loan:
           `cast send 0xbD9fE258DCa1f1f0d3005B776B46E20Bf3FE7F53 "liquidate(address)" BORROWER_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployLendingBorrowing.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/LendingBorrowing.sol -vvvv`
---
---
**Journal Entry: SimpleOracle (Data Feeds / External Data)**

* **Project Name:** SimpleOracle
* **Category:** Data Feeds / External Data
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:30:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xd55901f12CFB326Eaf669674989E59c8a34f422d
* **Key Files Created:**
    * `contracts/SimpleOracle.sol`
    * `scripts/DeploySimpleOracle.s.sol`
* **Project Summary:** This project implements a basic oracle contract that allows the owner to update a price feed. Other contracts or users can then query this oracle to get the latest price and its timestamp.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To update the price (only by owner):
           `cast send 0xd55901f12CFB326Eaf669674989E59c8a34f422d "updatePrice(uint256)" NEW_PRICE --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To get the latest price:
           `cast call 0xd55901f12CFB326Eaf669674989E59c8a34f422d "getLatestPrice()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
        5. To get the last updated timestamp:
           `cast call 0xd55901f12CFB326Eaf669674989E59c8a34f422d "getLastUpdatedTimestamp()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeploySimpleOracle.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/SimpleOracle.sol -vvvv`
---
---
**Journal Entry: EventLogger (Off-Chain Data / Indexing Focus)**

* **Project Name:** EventLogger
* **Category:** Off-Chain Data / Indexing Focus
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:40:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x33a0C57661B85A7f2A7FD7a7B76B1855Ff779987
* **Key Files Created:**
    * `contracts/EventLogger.sol`
    * `scripts/DeployEventLogger.s.sol`
* **Project Summary:** This project implements a simple contract for logging events on the blockchain. It provides functions to emit string messages and numerical values, which can be used for off-chain data indexing and monitoring.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To log a message:
           `cast send 0x33a0C57661B85A7f2A7FD7a7B76B1855Ff779987 "logMessage(string)" "Hello Monad!" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To log a value:
           `cast send 0x33a0C57661B85A7f2A7FD7a7B76B1855Ff779987 "logValue(uint256)" 12345 --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployEventLogger.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/EventLogger.sol -vvvv`
---
---
**Journal Entry: NFTMarketplace (Marketplace Concepts)**

* **Project Name:** NFTMarketplace
* **Category:** Marketplace Concepts
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 02, 2025 at 12:50:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * NFTMarketplace: https://testnet.monadexplorer.com/address/0x1b502E81d29bAE6569601d633cFE3e5e8A5cfA9f
    * MyFirstNFT (Sample NFT): https://testnet.monadexplorer.com/address/0xAF2CE201f1a851D11423E74A53BDcCaC6E23CF71
* **Key Files Created:**
    * `contracts/NFTMarketplace.sol`
    * `scripts/DeployNFTMarketplace.s.sol`
* **Project Summary:** This project implements a basic NFT marketplace where users can list their ERC-721 NFTs for sale and other users can purchase them with ETH. It includes functions for listing, buying, and unlisting NFTs.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (IERC721, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. Mint an NFT (if you don't have one):
           `cast send MY_FIRST_NFT_CONTRACT_ADDRESS "mint(address)" YOUR_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. Approve the marketplace to transfer your NFT:
           `cast send MY_FIRST_NFT_CONTRACT_ADDRESS "approve(address,uint256)" NFT_MARKETPLACE_CONTRACT_ADDRESS TOKEN_ID --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To list an NFT for sale:
           `cast send 0x1b502E81d29bAE6569601d633cFE3e5e8A5cfA9f "listNFT(address,uint256,uint256)" MY_FIRST_NFT_CONTRACT_ADDRESS TOKEN_ID PRICE_IN_WEI --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        6. To buy an NFT:
           `cast send 0x1b502E81d29bAE6569601d633cFE3e5e8A5cfA9f "buyNFT(address,uint256)" MY_FIRST_NFT_CONTRACT_ADDRESS TOKEN_ID --value PRICE_IN_WEI --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        7. To unlist an NFT:
           `cast send 0x1b502E81d29bAE6569601d633cFE3e5e8A5cfA9f "unlistNFT(address,uint256)" MY_FIRST_NFT_CONTRACT_ADDRESS TOKEN_ID --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `forge script scripts/DeployNFTMarketplace.s.sol --rpc-url https://testnet-rpc.monad.xyz --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org --chain-id 10143 --contracts contracts/NFTMarketplace.sol -vvvv`
---
---
**Journal Entry: Box (Upgradeable Contract)**

* **Project Name:** Box
* **Category:** Upgradeable Contract
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 03:45:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * Proxy: https://testnet.monadexplorer.com/address/0x61DE40ee9DA523A96Da02A5521c4122B69EFF22C
    * Implementation: https://testnet.monadexplorer.com/address/0xa17B79718Ca9146D65B4c4E274c6E08b2cFc81E8
* **Key Files Created:**
    * `contracts/Box.sol`
    * `scripts/DeployBox.s.sol`
* **Project Summary:** This project deploys an upgradeable `Box` contract using the UUPS proxy pattern. It stores a single `uint256` value that can be updated by the owner.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (UUPSUpgradeable, OwnableUpgradeable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To store a new value (only by owner):
           `cast send 0x61DE40ee9DA523A96Da02A5521c4122B69EFF22C "store(uint256)" NEW_VALUE --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To retrieve the current value:
           `cast call 0x61DE40ee9DA523A96Da02A5521c4122B69EFF22C "retrieve()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployBox.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: BoxV2 (Contract Upgrade)**

* **Project Name:** BoxV2
* **Category:** Contract Upgrade
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 04:00:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * New Implementation: https://testnet.monadexplorer.com/address/0xfA0fBA8C24A818d1E2B56fc9B94bC5714DDF39B5
* **Key Files Created:**
    * `contracts/BoxV2.sol`
    * `scripts/DeployBoxV2.s.sol`
* **Project Summary:** This project deploys a new implementation for the `Box` contract, `BoxV2`, which adds an `increment()` function. The original `Box` proxy was then upgraded to use this new implementation.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (UUPSUpgradeable, OwnableUpgradeable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To call the new `increment` function on the original proxy:
           `cast send 0x61DE40ee9DA523A96Da02A5521c4122B69EFF22C "increment()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To retrieve the value after incrementing:
           `cast call 0x61DE40ee9DA523A96Da02A5521c4122B69EFF22C "retrieve()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployBoxV2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Crowdsale 2 (Basic DeFi Protocol)**

* **Project Name:** Crowdsale 2
* **Category:** Basic DeFi Protocol
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 04:15:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * MyToken: https://testnet.monadexplorer.com/address/0x162e55308f601B98139B6cCa55d742948679B612
    * Crowdsale: https://testnet.monadexplorer.com/address/0x865ffa8b472856210b66586017437dc4DbD3A749
* **Key Files Created:**
    * `contracts/Crowdsale.sol`
    * `scripts/DeployCrowdsale2.s.sol`
* **Project Summary:** This project implements a basic crowdsale contract where users can purchase a custom ERC-20 token (MyCrowdsaleToken) with ETH. The crowdsale has a defined rate (tokens per ETH) and a cap on the total ETH raised. The ownership of the ERC-20 token is transferred to the Crowdsale contract upon deployment.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC20, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To buy tokens:
           `cast send 0x865ffa8b472856210b66586017437dc4DbD3A749 "buyTokens(address)" YOUR_ADDRESS --value 0.1ether --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To withdraw funds (only by owner):
           `cast send 0x865ffa8b472856210b66586017437dc4DbD3A749 "withdrawFunds()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To check the total supply of MyCrowdsaleToken:
           `cast call 0x162e55308f601B98139B6cCa55d742948679B612 "totalSupply()(uint256)" --rpc-url https://testnet-rpc.monad.xyz`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployCrowdsale2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Escrow (Basic Utility)**

* **Project Name:** Escrow
* **Category:** Basic Utility
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 04:30:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x5CCA4e566b5830c0AB017B21389E877CC8DF7150
* **Key Files Created:**
    * `contracts/Escrow.sol`
    * `scripts/DeployEscrow.s.sol`
* **Project Summary:** This project deploys an Escrow contract that holds funds for a beneficiary. The funds can be released to the beneficiary at any time, or reclaimed by the depositor after a deadline has passed.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: N/A
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To release funds to the beneficiary:
           `cast send 0x5CCA4e566b5830c0AB017B21389E877CC8DF7150 "release()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To reclaim funds after the deadline (only by depositor):
           `cast send 0x5CCA4e566b5830c0AB017B21389E877CC8DF7150 "reclaim()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployEscrow.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: EventLogger 2 (Off-Chain Data / Indexing Focus)**

* **Project Name:** EventLogger 2
* **Category:** Off-Chain Data / Indexing Focus
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 04:45:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xAc3275D6cE832e3b3ac32622C4040c10a87CFc67
* **Key Files Created:**
    * `contracts/EventLogger.sol`
    * `scripts/DeployEventLogger2.s.sol`
* **Project Summary:** This project deploys a simple contract for logging events on the blockchain. It provides functions to emit string messages and numerical values, which can be used for off-chain data indexing and monitoring.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To log a message:
           `cast send 0xAc3275D6cE832e3b3ac32622C4040c10a87CFc67 "logMessage(string)" "Hello Monad!" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To log a value:
           `cast send 0xAc3275D6cE832e3b3ac32622C4040c10a87CFc67 "logValue(uint256)" 12345 --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployEventLogger2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Faucet (Basic Utility)**

* **Project Name:** Faucet
* **Category:** Basic Utility
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 05:00:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * MyToken: https://testnet.monadexplorer.com/address/0x31aD558832e5ED29766671cA827492940a9191b3
    * Faucet: https://testnet.monadexplorer.com/address/0x88fCdCA4af91b3BAC58c27AE2FD835B8c89392Ef
* **Key Files Created:**
    * `contracts/Faucet.sol`
    * `scripts/DeployFaucet.s.sol`
* **Project Summary:** This project deploys a Faucet contract that distributes a fixed amount of ERC20 tokens to users once per day.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC20), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To request tokens:
           `cast send 0x88fCdCA4af91b3BAC58c27AE2FD835B8c89392Ef "requestTokens()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployFaucet.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: LendingBorrowing 2 (Basic DeFi Protocol)**

* **Project Name:** LendingBorrowing 2
* **Category:** Basic DeFi Protocol
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 05:15:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * LendingBorrowing: https://testnet.monadexplorer.com/address/0xeF8b8AdB1BBBc07a24ef6A026c6caa7f28b5A8f3
    * Collateral Token: https://testnet.monadexplorer.com/address/0xC6330B3424C21b0D11C400242417675256F7246C
    * Borrow Token: https://testnet.monadexplorer.com/address/0x90E91DFa753F2b4C30D21B6b11972484a1c28AB9
* **Key Files Created:**
    * `contracts/LendingBorrowing.sol`
    * `scripts/DeployLendingBorrowing2.s.sol`
* **Project Summary:** This project implements a basic lending and borrowing protocol. Users can deposit collateral (MyFirstToken) and borrow another token (SecondToken) against it. The contract includes functions for depositing/withdrawing collateral, borrowing/repaying tokens, and liquidation for undercollateralized loans.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (IERC20, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. Approve the LendingBorrowing contract to spend your collateral tokens:
           `cast send COLLATERAL_TOKEN_ADDRESS "approve(address,uint256)" LENDING_BORROWING_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To deposit collateral:
           `cast send 0xeF8b8AdB1BBBc07a24ef6A026c6caa7f28b5A8f3 "depositCollateral(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To borrow tokens:
           `cast send 0xeF8b8AdB1BBBc07a24ef6A026c6caa7f28b5A8f3 "borrow(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        6. To repay tokens:
           `cast send BORROW_TOKEN_ADDRESS "approve(address,uint256)" LENDING_BORROWING_CONTRACT_ADDRESS AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
           `cast send 0xeF8b8AdB1BBBc07a24ef6A026c6caa7f28b5A8f3 "repay(uint256)" AMOUNT --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        7. To liquidate a loan:
           `cast send 0xeF8b8AdB1BBBc07a24ef6A026c6caa7f28b5A8f3 "liquidate(address)" BORROWER_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployLendingBorrowing2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Multi-Sig Wallet (Governance)**

* **Project Name:** Multi-Sig Wallet
* **Category:** Governance
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 05:30:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x945e5EA822Aa03aAA0031a5fd0E86719d93C28D8
* **Key Files Created:**
    * `contracts/MultiSigWallet.sol`
    * `scripts/DeployMultiSigWallet.s.sol`
* **Project Summary:** This project deploys a Multi-Signature Wallet that requires a specified number of owners to confirm a transaction before it can be executed.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: N/A
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To submit a transaction:
           `cast send 0x945e5EA822Aa03aAA0031a5fd0E86719d93C28D8 "submitTransaction(address,uint256,bytes)" DESTINATION_ADDRESS VALUE_IN_WEI "0x" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To confirm a transaction:
           `cast send 0x945e5EA822Aa03aAA0031a5fd0E86719d93C28D8 "confirmTransaction(uint256)" TRANSACTION_ID --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployMultiSigWallet.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: MyERC1155Token 2 (Core Token Standard)**

* **Project Name:** MyERC1155Token 2
* **Category:** Core Token Standard
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 05:45:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x9477EB902A9b0Cb652e9E7BE207483Ae08F788Ca
* **Key Files Created:**
    * `contracts/MyERC1155Token.sol`
    * `scripts/DeployMyERC1155Token2.s.sol`
* **Project Summary:** This project deploys a basic ERC-1155 multi-token standard contract. It includes functions for minting and burning tokens, with initial tokens minted during deployment.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC1155, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To check the balance of a token ID for an address:
           `cast call 0x9477EB902A9b0Cb652e9E7BE207483Ae08F788Ca "balanceOf(address,uint256)(uint256)" YOUR_ADDRESS TOKEN_ID --rpc-url https://testnet-rpc.monad.xyz`
        4. To mint new tokens (only by owner):
           `cast send 0x9477EB902A9b0Cb652e9E7BE207483Ae08F788Ca "mint(address,uint256,uint256,bytes)" RECIPIENT_ADDRESS TOKEN_ID AMOUNT "0x" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployMyERC1155Token2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: NFTMarketplace 2 (Marketplace Concepts)**

* **Project Name:** NFTMarketplace 2
* **Category:** Marketplace Concepts
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 06:00:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** 
    * NFTMarketplace: https://testnet.monadexplorer.com/address/0x28Db1fED7b8752D0d8e71c90C6b499CF100bEfe2
    * MyFirstNFT: https://testnet.monadexplorer.com/address/0x42e420cfBd1564D07E936Dd4D7bF36C01Db58CEb
* **Key Files Created:**
    * `contracts/NFTMarketplace.sol`
    * `scripts/DeployNFTMarketplace2.s.sol`
* **Project Summary:** This project implements a basic NFT marketplace where users can list their ERC-721 NFTs for sale and other users can purchase them with ETH. It includes functions for listing, buying, and unlisting NFTs.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (IERC721, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. Mint an NFT (if you don't have one):
           `cast send 0x42e420cfBd1564D07E936Dd4D7bF36C01Db58CEb "mint(address)" YOUR_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. Approve the marketplace to transfer your NFT:
           `cast send 0x42e420cfBd1564D07E936Dd4D7bF36C01Db58CEb "approve(address,uint256)" 0x28Db1fED7b8752D0d8e71c90C6b499CF100bEfe2 TOKEN_ID --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        5. To list an NFT for sale:
           `cast send 0x28Db1fED7b8752D0d8e71c90C6b499CF100bEfe2 "listNFT(address,uint256,uint256)" 0x42e420cfBd1564D07E936Dd4D7bF36C01Db58CEb TOKEN_ID PRICE_IN_WEI --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        6. To buy an NFT:
           `cast send 0x28Db1fED7b8752D0d8e71c90C6b499CF100bEfe2 "buyNFT(address,uint256)" 0x42e420cfBd1564D07E936Dd4D7bF36C01Db58CEb TOKEN_ID --value PRICE_IN_WEI --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployNFTMarketplace2.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Owner (Access Control)**

* **Project Name:** Owner
* **Category:** Access Control
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 06:15:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xF37c9998bd6b51D5b2E9996aAf50Fd8fDF975a21
* **Key Files Created:**
    * `contracts/Owner.sol`
    * `scripts/DeployOwner.s.sol`
* **Project Summary:** This project deploys a simple contract that demonstrates the use of OpenZeppelin's `Ownable` for access control.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To set the message (only by owner):
           `cast send 0xF37c9998bd6b51D5b2E9996aAf50Fd8fDF975a21 "setMessage(string)" "Hello Monad!" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployOwner.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Pausable Contract (Security Pattern)**

* **Project Name:** Pausable Contract
* **Category:** Security Pattern
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 06:30:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x15DaD6824d079CFDC6973bee70da01f5E4ED7190
* **Key Files Created:**
    * `contracts/Pausable.sol`
    * `scripts/DeployPausable.s.sol`
* **Project Summary:** This project deploys a contract that demonstrates the use of OpenZeppelin's `Pausable` for access control.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Pausable, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To pause the contract (only by owner):
           `cast send 0x15DaD6824d079CFDC6973bee70da01f5E4ED7190 "pause()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To unpause the contract (only by owner):
           `cast send 0x15DaD6824d079CFDC6973bee70da01f5E4ED7190 "unpause()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployPausable.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Payment Splitter (Finance)**

* **Project Name:** Payment Splitter
* **Category:** Finance
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 04, 2025 at 06:45:00 PM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xe643E7c0AdcDFc4A69903173A2F9EC0A6A486745
* **Key Files Created:**
    * `contracts/PaymentSplitter.sol`
    * `scripts/DeployPaymentSplitter.s.sol`
* **Project Summary:** This project deploys a contract that splits payments among multiple payees according to predefined shares.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (PaymentSplitter), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To release funds to a payee:
           `cast send 0xe643E7c0AdcDFc4A69903173A2F9EC0A6A486745 "release(address)" PAYEE_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployPaymentSplitter.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: Pausable Contract (Security Pattern)**

* **Project Name:** Pausable Contract
* **Category:** Security Pattern
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 08, 2025 at 10:00:00 AM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0x15DaD6824d079CFDC6973bee70da01f5E4ED7190
* **Key Files Created:**
    * `contracts/Pausable.sol`
    * `scripts/DeployPausable.s.sol`
* **Project Summary:** This project deploys a contract that demonstrates the use of OpenZeppelin's `Pausable` for access control.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (Pausable, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To pause the contract (only by owner):
           `cast send 0x15DaD6824d079CFDC6973bee70da01f5E4ED7190 "pause()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
        4. To unpause the contract (only by owner):
           `cast send 0x15DaD6824d079CFDC6973bee70da01f5E4ED7190 "unpause()" --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeployPausable.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---
---
**Journal Entry: SimpleNFT (Core Token Standard)**

* **Project Name:** SimpleNFT
* **Category:** Core Token Standard
* **Network:** Monad Testnet
* **Deployment Timestamp:** July 08, 2025 at 10:15:00 AM
* **GitHub Repository URL:** https://github.com/Huawei123r/my_first_monad_project
* **Monad Explorer Contract URL(s):** https://testnet.monadexplorer.com/address/0xbD00c462B045176249069A5b404FCb9Cd74eAC2B
* **Key Files Created:**
    * `contracts/SimpleNFT.sol`
    * `scripts/DeploySimpleNFT.s.sol`
* **Project Summary:** This project deploys a basic ERC-721 NFT contract.
* **Technical Details:**
    * Solidity Version: 0.8.20
    * Framework Used: Foundry
    * Key Libraries: OpenZeppelin (ERC721, Ownable), forge-std
    * Interaction Instructions:
        1. Ensure you have Foundry installed and configured.
        2. Set up your environment variables (MONAD_RPC_URL, PRIVATE_KEY) in a `.env` file.
        3. To mint a new NFT (only by owner):
           `cast send 0xbD00c462B045176249069A5b404FCb9Cd74eAC2B "safeMint(address)" RECIPIENT_ADDRESS --rpc-url https://testnet-rpc.monad.xyz --private-key YOUR_PRIVATE_KEY`
* **Verification Status:** Verified
* **Verification Command (if applicable):** `source .env && forge script scripts/DeploySimpleNFT.s.sol --rpc-url $MONAD_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --verifier sourcify --verifier-url https://sourcify-api-monad.blockvision.org/ --legacy`
---