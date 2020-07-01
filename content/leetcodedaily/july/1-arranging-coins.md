---
title: "Arranging Coins"
date: 2020-07-01T21:58:20+01:00
author: Kareem
tags:
  - "Math"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 1

## Problem Statement

You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins. Given n, find the total number of full staircase rows that can be formed. n is a non-negative integer and fits within the range of a 32-bit signed integer.

**Example 1:**

```
n = 5
```

The coins can form the following rows:
```
¤
¤ ¤
¤ ¤
```
Because the 3rd row is incomplete, we return 2.

**Example 2:**
```
n = 8
```
The coins can form the following rows:
```
¤
¤ ¤
¤ ¤ ¤
¤ ¤
```
Because the 4th row is incomplete, we return 3.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number {n}
- **O**: number
- **C**: none, optimise
- **E**: n is zero

## PseudoCode

1. return 0 if n is zero
2. stairCount := 1 
3. while n - stairCount is non-negative, keep incrementing staircount and subtracting stairCount from n
4. Once n - stairCount is negative, return stairCount


## Code (naive)

```js
const arrangeCoins = (n) => {
  let stairCount = 0  
  while(Math.sign(n - stairCount) >= 0){
    n -= stairCount
    stairCount++
  }
  return stairCount - 1
};
```

**_Time complexity_**: O(n)\
**_Space complexity_**: O(1)

## PseudoCode 2

1. return 0 if n is zero
2. using the sum of the arithmetic series 1+2+3+4...k => k(k+2)/2, we try to find a value k where k(k+1)/2 <= N 
3. we can use binary search to find this value, 

## Code 2

```js
const arrangeCoins = (n) => {
  if(n === 0){
    return 0
  }

  let left = 0, right = n
  while(left <= right){
    let mid = Math.floor((left + right)/2)
    let sum = mid * (mid + 1)/2
    if(sum > n){
      right = mid - 1
    } else {
      left = mid + 1
    }
  }

  return right
}
```

**Time complexity:** O(log(n))\
**Space complexity:** O(1)

## PseudoCode 3

1. looking deeper into the formualt k(k+1)/2 <= N, we can use the completing the square technique to get the equation:

$ k = \left [ \sqrt{2N + \frac{1}{4} - \frac{1}{2}} \right ] $

We can now solve for k

## Code 3

```js
const arrangeCoins = (n) => {
  let result = Math.sqrt(2*n + 0.25) - 0.5
  return Math.floor(result)
};
```

**Time complexity:** O(1), however depending on the implementation of Math.sqrt() it could be seen as log(n)\
**Space complexity:** O(1)
