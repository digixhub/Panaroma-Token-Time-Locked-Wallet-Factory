pragma solidity ^0.4.18;

import "./PanaromaToken.sol";

contract TimeLockedWallet {

    address public creator;
    address public owner;
    uint256 public unlockDate_Q1;
    uint256 public unlockDate_Q2;
    uint256 public unlockDate_Q3;
    uint256 public unlockDate_Q4;
    uint256 public createdAt;
    bool public _q1;
    bool public _q2;
    bool public _q3;
    bool public _q4;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function TimeLockedWallet(
        address _creator,
        address _owner,
        uint256 _unlockDateq1,
        uint256 _unlockDateq2,
        uint256 _unlockDateq3,
        uint256 _unlockDateq4
    ) public {
        creator = _creator;
        owner = _owner;
        unlockDate_Q1 = _unlockDateq1;
        unlockDate_Q2 = _unlockDateq2;
        unlockDate_Q3 = _unlockDateq3;
        unlockDate_Q4 = _unlockDateq4;
        _q1 = false;
        _q2 = false;
        _q3 = false;
        _q4 = false;
        createdAt = now;
    }

    // keep all the ether sent to this address
    function() payable public { 
        Received(msg.sender, msg.value);
    }

    // callable by owner only, after specified time
    function withdraw() onlyOwner public {
       require(now >= unlockDate_Q1);
       //now send all the balance
       msg.sender.transfer(this.balance);
       Withdrew(msg.sender, this.balance);
    }

    // callable by owner only, after specified time, only for Tokens implementing ERC20
    function withdrawTokens(address _tokenContract) onlyOwner public {
        ERC20 token = ERC20(_tokenContract);
        uint256 tokenBalance = token.balanceOf(this);
    //    require(now >= unlockDate_Q1 && now <= unlockDate_Q2 && now <= unlockDate_Q3 && now <= unlockDate_Q4);
        if(now >= unlockDate_Q1 && now <= unlockDate_Q2 && now <= unlockDate_Q3 && now <= unlockDate_Q4 && _q1 == false){
            
            _q1 = true;
            token.transfer(owner, (tokenBalance/10));
            WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
        }else if(now >= unlockDate_Q1 && now >= unlockDate_Q2 && now <= unlockDate_Q3 && now <= unlockDate_Q4 && _q2 == false){

            _q2 = true;
            token.transfer(owner, (tokenBalance/5));
            WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
        }else if(now >= unlockDate_Q1 && now >= unlockDate_Q2 && now >= unlockDate_Q3 && now <= unlockDate_Q4 && _q3 == false){

            _q3 = true;
            token.transfer(owner, (tokenBalance/2));
            WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
        }else if(now >= unlockDate_Q1 && now >= unlockDate_Q2 && now >= unlockDate_Q3 && now >= unlockDate_Q4 && _q4 == false){

            _q4 = true;
            token.transfer(owner, (tokenBalance));
            WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
        }
       
    }

    function info() public view returns(address, address, uint256, uint256, uint256, uint256, uint256, uint256, bool, bool, bool, bool) {
        return (creator, owner, unlockDate_Q1, unlockDate_Q2, unlockDate_Q3, unlockDate_Q4, createdAt, this.balance, _q1, _q2, _q3, _q4);
    }

    event Received(address from, uint256 amount);
    event Withdrew(address to, uint256 amount);
    event WithdrewTokens(address tokenContract, address to, uint256 amount);
}
