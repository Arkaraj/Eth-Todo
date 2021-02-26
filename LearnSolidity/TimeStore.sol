pragma solidity ^0.7.0;

// Only after a certain amount of time will the tokens release
contract Timelock {
    address payable benificiary;
    uint256 public releaseTime;

    constructor(address payable _benificiary, uint256 _releaseTime)
        public
        payable
    {
        require(_releaseTime > block.timestamp);
        benificiary = _benificiary;
        releaseTime = _releaseTime;
    }

    function realease() public {
        require(block.timestamp >= releaseTime);

        address(benificiary).transfer(address(this).balance);
    }
}
