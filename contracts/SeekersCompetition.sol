// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity >=0.8.0;

import "./utils/Ownable.sol";

/*
▄▄▄█████▓ ██░ ██ ▓█████      ██████ ▓█████ ▓█████  ██ ▄█▀▓█████  ██▀███    ██████ 
▓  ██▒ ▓▒▓██░ ██▒▓█   ▀    ▒██    ▒ ▓█   ▀ ▓█   ▀  ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒▒██    ▒ 
▒ ▓██░ ▒░▒██▀▀██░▒███      ░ ▓██▄   ▒███   ▒███   ▓███▄░ ▒███   ▓██ ░▄█ ▒░ ▓██▄   
░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄      ▒   ██▒▒▓█  ▄ ▒▓█  ▄ ▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄    ▒   ██▒
  ▒██▒ ░ ░▓█▒░██▓░▒████▒   ▒██████▒▒░▒████▒░▒████▒▒██▒ █▄░▒████▒░██▓ ▒██▒▒██████▒▒
  ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░   ▒ ▒▓▒ ▒ ░░░ ▒░ ░░░ ▒░ ░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░
    ░     ▒ ░▒░ ░ ░ ░  ░   ░ ░▒  ░ ░ ░ ░  ░ ░ ░  ░░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░░ ░▒  ░ ░
  ░       ░  ░░ ░   ░      ░  ░  ░     ░      ░   ░ ░░ ░    ░     
░░   ░ ░  ░  ░  
          ░  ░  ░   ░  ░         ░     ░  ░   ░  ░░  ░      ░  ░   ░           ░  
*/

contract SeekersCompetition is Ownable {
    bytes32[] public answers;

    mapping(address => bool) public isWinner;

    uint256 public totalWinners;

    event Winner(
        address winnerAddress,
        uint256 winnerNumber
    );

    modifier onlyEligible() {
        require(isWinner[msg.sender] == false, "account already registered a winner");
        _;
    }


    function submitKnowledgeChallenge(string memory answer) external onlyEligible() {
        require(answers[0] == keccak256(abi.encodePacked(answer)), "incorrect answer");
        require(totalWinners <= 50, "knowledge submissions are maxed out");
        isWinner[msg.sender] = true;
        totalWinners++;
        emit Winner(msg.sender, totalWinners);
    }

    function submitManifestorChallenge(string memory answer) external onlyEligible() {
        require(answers[1] == keccak256(abi.encodePacked(answer)), "incorrect answer");
        require(totalWinners <= 100, "manifestor submissions are maxed out");
        isWinner[msg.sender] = true;
        totalWinners++;
        emit Winner(msg.sender, totalWinners);
    }

    function submitAdventurerChallenge(string memory answer) external onlyEligible() {
        require(answers[2] == keccak256(abi.encodePacked(answer)), "incorrect answer");
        require(totalWinners <= 150, "adventurer submissions are maxed out");
        isWinner[msg.sender] = true;
        totalWinners++;
        emit Winner(msg.sender, totalWinners);
    }

    function submitMysticChallenge(string memory answer) external onlyEligible() {
        require(answers[3] == keccak256(abi.encodePacked(answer)), "incorrect answer");
        require(totalWinners <= 200, "mystic submissions are maxed out");
        isWinner[msg.sender] = true;
        totalWinners++;
        emit Winner(msg.sender, totalWinners);
    }

    function uploadAnswers(string[] memory _answers) external onlyOwner {
        for (uint256 i = 0; i < _answers.length; i++) {
            answers[i] = keccak256(abi.encodePacked(_answers[i]));
        }
    }

    function theDataWeCall(bytes calldata data) external onlyOwner {}
}
