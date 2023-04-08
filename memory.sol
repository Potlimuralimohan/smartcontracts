//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;
library String{
    function concat(string _base, string _value) public view returns(string){
        bytes memory _baseByte  = bytes(_base);
        bytes memory _baseValue = bytes(_value);

        string memory _tmpValue = new string(_baseByte.length+_baseValue.length);
        bytes memory _newValue =bytes(_tmpValue);

        uint i;
        uint j;
        for(i=0;i<_baseByte.length;i++){
            _newValue[j++]=_baseByte[i];
        }

        for (i=0;i<_baseValue.length;i++){
            _newValue[j++]= _baseValue[i];
        }

        return string (_newValue);


    }
    function strpos(string _base,string _value) public pure returns(int){
        bytes memory _posbaseByte  = bytes(_base);
        bytes memory _posbaseValue = bytes(_value);
        for (uint i=0; i<_posbaseByte.length;i++){
            if (_posbaseByte[i]==_posbaseValue[0]){
                return int(i);
            }
        }
        return -1;

    }
}

contract TestString{
    using String for string;
    function testComntract(string _base,string _value) public view returns(string){
        return _base.concat(_value);
    }
    function testposition(string _base)public view returns(int){
        return _base.strpos("m");
    }
}
 