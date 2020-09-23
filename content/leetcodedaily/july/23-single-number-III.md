---
title: "Single Number III"
date: 2020-07-23T01:00:52+01:00
author: Kareem
tags:
  - "Hashmap"
  - "Bit Manipulation"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 23

## Problem Statement

Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.

**Example:**
```
Input:  [1,2,1,3,2,5]
Output: [3,5]
```
**Note:**

The order of the result is not important. So in the above example, [5, 3] is also correct.

Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number[]
- **C**: time O(n), space O(1)
- **E**: only two elements in array

## Code (using a hashmap)

```js
/**
 * @param {number[]} nums
 * @return {number[]}
 */
function singleNumber(nums) {
  if(nums.length < 3) return [...nums];
  
  const hm = new Map()
  for(let num of nums){
    if(hm.get(num)) hm.delete(num);
    else hm.set(num, 1);
  }
 
  return [...hm.keys()]
};
```

**_Time complexity_**: O(N)\
\- where N is the number of items in nums\
**_Space complexity_**: O(N)

## Code (using xor)

```js
/**
 * @param {number[]} nums
 * @return {number[]}
 */
function singleNumber(nums) {
  if(nums.length < 3) return [...nums];
  
  const xy = nums
    .reduce((acc, curr) => acc ^ curr, 0)
  const mostSigBit = xy.toString(2).length - 1
  const x = nums
    .filter(num => (num >> mostSigBit & 1) === 1)
    .reduce((acc, curr) => acc ^ curr, 0)

  return [x, xy ^ x]
};
```

**_Time complexity:_** O(n)\
**_Space complexity:_** O(1)