//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract Automotive{
    //Variables
    address public owner;
    mapping(address=>bool) public buyers;

    string public vehicleMake;
    string public vehiclemodel;
    uint public price;

    // Event

    event Purchase(address buyers,string make,string model,uint price);

    //constructor
    constructor() {
        owner=msg.sender;
    }

    function buyvehicle(string memory _make,string memory _model) public payable{
        require(msg.value>=price);
        require(buyers[msg.sender]==false);
        vehicleMake=_make;
        vehiclemodel=_model;
        buyers[msg.sender]=true;
        emit Purchase(msg.sender,_make,_model,price);

    }
    function setprice(uint _prise) public{
        require(msg.sender==owner);
        price=_prise;
    }
    function checkownership()public view returns(bool){
        return buyers[msg.sender];
    }

}