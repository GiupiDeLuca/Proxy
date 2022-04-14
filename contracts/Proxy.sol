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
    address implementation = currentAddress;
    require(implementation != address(0));
    bytes memory data = msg.data;

    assembly {
        let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
        let size := returndatasize()
        let ptr := mload(0x40)

        returndatacopy(ptr, 0, size)
        switch result
        case 0 {revert(ptr, size)}
        case 1 {return(ptr, size)}
    }
}

}