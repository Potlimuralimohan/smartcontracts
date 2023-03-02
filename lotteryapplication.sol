// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract lattery{
    address public manager;
    address payable[] public participanta;

    constructor(){
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value==1 ether);
        participanta.push(payable(msg.sender));
    }

    function getbalance() public view returns(uint){
        require(msg.sender==manager);
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participanta.length)));

    }

    function winnner() public {
        require(msg.sender==manager);
        require(participanta.length>=3);
        uint r=random();
        address payable Winnner;
        uint index=r%participanta.length;
        Winnner=participanta[index];
        //return Winnner;
        Winnner.transfer(getbalance());
        participanta=new address payable[](0);
    }

}
