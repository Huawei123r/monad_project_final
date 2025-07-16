// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC1155Token is ERC1155, Ownable {
    uint256 public constant TOKEN_ID_1 = 0;
    uint256 public constant TOKEN_ID_2 = 1;

    constructor() ERC1155("https://my-token-uri.com/{id}.json") Ownable() {
        // Mint some initial tokens
        _mint(msg.sender, TOKEN_ID_1, 100, "");
        _mint(msg.sender, TOKEN_ID_2, 200, "");
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(account, id, amount, data);
    }

    function mintBatch(address account, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public onlyOwner {
        _mintBatch(account, ids, amounts, data);
    }

    function burn(address account, uint256 id, uint256 amount) public onlyOwner {
        _burn(account, id, amount);
    }

    function burnBatch(address account, uint256[] memory ids, uint256[] memory amounts) public onlyOwner {
        _burnBatch(account, ids, amounts);
    }
}
