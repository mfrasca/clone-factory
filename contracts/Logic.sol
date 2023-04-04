// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/proxy/Clones.sol";

contract Logic {
    uint256 public state;
    uint256 public age;
    address mylogic;
    address myroot;

    // event topic: d54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a
    event CloneInitialized(uint256 age, uint256 state, address indexed myroot);
    // event topic: 49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541
    event CloneSplit(uint256 age, uint256 state, address indexed myroot, address newclone);

    // forse però ci vuole pure un CloneUpdated event...

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