// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
 * @title A Raffle / Lottery Contract
 * @author Samuel Pop
 * @notice A simple Raffle lottery contract
 * @dev Implements Chainlink VRFv2.5
 */

contract Raffle {
    //Errors
    error Raffle__NotEnoughFee();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    // Events
    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughFee();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() public {}

    // Getter Functions

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
