---
title: "Best Time to Buy and Sell Stock III"
date: 2020-08-16T01:00:52+01:00
author: Kareem
tags:
  - Greedy
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 16

## Problem Statement

Say you have an array for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete at most two transactions.

Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

**Example 1:**
```
Input: [3,3,5,0,0,3,1,4]
Output: 6
```
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
             Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

**Example 2:**
```
Input: [1,2,3,4,5]
Output: 4
```
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
             engaging multiple transactions at the same time. You must sell before buying again.

**Example 3:**
```
Input: [7,6,4,3,1]
Output: 0
```
Explanation: In this case, no transaction is done, i.e. max profit = 0.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {prices}
- **O**: number {maxProfit}
- **C**: - 1 <= prices.length <= $10^{4}$
  - 0 <= prices[i] <= $10^{4}$
- **E**: - length of prices array is < 2
  - all prices are the same
  - prices in descending order
  - prices in ascending order

## Code (initial attempt)
```js
/**
 * @param {number[]} prices
 * @return {number}
 */
const maxProfit = (prices) => {
  let profits1 = [0], minPrice = prices[0], profit = 0
  for(let i = 1; i < prices.length; i++) {
    profit = Math.max(profit, prices[i] - minPrice)
    minPrice = Math.min(minPrice, prices[i])
    profits1[i] = profit
  }

  profit = 0
  let profits2 = [], maxPrice = prices[prices.length - 1];
  for(let i = prices.length - 2; i >= 0; i--) {
    profit = Math.max(profit, maxPrice - prices[i])
    maxPrice = Math.max(maxPrice, prices[i])
    profits2[i] = profit
  }
  profits2.push(0)

  let maxProfit = 0
  for(let i = 0; i < profits1.length; i++){
    maxProfit = Math.max(maxProfit, profits1[i] + profits2[i])
  }

  return maxProfit
};
```
**_Time complexity:_** O(N)\
**_Space complexity:_** O(N)

## Code (second attempt)
```js
/**
 * @param {number[]} prices
 * @return {number}
 */
const maxProfit = (prices) => {
  let n = prices.length
  if(prices == null || n < 2){
    return 0
  }

  let p1 = prices[0], p2 = prices[n - 1]
  const profit1 = new Array(n).fill(0)
  const profit2 = new Array(n).fill(0)

  for(let i = 1; i < n; i++){
    profit1[i] = Math.max(profit1[i-1], prices[i] - p1)
    p1 = Math.min(p1, prices[i])

    let j = n-1-i
    profit2[j] = Math.max(profit2[j+1], p2 - prices[j])
    p2 = Math.max(p2, prices[j])
  }
  
  let maxProfit = 0
  for(let i = 0; i < profit1.length; i++)
    maxProfit = Math.max(maxProfit, profit1[i] + profit2[i]);

  return maxProfit
}
```
**_Time complexity:_** O(N)\
**_Space complexity:_** O(N)
