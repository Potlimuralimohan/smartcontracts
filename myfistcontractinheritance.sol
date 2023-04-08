//SPDX-License-Identifier:MIT
pragma solidity ^0.4.0;
contract Bank{
    uint internal value;

    function Bank(uint amount){
        value=amount;

    }

    function deposit(uint amount)public {
        value+=amount;
    }
    function withdraw(uint amount)public{
        value-=amount;
    }
    function balance() public view returns(uint){
        return value;
    }




}
contract Mytoken is Bank(10){
    string private name;
    uint private age;
 
    function sername(string memory  _name)private {
        name=_name;
    }
    function getname() public view returns(string memory) {
        return(name);

    }
    function setage(uint _age) private {
        age=_age;
    }
    function getage() public  view returns(uint){
        return(age);
    }
}