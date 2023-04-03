// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/proxy/Clones.sol";

contract Logic {
    uint256 public state;
    uint256 public age;
    address mylogic;
    address myroot;

    // event topic: e02849cd799ce55d96e71b7bdd90c95aa88505b1b2bda59618d548ee85d7ad65
    event CloneInitialized(uint256 age, uint256 state, address myroot);
    // event topic: 8301c022415cd7ca62da8060f418ae0154e8eb93cd727af883b7f1dac505acec
    event CloneSplit(uint256 age, uint256 state, address myroot, address newclone);

    constructor() payable {
    }
    receive() external payable {}
    function initialize(uint256 _state, address _mylogic, address _myroot) public {
        // age = 0; // this is the default value
        state = _state;
        mylogic = _mylogic;
        myroot = _myroot;
        emit CloneInitialized(age, _state, myroot);
    }
    function raise(uint256 amount) public returns(address) {
        assert(amount < 6);
        age++;
        state += amount;
        if(state>5) {
            uint256 newstate = (state / 2);
            state = state - newstate;
            address newclone = address(Clones.clone(mylogic));
            emit CloneSplit(age, state, myroot, newclone);
            Logic(payable(newclone)).initialize(newstate, mylogic, myroot);
            return(newclone);
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