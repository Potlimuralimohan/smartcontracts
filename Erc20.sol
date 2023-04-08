//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Erc20{
    string public name;
    string public symbol;
    uint public decimal;
    uint public totalsupply;

    mapping (address=>uint) public balanceof;
    mapping (address=>mapping(address=>uint)) public allowance;
    event transfer(address indexed from, address indexed to,uint value);
    event approve(address indexed owner,address indexed spender,uint value);

    constructor (string memory _name,string memory _symbol,uint _decimal,uint _totalsupply){
        name=_name;
        symbol=_symbol;
        decimal=_decimal;
        totalsupply=_totalsupply;
        balanceof[msg.sender]=_totalsupply;
    }

    function transfor(address _to,uint _value)public returns(bool success){
        require(balanceof[msg.sender]>=_value,"insufficent balance");
        balanceof[msg.sender]-=_value;
        balanceof[_to]+=_value;
        emit transfer(msg.sender,_to,_value);
        return true;

    }
    function apprve(address _spender,uint _value) public returns(bool success){
        allowance[msg.sender][_spender]=_value;
        emit approve(msg.sender,_spender,_value);
        return true;

        
    }
    function transforFrom(address _from,address _to,uint _value) public returns(bool success){
        require(balanceof[_from]>=_value,"insufficent Balance");
        require(allowance[_from][msg.sender]>=_value,"not authinticated");
        balanceof[_from]-=_value;
        balanceof[_to]+=_value;
        allowance[_from][msg.sender]-=_value;
        emit transfer(_from,_to,_value);
        return true;
    }

    

}
