import os
import json
from web3 import Web3
from dotenv import load_dotenv
from solcx import compile_source, install_solc, set_solc_version

# Install specific solc version
install_solc('0.8.20')
set_solc_version('0.8.20')

# Load environment variables
load_dotenv()

# Get private key and node URL from environment variables
private_key = os.getenv("PRIVATE_KEY")
node_url = os.getenv("MONAD_NODE_URL")

# Connect to Monad node
w3 = Web3(Web3.HTTPProvider(node_url))

# Check if connected
if not w3.is_connected():
    print("Failed to connect to the Monad node.")
    exit()

# Set up account
account = w3.eth.account.from_key(private_key)
w3.eth.default_account = account.address

# Solidity source code
with open("MyFirstNFT.sol", "r") as f:
    source_code = f.read()

# Compile the contract
compiled_sol = compile_source(
    source_code,
    output_values=['abi', 'bin'],
    import_remappings={
        "@openzeppelin/": "node_modules/@openzeppelin/"
    }
)
contract_id, contract_interface = compiled_sol.popitem()
bytecode = contract_interface['bin']
abi = contract_interface['abi']

# Create contract instance
MyFirstNFT = w3.eth.contract(abi=abi, bytecode=bytecode)

# Get the latest transaction count
nonce = w3.eth.get_transaction_count(account.address)

# Build transaction
transaction = MyFirstNFT.constructor(account.address).build_transaction({
    'chainId': w3.eth.chain_id,
    'gas': 2000000,
    'gasPrice': w3.to_wei('100', 'gwei'),
    'nonce': nonce,
})

# Sign transaction
signed_tx = w3.eth.account.sign_transaction(transaction, private_key=private_key)

# Send transaction
tx_hash = w3.eth.send_raw_transaction(signed_tx.raw_transaction)

# Wait for transaction receipt
print(f"Deploying contract... Transaction hash: {tx_hash.hex()}")
tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

# Print contract address
print(f"Contract deployed at: {tx_receipt.contractAddress}")

# Save ABI and contract address to a file
with open("contract_data.json", "w") as f:
    json.dump({
        "abi": abi,
        "address": tx_receipt.contractAddress
    }, f)
