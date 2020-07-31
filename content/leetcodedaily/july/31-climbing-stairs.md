---
title: "Climbing Stairs"
date: 2020-07-31T01:00:52+01:00
author: Kareem
tags:
  - "Dynammic Programming"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 31

## Problem Statement

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

**Example 1**:
```
Input: 2
Output: 2
```
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

**Example 2**:
```
Input: 3
Output: 3
```
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step

**Constraints:**

1 <= n <= 45

## Inputs, Outputs, Constraints & Exceptions
- **I**: number {n}
- **O**: number
- **C**: - optimise
  - n in range [1, 45]
- **E**: n is 1


## Code (bruteforce)
```js
/**
 * @param {number} n
 * @return {number}
 */
function climbStairs(_n) {
  const climb = (i, n) => {
    if(i > n){
      return 0;
    }

    if(i == n){
      return 1
    }

    return climb(i + 1, n) + climb(i + 2, n)
  }
  return climb(0, _n)
};
```
**Time complexity:** O(2n)\
**Space complexity:** O(n)

## Code (bruteforce with memoization)
```js
/**
 * @param {number} n
 * @return {number}
 */
function climbStairs(_n) {
  const memo = new Map()
  const climb = (i, n) => {
    if(i > n){
      return 0;
    }
    if(i == n){
      return 1
    }
    if(memo.has(i)){
      memo.get(i)
    }
    memo.set(i, climb(i + 1, n) + climb(i + 2, n))
    return memo.get(i)
  }
  return climb(0, _n)
};
```

**Time complexity:** O(n)\
**Space complexity:** O(n)

## Code (with dynammic programming)
```js
function climbStairs(n){
  if(n === 1){
    return 1
  }
  const dp = []
  dp[1] = 1
  dp[2] = 2
  for(let i = 3; i <= n; i++){
    dp[i] = dp[i - 1] + dp[i - 2]
  }
  return dp[n]
}
```
**Time complexity:** O(n)\
**Space complexity:** O(n)

## Code (with dynammic programming constant space)
```js
function climbStairs(n){
  if(n === 1){
    return 1
  }
  let first = 1
  let second = 2
  
  for(let i = 3; i <= n; i++){
    let third = first + second
    first = second
    second = third 
  }

  return second
}
```
**Time complexity:** O(n)\
**Space complexity:** O(1)
