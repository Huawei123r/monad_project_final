// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MultiSigWallet
 * @dev A simple multi-signature wallet that requires a minimum number of owners to confirm a transaction before it can be executed.
 * This contract is a from-scratch implementation of a multi-sig wallet.
 */
contract MultiSigWallet {
    event Submission(uint indexed transactionId);
    event Confirmation(address indexed sender, uint indexed transactionId);
    event Execution(uint indexed transactionId);
    event ExecutionFailure(uint indexed transactionId);

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
    }

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public confirmations;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not an owner.");
        _;
    }

    modifier transactionExists(uint transactionId) {
        require(transactionId < transactions.length, "Transaction does not exist.");
        _;
    }

    modifier notExecuted(uint transactionId) {
        require(!transactions[transactionId].executed, "Transaction already executed.");
        _;
    }

    modifier notConfirmed(uint transactionId) {
        require(!confirmations[transactionId][msg.sender], "Transaction already confirmed.");
        _;
    }

    /**
     * @dev Initializes the multi-sig wallet with a list of owners and the required number of confirmations.
     * @param _owners The addresses of the owners.
     * @param _required The number of required confirmations.
     */
    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Owners required.");
        require(_required > 0 && _required <= _owners.length, "Invalid required number of owners.");

        for (uint i = 0; i < _owners.length; i++) {
            require(!isOwner[_owners[i]], "Duplicate owner.");
            isOwner[_owners[i]] = true;
        }
        owners = _owners;
        required = _required;
    }

    /**
     * @dev Submits a new transaction to the wallet.
     * @param destination The destination address of the transaction.
     * @param value The value to send with the transaction.
     * @param data The data to send with the transaction.
     * @return transactionId The ID of the new transaction.
     */
    function submitTransaction(address destination, uint value, bytes memory data)
        public
        onlyOwner
        returns (uint transactionId)
    {
        transactionId = transactions.length;
        transactions.push(Transaction({
            destination: destination,
            value: value,
            data: data,
            executed: false
        }));
        emit Submission(transactionId);
    }

    /**
     * @dev Confirms a transaction.
     * @param transactionId The ID of the transaction to confirm.
     */
    function confirmTransaction(uint transactionId)
        public
        onlyOwner
        transactionExists(transactionId)
        notExecuted(transactionId)
        notConfirmed(transactionId)
    {
        confirmations[transactionId][msg.sender] = true;
        emit Confirmation(msg.sender, transactionId);
        // Attempt to execute the transaction after each confirmation.
        executeTransaction(transactionId);
    }

    /**
     * @dev Executes a transaction if it has enough confirmations.
     * @param transactionId The ID of the transaction to execute.
     */
    function executeTransaction(uint transactionId)
        public
        onlyOwner
        transactionExists(transactionId)
        notExecuted(transactionId)
    {
        if (isConfirmed(transactionId)) {
            Transaction storage txn = transactions[transactionId];
            txn.executed = true;
            (bool success, ) = txn.destination.call{value: txn.value}(txn.data);
            if (success) {
                emit Execution(transactionId);
            } else {
                emit ExecutionFailure(transactionId);
                txn.executed = false;
            }
        }
    }

    /**
     * @dev Checks if a transaction has enough confirmations.
     * @param transactionId The ID of the transaction to check.
     * @return bool True if the transaction is confirmed, false otherwise.
     */
    function isConfirmed(uint transactionId)
        public
        view
        returns (bool)
    {
        uint count = 0;
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[transactionId][owners[i]]) {
                count++;
            }
            if (count == required) {
                return true;
            }
        }
        return false;
    }

    // --- View Functions ---

    function getOwners()
        public
        view
        returns (address[] memory)
    {
        return owners;
    }

    function getConfirmationCount(uint transactionId)
        public
        view
        returns (uint count)
    {
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[transactionId][owners[i]]) {
                count++;
            }
        }
    }

    receive() external payable {}
}