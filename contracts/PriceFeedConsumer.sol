// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink-0.8.0/contracts/src/interfaces/AggregatorV3Interface.sol";

contract PriceFeedConsumer {
    AggregatorV3Interface internal priceFeed;

    constructor(address AggregatorAddress) {
        priceFeed = AggregatorV3Interface(AggregatorAddress);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
}
