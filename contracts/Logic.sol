// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/proxy/Clones.sol";

contract Logic {
    uint256 public state;
    uint256 public age;
    address mylogic;
    address myroot;

    // events, and their topic0 hash, for filtering
    event CloneInitialized(uint256 age, uint256 state, address indexed myroot);
    // d54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a
    event CloneSplit(uint256 age, uint256 state, address indexed myroot, address newclone);
    // 49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541
    event CloneUpdated(uint256 age, uint256 state, address indexed myroot);
    // 8c4769bdd2cf0d2686e6bbe7856d407d8059e0a4e479b75435aaeb6646b9649a

    constructor() payable {
    }
    receive() external payable {}
    function initialize(uint256 _state, address _mylogic, address _myroot) public {
        require(address(myroot) == address(0), "already initialized");
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
            emit CloneUpdated(age, state, myroot);
            return address(0x0);
        }
    }
    function raise() external returns(address) {
        return raise({amount: 1});
    }
    function lower() external {
        age++;
        if(state>0) state--;
        emit CloneUpdated(age, state, myroot);
    }
}