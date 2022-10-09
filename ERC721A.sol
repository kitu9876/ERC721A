// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import 'https://github.com/chiru-labs/ERC721A/blob/main/contracts/ERC721A.sol';
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721A is ERC721A, Ownable{
    string private InitbaseURI;

    constructor(string memory name_, string memory symbol_, string memory baseURI_) ERC721A(name_, symbol_) {
        InitbaseURI = baseURI_;
    }

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function setBaseURI(string memory newBaseURI) public onlyOwner {
        InitbaseURI = newBaseURI;
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function createtoken(address to, uint256 quantity) public {
        _safeMint(to, quantity);
    }

     function _baseURI() internal view virtual override returns (string memory) {
        return 'InitbaseURI';
     }
}  
Footer
