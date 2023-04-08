//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "librory1.sol";

contract Extract{
    using inextended for uint;
    function testincrement(uint _base) public pure returns(uint){
        return _base.increment();
    }
}
