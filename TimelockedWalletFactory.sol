pragma solidity ^0.4.18;

import "./TimeLockedWallet.sol";

contract TimeLockedWalletFactory {
 
    mapping(address => address[]) wallets;

    function getWallets(address _user) 
        public
        view
        returns(address[])
    {
        return wallets[_user];
    }

    function newTimeLockedWallet(address _owner, uint256 _unlockDateq1, uint256 _unlockDateq2, uint256 _unlockDateq3, uint256 _unlockDateq4)
        payable
        public
        returns(address wallet)
    {
        // Create new wallet.
        wallet = new TimeLockedWallet(msg.sender, _owner, _unlockDateq1, _unlockDateq2, _unlockDateq3, _unlockDateq4);
        
        // Add wallet to sender's wallets.
        wallets[msg.sender].push(wallet);

        // If owner is the same as sender then add wallet to sender's wallets too.
        if(msg.sender != _owner){
            wallets[_owner].push(wallet);
        }

        // Send ether from this transaction to the created contract.
        wallet.transfer(msg.value);

        // Emit event.
        Created(wallet, msg.sender, _owner, now, _unlockDateq1, _unlockDateq2, _unlockDateq3, _unlockDateq4, msg.value);
    }

    // Prevents accidental sending of ether to the factory
    function () public {
        revert();
    }

    event Created(address wallet, address from, address to, uint256 createdAt, uint256 unlockDateQ1, uint256 unlockDateQ2, uint256 unlockDateQ3, uint256 unlockDateQ4, uint256 amount);
}
