---
title: "Best Time to Buy and Sell Stock With Cooldown"
date: 2020-07-29T01:00:52+01:00
author: Kareem
tags:
  - "Greedy"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 29

## Problem Statement

Say you have an array for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:

You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).

After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)

**Example**:

```
Input: [1,2,3,0,2]
Output: 3
```
Explanation: transactions = [buy, sell, cooldown, buy, sell]


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {prices}
- **O**: number
- **C**: prices in range [0, 1000]
- **E**: - size of input is 0
  - size of input is 1
  - prices are all the same

## Code

```js
/**
 * @param {number[]} prices
 * @return {number}
 */
function maxProfit(prices) {
  if(prices == null || prices.length === 0){
    return 0;
  }

  let bought = -Infinity, sold = 0, rest = 0;
  for (let i = 0; i < prices.length; i++) {
    let nextBought = Math.max(bought, rest - prices[i]);
    let nextSold = bought + prices[i];
    let nextRest = Math.max(rest, sold);
    bought = nextBought;
    sold = nextSold;
    rest = nextRest;
  }
  return Math.max(sold, rest);
};
```

**_Time complexity_**: O(N)\
\- where N is the size of the array\
**_Space complexity_**: O(1)\
\- because we only use a constant number of variables