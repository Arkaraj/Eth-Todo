// Made from 0.5.1
pragma solidity 0.5.1;

// Two separate Smart Contract & Inheritance
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        // msg.sender for current user types, tx.origin for initiated/ originated the transaction
        balances[tx.origin]++;
    }
}

contract MyToken is ERC20Token {
    // Overwrites the name in ERC20Token
    // string public name = "My token";

    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor(string memory _name, string memory _symbol)
        public
        ERC20Token(_name)
    {
        symbol = _symbol;
    }

    function mint() public {
        // To preserve the mint function from parent class
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}

contract MyContract {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    // function() external payable{
    //     buyToken();
    // }

    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
