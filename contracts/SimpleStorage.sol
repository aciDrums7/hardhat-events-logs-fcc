// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {

    uint256 private favoriteNumber;

    event storedNumber(
        uint256 indexed oldNumber,
        uint256 indexed newNumber,
        uint256 addedNumber,
        address sender
    );

    constructor() {
    }

    function getFavoriteNumber() public view returns(uint256) {
        return favoriteNumber;
    }

    function setFavoriteNumber(uint256 newFavoriteNumber) public {
        emit storedNumber(
            favoriteNumber,
            newFavoriteNumber,
            favoriteNumber + newFavoriteNumber,
            msg.sender
        );
        favoriteNumber = newFavoriteNumber;
        // usually U wanna emit the event after all the processing!
        // here we did the contrary just for simplicity
    }

}