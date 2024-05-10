//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorHandling {
    uint public balance;
    uint public constant MAX_BALANCE = 1000;

    function deposit(uint amount) public {
        require(amount > 0, "Deposit amount must be greater than zero");
        uint newBalance = balance + amount;
        require(newBalance <= MAX_BALANCE, "Balance exceeds the maximum limit");
        balance = newBalance;
    }

    function withdraw(uint amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    function transfer(address recipient, uint amount) public {
        require(amount > 0, "Transfer amount must be greater than zero");
        require(amount <= balance, "Insufficient balance");
        require(recipient != address(0), "Invalid recipient address");
        
        uint previousBalance = balance;
        balance -= amount;
        
        assert(balance < previousBalance); 
    }
    
    function resetBalance() public pure {
        revert("Balance reset is not allowed");
    }
}
