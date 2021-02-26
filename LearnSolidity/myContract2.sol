pragma solidity 0.7.0;

contract MyContract2 {
    mapping(address => uint256) public balances;
    // send to funds this wallet
    address payable wallet;

    // Events
    event Purchase(address _buyer, uint256 _amount);

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    // fallback
    fallback() external payable {
        buyToken();
    }

    // Function to accept ether
    // payable is a modifier that allows u to pay
    function buyToken() public payable {
        // buy a buyToken

        balances[msg.sender] += 1;

        // send ether to wallet
        wallet.transfer(msg.value);

        // gives a log
        emit Purchase(msg.sender, 1);
    }
}
