//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;
contract Debugging{
    uint[] private Vars;
    function assignmentStack()public {
        uint myval1=1;
        uint myval=2;
        assert(myval1 == myval);

    }
    function memoryAlloc(){
        string memory mystring="test";
        assert(bytes(mystring).length==10);
    }
    function storageAlloc(){
        Vars.push(2);
        Vars.push(3);
        assert(Vars.length == 4);
    }
}