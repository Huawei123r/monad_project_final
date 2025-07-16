from web3 import Web3
import json

# Configuration
RPC_URL = "https://testnet-rpc.monad.xyz/"
CONTRACT_ADDRESS = "YOUR_DEPLOYED_TOKEN_CONTRACT_ADDRESS" # Replace with your deployed contract address
PRIVATE_KEY = "YOUR_PRIVATE_KEY" # Your private key

# Load contract ABI
# You would typically load this from a compiled JSON file (e.g., artifacts/contracts/MyFirstToken.sol/MyFirstToken.json)
# For simplicity, we'll define a minimal ABI here.
CONTRACT_ABI = [
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "initialSupply",
                "type": "uint256"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "account",
                "type": "address"
            }
        ],
        "name": "balanceOf",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
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
            },
            {
                "internalType": "uint256",
                "name": "amount",
                "type": "uint256"
            }
        ],
        "name": "mint",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
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
        "inputs": [],
        "name": "symbol",
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
        "inputs": [],
        "name": "totalSupply",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
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
            },
            {
                "internalType": "uint256",
                "name": "amount",
                "type": "uint256"
            }
        ],
        "name": "transfer",
        "outputs": [
            {
                "internalType": "bool",
                "name": "",
                "type": "bool"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
    }
]

def main():
    w3 = Web3(Web3.HTTPProvider(RPC_URL))

    if not w3.is_connected():
        print("Failed to connect to Monad Testnet.")
        return

    print(f"Connected to Monad Testnet: {w3.is_connected()}")

    contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=CONTRACT_ABI)

    # Get contract name, symbol, and total supply
    try:
        name = contract.functions.name().call()
        symbol = contract.functions.symbol().call()
        total_supply = contract.functions.totalSupply().call()
        print(f"Contract Name: {name}")
        print(f"Contract Symbol: {symbol}")
        print(f"Total Supply: {w3.from_wei(total_supply, 'ether')} {symbol}")
    except Exception as e:
        print(f"Error getting contract details: {e}")

    # Get balance of the owner
    try:
        # NOTE: For actual interaction, replace PRIVATE_KEY with an environment variable or secure input.
        # This is for demonstration purposes only.
        owner_account = w3.eth.account.from_private_key(PRIVATE_KEY)
        owner_balance = contract.functions.balanceOf(owner_account.address).call()
        print(f"Owner ({owner_account.address}) Balance: {w3.from_wei(owner_balance, 'ether')} {symbol}")
    except Exception as e:
        print(f"Error getting owner balance: {e}")

    # Mint tokens (requires owner's private key)
    try:
        # NOTE: For actual interaction, replace PRIVATE_KEY with an environment variable or secure input.
        # This is for demonstration purposes only.
        account = w3.eth.account.from_private_key(PRIVATE_KEY)
        print(f"Minting from address: {account.address}")

        # Replace with the address you want to mint to and amount
        recipient_address = account.address # Mint to self for demonstration
        amount_to_mint = w3.to_wei(100, 'ether') # Mint 100 tokens

        # Build the transaction
        nonce = w3.eth.get_transaction_count(account.address)
        tx = contract.functions.mint(recipient_address, amount_to_mint).build_transaction({
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
            print("Tokens minted successfully!")
        else:
            print("Token minting failed.")

    except Exception as e:
        print(f"Error minting tokens: {e}")

    # Transfer tokens
    try:
        # NOTE: For actual interaction, replace PRIVATE_KEY with an environment variable or secure input.
        # This is for demonstration purposes only.
        account = w3.eth.account.from_private_key(PRIVATE_KEY)
        print(f"Transferring from address: {account.address}")

        # Replace with the address you want to transfer to and amount
        transfer_to_address = "0x0000000000000000000000000000000000000001" # Example address
        amount_to_transfer = w3.to_wei(50, 'ether') # Transfer 50 tokens

        # Build the transaction
        nonce = w3.eth.get_transaction_count(account.address)
        tx = contract.functions.transfer(transfer_to_address, amount_to_transfer).build_transaction({
            'from': account.address,
            'nonce': nonce,
            'gas': 2000000, # Adjust gas limit as needed
            'gasPrice': w3.to_wei('1', 'gwei') # Adjust gas price as needed
        })

        # Sign the transaction
        signed_tx = w3.eth.account.sign_transaction(tx, private_key=PRIVATE_KEY)

        # Send the transaction
        tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)
        print(f"Transfer transaction sent. Tx Hash: {tx_hash.hex()}")

        # Wait for the transaction to be mined
        receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
        print(f"Transaction confirmed in block: {receipt.blockNumber}")
        if receipt.status == 1:
            print("Tokens transferred successfully!")
        else:
            print("Token transfer failed.")

    except Exception as e:
        print(f"Error transferring tokens: {e}")

if __name__ == "__main__":
    main()