//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract MyfirstToken{
    string public constant Symbol="MIT";
    string public constant name="My First Token";
    uint8 public constant decimals=18;

    uint private constant __totalsupply=1000;

    mapping (address=>uint ) private __balanceof;
    mapping (address=> mapping(address=>uint)) private _allowances;

    function Myfirsttoken() public {
        __balanceof[msg.sender]=__totalsupply;
    }


    function totalsupply() public pure returns(uint _totalsupply){
        _totalsupply=__totalsupply;
    }

    function Balanceof( address _addr) public view  returns(uint balance){
        return __balanceof[_addr];
    }
    function transfer(address _to,uint _value) public  returns(bool success){
        require(_value > 0 && _value <= Balanceof(msg.sender),"notvalied");
            __balanceof[msg.sender]-=_value;
            __balanceof[_to]+=_value;
            return true;

    }
    function transfefrom( address _from ,address _to,uint _value) public returns(bool success){
            require(_allowances[_from][msg.sender]>0 &&_value>0 && _allowances[_from][msg.sender]>=_value,"not owner");
            __balanceof[_from]-=_value;
            __balanceof[_to]+=_value;
            return true;
    }

    function approve(address _spender,uint _value) public  returns(bool success){

        _allowances[msg.sender][_spender]=_value;
        return true;


    }
    function allowances(address _owner,address  _spender) public returns(uint remaining){
        return _allowances[_owner][msg.sender];
    }


}
