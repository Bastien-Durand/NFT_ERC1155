pragma solidity ^0.8.0;

// Import 1155 Token Contract from openzepplin.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

// Import Ownership functionality for _mint function.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// Creating a new SmartContract contract named NFTContract and declaring the type of token.
contract NFTContract is ERC1155, Ownable {
    
    // Declaration of type of intiger
    uint256 public constant ARTWORK = 0;
    uint256 public constant PHOTO = 0;
    
    // Initialize and call mint function that takes in (address to, uint256 id, uint256 amount)
    constructor() ERC1155("") {
        _mint(msg.sender, ARTWORK, 1, "");
        _mint(msg.sender, PHOTO, 2, "");
    }
    
    // Creating the _mint function. ref: github - openZepplin/ERC1155.sol - So we may mint more NFT's as the owner.
    
    // The _mint function will only be accessible by the address that deployed the contract initially.
    
    // "onlyOwner" is a modifier applied from OpenZepplin/contracts/access/Ownable.sol to declare ownership when minted.
    // Modifier = a snippet of code that runs before our function does
    // when the onlyOwner runs, it checks if the caller = owner
    function mint(address account, uint256 id, uint256 amount) public onlyOwner{
        _mint(account, id, amount, "");
    }
    
    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }
    
}
