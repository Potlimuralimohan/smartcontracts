// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Election is Ownable{

    struct candidate {
        string name;
        uint index;
        uint votecount;
    }

    struct voter {
        string name;
        uint index;
        bool voted;
    }

    mapping(uint => candidate) public candidates;
    mapping(address => voter) public voters;
    
    constructor() {
        candidates[1] = candidate('Rahul', 1, 0);
        candidates[2] = candidate('Priya', 2, 0);
    }
    
    function vote(string memory _name, uint _index) public {
        require(voters[msg.sender].voted == false, 'you have already voted');
        voters[msg.sender] = voter(_name, _index, true);
        candidates[_index].votecount ++ ;
    }

    function getwinner() public view onlyOwner returns(uint){
        uint x = candidates[1].votecount;
        uint y = candidates[2].votecount;
        if(x > y){
            return(candidates[1].index);
        } else if(y>x){
            return(candidates[2].index);
        }
        return 0;
    }
}