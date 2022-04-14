// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
pragma abicoder v2;

import "./Storage.sol";

contract Age is Storage {

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "you're not the contract owner");
        _;
    }

    function getAge() public view returns (uint) {
       return _uintStorage["age"];
    }

    function setAge(uint _age) public {
        _uintStorage["age"] = _age;
    }
}