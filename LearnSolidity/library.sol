pragma solidity 0.7.0;

library Math {
    function divideByZero(uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

// Note to deploy from another file use, import './Math.sol' => relative imports

contract MyContract {
    uint256 public value;

    function calculate(uint256 _value1, uint256 _value2) public {
        value = Math.divideByZero(_value1, _value2);
    }
}
