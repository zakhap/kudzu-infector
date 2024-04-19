//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";

contract Infector {
    address public kudzoAddress;
    IERC721Enumerable public kudzo;
    uint256 public totalInfected;
		address public creatorAddress;

    event Infection(address indexed recipient, uint256 indexed parentId, uint256 indexed index);

    constructor(address _kudzoAddress, address _creatorAddress) {
        totalInfected = 0;
				kudzoAddress = _kudzoAddress;
				kudzo = IERC721Enumerable(kudzoAddress);
				creatorAddress = _creatorAddress
    }

    function isInfected() public view returns (bool) {
        return kudzo.balanceOf(address(this)) > 0;
    }

    function selfInfect() public {
			assert(isInfected());
			uint256 parentId = pseudoRNG(kudzo.totalSupply());
			kudzo.transferFrom(address(this), msg.sender, parentId);
			emit Infection(msg.sender, parentId, totalInfected);
			totalInfected++;
		}

    function getTotalSelfInfected() public view returns (uint256) {
        return totalInfected;
    }

    function pseudoRNG(uint modulo) public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.number))) % modulo + 1;
    }
}
