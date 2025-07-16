from web3 import Web3
import json

# Configuration
RPC_URL = "https://testnet-rpc.monad.xyz/"
CONTRACT_ADDRESS = "YOUR_DEPLOYED_NFT_CONTRACT_ADDRESS" # Replace with your deployed contract address
PRIVATE_KEY = "YOUR_PRIVATE_KEY" # Your private key

# Load contract ABI
# You would typically load this from a compiled JSON file (e.g., artifacts/contracts/MyFirstNFT.sol/MyFirstNFT.json)
# For simplicity, we'll define a minimal ABI here.
CONTRACT_ABI = [
    {
        "inputs": [],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [],
        "name": "name",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            }
        ],
        "name": "safeMint",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "symbol",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",        "type": "function"
    }
]

def main():
    w3 = Web3(Web3.HTTPProvider(RPC_URL))

    if not w3.is_connected():
        print("Failed to connect to Monad Testnet.")
        return

    print(f"Connected to Monad Testnet: {w3.is_connected()}")

    contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=CONTRACT_ABI)

    # Get contract name and symbol
    try:
        name = contract.functions.name().call()
        symbol = contract.functions.symbol().call()
        print(f"Contract Name: {name}")
        print(f"Contract Symbol: {symbol}")
    except Exception as e:
        print(f"Error getting contract details: {e}")

    # Mint an NFT (requires owner's private key)
    try:
        # NOTE: For actual interaction, replace PRIVATE_KEY with an environment variable or secure input.
        # This is for demonstration purposes only.
        account = w3.eth.account.from_private_key(PRIVATE_KEY)
        print(f"Minting from address: {account.address}")

        # Replace with the address you want to mint to
        recipient_address = account.address # Mint to self for demonstration

        # Build the transaction
        nonce = w3.eth.get_transaction_count(account.address)
        tx = contract.functions.safeMint(recipient_address).build_transaction({
            'from': account.address,
            'nonce': nonce,
            'gas': 2000000, # Adjust gas limit as needed
            'gasPrice': w3.to_wei('1', 'gwei') # Adjust gas price as needed
        })

        # Sign the transaction
        signed_tx = w3.eth.account.sign_transaction(tx, private_key=PRIVATE_KEY)

        # Send the transaction
        tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)
        print(f"Minting transaction sent. Tx Hash: {tx_hash.hex()}")

        # Wait for the transaction to be mined
        receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
        print(f"Transaction confirmed in block: {receipt.blockNumber}")
        if receipt.status == 1:
            print("NFT minted successfully!")
        else:
            print("NFT minting failed.")

    except Exception as e:
        print(f"Error minting NFT: {e}")

if __name__ == "__main__":
    main()