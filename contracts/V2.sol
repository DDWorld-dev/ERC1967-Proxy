// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./utils/Initializable.sol";
import "./UUPSUpgradeable.sol";

contract V2 is Initializable, UUPSUpgradeable{
    uint public number;
    address owner;
    uint public newNumber;
    modifier onlyOwner(){
        require(owner == msg.sender, "error");
        _;
    }
    function initialize(uint _newNumber) public payable reinitializer(2){
        newNumber = _newNumber;
        owner = msg.sender; 
    }
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}