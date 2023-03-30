// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/proxy/Clones.sol";

contract Logic {
    uint256 public state;
    uint256 public age;
    address mylogic;

    event CloneInitialized(uint256 age, uint256 state);
    event CloneSplit(uint256 age, uint256 state);

    constructor() payable {
    }
    receive() external payable {}
    function initialize(uint256 _state, address _mylogic) public {
        // age = 0; // this is the default value
        state = _state;
        mylogic = _mylogic;
        emit CloneInitialized(age, _state);
    }
    function raise(uint256 amount) public returns(address) {
        assert(amount < 6);
        age++;
        state += amount;
        if(state>5) {
            uint256 newstate = (state / 2);
            state = state - newstate;
            emit CloneSplit(age, state);
            address result = address(Clones.clone(mylogic));
            Logic(payable(result)).initialize(newstate, mylogic);
            return(result);
        } else {
            return address(0x0);
        }
    }
    function raise() external returns(address) {
        return raise({amount: 1});
    }
    function lower() external {
        age++;
        if(state>0) state--;
    }
}