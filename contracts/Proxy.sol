// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
pragma abicoder v2;

import "./Storage.sol";

contract Proxy is Storage {

address public currentAddress;

constructor(address _currentAddress) {
    currentAddress = _currentAddress;
}

function upgrade(address _newAddress) public {
    currentAddress = _newAddress;
}

fallback() payable external {
    
}

}