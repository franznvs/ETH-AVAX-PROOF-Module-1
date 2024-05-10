# Functions and Errors - Module 1

This Solidity program is a simple "Token Creation" program that demonstrates the transaction of the tokens with the addresses in ETH.

## Description

This program is a simple contract written in Solidity, which will have the function to mint and burn tokens to and from the addresses and the Total Supply of the tokens respectively.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:

```solidity
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile ErrorHandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorHandling" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the functions. Finally, click on the "transact" button to execute the function and retrieve the balance of the tokens.

## Authors

franznvs  
[@franznvs](discordapp.com/users/705756624408805376)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
