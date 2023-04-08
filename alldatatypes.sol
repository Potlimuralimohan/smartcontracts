//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;
contract Alldatatypes{
    bool myBool=false; //initial false

    int8 Myint =-128;
    uint Myuint=255;

    string Mystring;
    uint8[] MystringArr;

    bytes Myvalue;
    bytes1 Mybyters1;
    bytes32 Mybyters32;

    enum action { Add,Remove,Update}
    action myaction =action.Remove;

    address Myaddress;

    function assignaddress()public{
        Myaddress=msg.sender;
        Myaddress.balance;
        Myaddress.transfer(10);
    }

    uint[] myintarr=[1,2,3];
    function aeeFunc() public returns(uint) {
        myintarr.push(1);
        return myintarr.length;
        return myintarr[0];
    }

    uint[10] Myfixedarray;

    struct account { 
        uint balance;
        uint dailyLimit;
    }
    account MyAccount;//access the axxount

    function structfunc()public  {
        MyAccount.balance=100;
    }
    mapping (address=> account) public _account;

    function () public payable{
        _account[msg.sender].balance+=msg.value;
    }
    function getBalance()public view returns(uint){
        return _account[msg.sender].balance;
    }


}