//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;

contract Transaction{
    address private owner;
    event senderLoggin(address);
    event sendervaluer(uint);


    function transaction() public  {
        owner==msg.sender;
    }
 
    modifier isownser {
        require(owner == msg.sender);
        _;
    }
    modifier value{
        assert(msg.value>=1 ether);
        _;
    }
    


    function()  payable isownser value{
        emit senderLoggin(msg.sender);
        emit sendervaluer(msg.value);

    }

}