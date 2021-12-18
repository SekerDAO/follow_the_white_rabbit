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
    mapping(bytes32 => bool) public isCorrectAnswer;
    mapping(address => bool) public isWinner;

    uint256 public totalWinners;

    function submitKnowledgeChallenge(string memory answer) external {
        if (isCorrectAnswer[keccak256(abi.encodePacked(answer))] == true) {
            require(totalWinners <= 50, "knowledge submissions are maxed out");
            isWinner[msg.sender] = true;
            totalWinners++;
        }
    }

    function submitManifestorChallenge(string memory answer) external {
        if (isCorrectAnswer[keccak256(abi.encodePacked(answer))] == true) {
            require(totalWinners <= 100, "manifestor submissions are maxed out");
            isWinner[msg.sender] = true;
            totalWinners++;
        }
    }

    function submitAdventurerChallenge(string memory answer) external {
        if (isCorrectAnswer[keccak256(abi.encodePacked(answer))] == true) {
            require(totalWinners <= 150, "adventurer submissions are maxed out");
            isWinner[msg.sender] = true;
            totalWinners++;
        }
    }

    function submitMysticChallenge(string memory answer) external {
        if (isCorrectAnswer[keccak256(abi.encodePacked(answer))] == true) {
            require(totalWinners <= 200, "mystic submissions are maxed out");
            isWinner[msg.sender] = true;
            totalWinners++;
        }
    }

    function uploadAnswers(string[] memory answers) external onlyOwner {
        for (uint256 i = 0; i < answers.length; i++) {
            isCorrectAnswer[keccak256(abi.encodePacked(answers[i]))] = true;
        }
    }

    function theDataWeCall(bytes calldata data) external onlyOwner {}
}
