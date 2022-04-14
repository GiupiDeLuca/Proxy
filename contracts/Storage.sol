// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
pragma abicoder v2;

contract Storage {

    mapping (string => uint) _uintStorage;
    mapping (string => address) _addressStorage;
    mapping (string => bool) _boolStorage;
    mapping (string => string) _stringStorage;
    mapping (string => bytes4) _bytes4Storage;
    address public owner;
    bool public _initialized;

}