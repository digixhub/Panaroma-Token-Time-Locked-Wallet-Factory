# Panaroma-Token-Time-Locked-Wallet-Factory
This repository contains a token contract, PanaromaToken.sol, TimeLockedWallet.sol and TimeLockedWalletFactory.sol contracts with creation if time locked wallets and withdraw functions bounded by timestamps. 


**Smart Contract Solutions**

icoapp.panaroma.finance Dapp have three basic contracts,

1. PanaromaToken.sol ; This is the Token smart contract on solidity. It has been inherited with features of ERC20Basics, IERC20, SafeMaths, Ownable, Balcklist and PanaromaToken. The tokenomics of PanaromaToken can be referred here, ..... .

2. TimeLockedWallet.sol ; This is the contract which holds the Panaroma token sent to a user, this contract is completely binded or owned by a Decentralized wallet of a user and can be controlled by the only wallet or the user's decentralized wallet. The contract also holds the Panaroma token payout initials and payout time lines as well, it means the timelockedwallet though controlled by the associated owner only but the user wil be able to withdraw the Panaroma Tokens from this wallet only when the time of withdrawls meet the actual tokenomics plan payouts, the payout plans can be checked on the the whitepaper or tokenomics sheet of icoapp.panaroma.finance. 

3. TimeLockedWalletFactory.sol ; The contract is only used to create a new timelockedwallet for a user. A user with Dapp wallet, let's say it is 0xabc. At the time of triggering the TimeLockedWalletFactory contract to create a new timelockedwallet the following parameters has to be given, wallet address of a user 0xabc, q1, q2, q3, i.e. the q parameters holds the time limits to release the Panaroma token, so whenever a user tries to withdraw Panaroma token from his/her timelockedwallet to 0xabc, the time limits needs to meet the exact requiremnets.



**Payment Methods**

Panaroma.finance Pay for Business supports payments using icoapp.panaroma.finance App and other cryptocurrency wallets.

A Panaroma.finance App user can simply use the icoapp.panaroma.finance App (available on web-broser) to scan the QR code, select their preferred payment cryptocurrency and complete the transaction. Please refer to the 'How to register?' article on the web application.

Customers can also pay with other cryptocurrency wallets other than icoapp.panaroma.finance App, such as MetaMask, Panaroma.finance Dapp wallet or Ledger, etc to pay. Please note that the customers will have to bear the network fees when they choose to pay using methods other than icoapp.panaroma.finance Dapp wallet.


**Subcription flow**

icoapp.panaroma.finance App does hold tilelocked wallets such as TimeLockedWallet and TimeLockedWalletFactory. The flow of customers subscription can be understood in 4 basic steps:

1. Registration; Whenever a customer or user do the resistration with an EmailId and Password, a Decentralized wallet will get assigned with that user's account. Let us consider the Decentralized wallet as primary user wallet with Primary key and Secondary key given to the user.

2. Time Locked wallet Generation; At the time of registration only, apart from primary user wallet there will be another wallet get's created, that is the Time Locked Wallet and that wallet will again get binded with that user only and the Secondary Key will be provided to the user(but not Primary key).

3. Buying Token; A user has the flexibility to buy Panaroma Token in icoapp.panaroma.finance App, and will get the tokens into their Time Locked Wallet, also can be checked on the blockchain explorer as well, i.e. https://polygonscan.com/ . The process of buying can be done through the Apps such as, MetaMask, Panaroma.finance Dapp wallet or Ledger.

4. Payouts; the payouts are again done by the users only though icoapp.panaroma.finance is completely a Decentralized Application, a user can transfer the Panaroma token from the Time Locked Wallet to their primary wallet, the primary wallet is the actual wallet a user can have access by importing it to Metamask, etc. for that here is the link to import a wallet on metamask https://medium.com/publicaio/how-import-a-wallet-to-your-metamask-account-dcaba25e558d#:~:text=After%20creating%20an%20account%2C%20click,key%20string%20and%20click%20Import .
