//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

library inextended{
    function increment(uint _base) public pure returns(uint){
        return _base+=1;

    }
    function decriment(uint _base) public pure returns(uint){
        return _base-=1;
    }
    function incbyvalue(uint _base,uint _value)public pure returns(uint){
        return _base+_value;
    }
    function decbyvalue(uint _base,uint _value)public pure returns(uint){
        return _base-_value;
    }
}