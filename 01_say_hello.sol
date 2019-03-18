pragma solidity ^0.5.0;

contract Hello{
    
    string _message;
    address _owner;
    
    constructor(string memory message ) public{
        _message = message;
        _owner = msg.sender;
    }
    
    modifier OnlyOwner{
        require(IsOwner(), "Only owner can change the value");
        _;
    }
    
    function SayHello() public view returns(string memory)
    {
        if(IsOwner())
          return "Hello Daddy";
          else  
           return _message;
    }
    
    function SetGreeting(string memory greeting) public OnlyOwner{
        _message = greeting;
    }
    
    function IsOwner() private view returns(bool)
    {
        return (_owner == msg.sender);
    }
}