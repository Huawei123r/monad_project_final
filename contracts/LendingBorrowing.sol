// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title LendingBorrowing
 * @dev A simple lending and borrowing protocol where users can deposit collateral and borrow tokens.
 * This contract demonstrates custom logic for managing collateral, loans, and liquidations.
 */
contract LendingBorrowing is Ownable {
    IERC20 public collateralToken;
    IERC20 public borrowToken;

    // @dev The ratio of collateral to borrowed value (e.g., 150 means 150% collateralization).
    uint256 public collateralRatio;
    // @dev The threshold at which a loan is considered undercollateralized and can be liquidated.
    uint256 public liquidationThreshold;

    mapping(address => uint256) public depositedCollateral;
    mapping(address => uint256) public borrowedAmount;

    event CollateralDeposited(address indexed user, uint256 amount);
    event CollateralWithdrawn(address indexed user, uint256 amount);
    event TokensBorrowed(address indexed user, uint256 amount);
    event LoanRepaid(address indexed user, uint256 amount);
    event LoanLiquidated(address indexed liquidator, address indexed borrower, uint256 collateralSeized, uint256 debtCovered);

    constructor(address _collateralToken, address _borrowToken, uint256 _collateralRatio, uint256 _liquidationThreshold) Ownable() {
        require(_collateralToken != address(0), "LendingBorrowing: collateral token is zero address");
        require(_borrowToken != address(0), "LendingBorrowing: borrow token is zero address");
        require(_collateralRatio > 100, "LendingBorrowing: collateral ratio must be > 100%");
        require(_liquidationThreshold > 100 && _liquidationThreshold < _collateralRatio, "LendingBorrowing: invalid liquidation threshold");

        collateralToken = IERC20(_collateralToken);
        borrowToken = IERC20(_borrowToken);
        collateralRatio = _collateralRatio;
        liquidationThreshold = _liquidationThreshold;
    }

    /**
     * @dev Deposits collateral into the protocol.
     * @param amount The amount of collateral to deposit.
     */
    function depositCollateral(uint256 amount) public {
        require(amount > 0, "Cannot deposit 0");
        collateralToken.transferFrom(msg.sender, address(this), amount);
        depositedCollateral[msg.sender] += amount;
        emit CollateralDeposited(msg.sender, amount);
    }

    /**
     * @dev Withdraws collateral from the protocol.
     * @param amount The amount of collateral to withdraw.
     * @notice This function includes a custom check to prevent withdrawals that would undercollateralize a loan.
     */
    function withdrawCollateral(uint256 amount) public {
        require(amount > 0, "Cannot withdraw 0");
        require(depositedCollateral[msg.sender] >= amount, "Insufficient collateral");
        
        // Custom Logic: Check if withdrawal would make the loan undercollateralized.
        // This assumes a 1:1 price ratio between collateral and borrow tokens for simplicity.
        uint256 newCollateralValue = depositedCollateral[msg.sender] - amount;
        uint256 currentBorrowedValue = borrowedAmount[msg.sender];

        if (currentBorrowedValue > 0) {
            require(newCollateralValue * 100 >= currentBorrowedValue * liquidationThreshold, "Withdrawal would undercollateralize loan");
        }

        depositedCollateral[msg.sender] -= amount;
        collateralToken.transfer(msg.sender, amount);
        emit CollateralWithdrawn(msg.sender, amount);
    }

    /**
     * @dev Borrows tokens against the deposited collateral.
     * @param amount The amount of tokens to borrow.
     * @notice This function calculates the maximum borrowable amount based on the collateral ratio.
     */
    function borrow(uint256 amount) public {
        require(amount > 0, "Cannot borrow 0");
        require(borrowToken.balanceOf(address(this)) >= amount, "Insufficient borrow token liquidity");

        // Custom Logic: Calculate the maximum borrowable amount based on the collateral ratio.
        uint256 maxBorrowable = (depositedCollateral[msg.sender] * 100) / collateralRatio;
        require(borrowedAmount[msg.sender] + amount <= maxBorrowable, "Exceeds max borrowable amount");

        borrowedAmount[msg.sender] += amount;
        borrowToken.transfer(msg.sender, amount);
        emit TokensBorrowed(msg.sender, amount);
    }

    /**
     * @dev Repays a loan.
     * @param amount The amount of tokens to repay.
     */
    function repay(uint256 amount) public {
        require(amount > 0, "Cannot repay 0");
        require(borrowedAmount[msg.sender] >= amount, "Repay amount exceeds borrowed amount");

        borrowToken.transferFrom(msg.sender, address(this), amount);
        borrowedAmount[msg.sender] -= amount;
        emit LoanRepaid(msg.sender, amount);
    }

    /**
     * @dev Liquidates an undercollateralized loan.
     * @param borrower The address of the borrower to liquidate.
     * @notice This function allows any user to liquidate a loan that has fallen below the liquidation threshold.
     */
    function liquidate(address borrower) public {
        uint256 currentCollateralValue = depositedCollateral[borrower];
        uint256 currentBorrowedValue = borrowedAmount[borrower];

        require(currentBorrowedValue > 0, "Borrower has no active loan");
        // Custom Logic: Check if the loan is undercollateralized.
        require(currentCollateralValue * 100 < currentBorrowedValue * liquidationThreshold, "Loan is not undercollateralized");

        // For simplicity, the liquidator seizes all collateral and repays the entire debt.
        uint256 collateralToSeize = depositedCollateral[borrower];
        uint256 debtToCover = borrowedAmount[borrower];

        depositedCollateral[borrower] = 0;
        borrowedAmount[borrower] = 0;

        collateralToken.transfer(msg.sender, collateralToSeize);
        borrowToken.transferFrom(msg.sender, address(this), debtToCover);

        emit LoanLiquidated(msg.sender, borrower, collateralToSeize, debtToCover);
    }

    // --- Owner Functions ---

    function setCollateralRatio(uint256 _collateralRatio) public onlyOwner {
        require(_collateralRatio > 100, "LendingBorrowing: collateral ratio must be > 100%");
        collateralRatio = _collateralRatio;
    }

    function setLiquidationThreshold(uint256 _liquidationThreshold) public onlyOwner {
        require(_liquidationThreshold > 100 && _liquidationThreshold < collateralRatio, "LendingBorrowing: invalid liquidation threshold");
        liquidationThreshold = _liquidationThreshold;
    }

    function addBorrowTokenLiquidity(uint256 amount) public onlyOwner {
        borrowToken.transferFrom(msg.sender, address(this), amount);
    }
}