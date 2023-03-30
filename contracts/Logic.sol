// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/proxy/Clones.sol";

contract Logic {
    uint256 state;
    uint256 age;
    address mylogic;
    constructor() payable {
    }
    receive() external payable {}
    function initialize(uint256 _state, address _mylogic) public {
        age = 0;
        state = _state;
        mylogic = _mylogic;
    }
    function raise() external returns(address) {
        age++;
        state++;
        if(state>5) {
            state = 3;
            address result = address(Clones.clone(mylogic));
            Logic(payable(result)).initialize(3, mylogic);
            return(result);
        } else {
            return address(0x0);
        }
    }
    function lower() external {
        age++;
        if(state>0) state--;
    }
}