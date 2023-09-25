// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocations {
    struct User {
        string name;
        bool isActive;
        uint256[] scores;
    }

    mapping(uint256 => User) public users;

    uint256 public nextUserId = 1;

    function addUser(string memory _name, bool _isActive) public returns (uint256) {
        users[nextUserId] = User(_name, _isActive, new uint256[](0));
        nextUserId++;
        return nextUserId - 1;
    }

    function updateUser(string calldata _newName, bool _isActive, uint256 _userId) external {
        require(users[_userId].isActive, "User is not active");

        User storage userToUpdate = users[_userId];
        userToUpdate.name = _newName;
        userToUpdate.isActive = _isActive;
    }

    function deleteUser(uint256 _userId) external {
        require(users[_userId].isActive, "User is not active");

        delete users[_userId];
    }

    function addScore(uint256 _userId, uint256 _score) public {
        require(users[_userId].isActive, "User is not active");

        users[_userId].scores.push(_score);
    }

    function getScore(uint256 _userId, uint256 _index) public view returns (uint256) {
        require(_index < users[_userId].scores.length, "Index out of bounds");
        return users[_userId].scores[_index];
    }

    function transferScore(uint256 _fromUserId, uint256 _toUserId, uint256 _index) public {
        require(users[_fromUserId].isActive && users[_toUserId].isActive, "Either of the user is not active");

        User storage fromUser = users[_fromUserId];
        User storage toUser = users[_toUserId];

        require(_index < fromUser.scores.length, "Index out of bounds");
        
        toUser.scores.push(fromUser.scores[_index]);
        delete fromUser.scores[_index];
    }
}
