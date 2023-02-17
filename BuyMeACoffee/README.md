# BuyMeACoffee Smart Contract

This is a smart contract for a simple Buy Me A Coffee application built on the Ethereum blockchain using the Solidity programming language.

## Warning:

This is an experimental smart contract and it should not be used in a production environment until its security and functionality have been thoroughly audited and tested. Use at your own risk!

## Functionality

The contract allows users to contribute funds to creators and withdraw funds from their balance.

Creators can be added by anyone which is want to be creator, and once they are added, they can receive funds with the buyCoffee function from their supporters. The function takes an address parameter that specifies the address of the creator that should receive the funds.

The contract keeps track of the funds contributed by each user and the total fee balance. The fee is set to 5% of the contribution.

The contract administrator can withdraw the fee balance at any time by calling the withdrawFee function.

Creators can withdraw their balances by calling the withdraw function. Only creators can call this function.

The getCreatorBalance function can be called by a creator to get their current balance.

## Usage

This contract can be deployed on an Ethereum network, such as the Ropsten test network, using Remix or another Solidity development tool.

To use the contract, contributors can call the buyCoffee function, specifying the address of the creator they wish to support and the amount they want to contribute. Creators can call the withdraw function to withdraw their balances.

## Testing

To test the contract, you can use Remix or another Solidity development tool. You can also use a test network, such as the Ropsten test network, to deploy and test the contract.

## Warning:

Please be careful when using real funds on a live network. It is recommended to test the contract on a test network before deploying it on the main network.

## License

This smart contract is released under the MIT License.
