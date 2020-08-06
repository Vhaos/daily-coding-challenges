---
title: "Find All Duplicates in an Array"
date: 2020-08-06T01:00:52+01:00
author: Kareem
tags:
  - "Array"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 6

## Problem Statement

Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements that appear twice in this array.

Could you do it without extra space and in O(n) runtime?

**Example:**
```
Input:
[4,3,2,7,8,2,3,1]
Output:
[2,3]
```

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {nums}
- **O**: number[]
- **C**: - nums.length in range [1, 10000]
  - nums[i] in range of [1, nums.length]
- **E**: - nums.length is 1
  - no duplicates nums
  - nums is full of duplicates

## Code (easy solution with a hashmap)
```js
/**
 * @param {number[]} nums
 * @return {number[]}
 */
function findDuplicates(nums) {
  let result = [], hm = new Map()
  for(let n of nums){
    if(hm.has(n)) {
      result.push(n)
    } else {
      hm.set(n, true)
    }
  }
  return result;
}
```

**Time complexity:** O(n)\
**Space comeplexity:** O(n)

## Code (easy solution with an inplace sort)
```js
function findDuplicates(nums){
  nums.sort((a, b) => a - b)
  let result = []
  for(let i = 0; i < nums.length - 1; i++){
    if(nums[i] === nums[i + 1]){
      result.push(nums[i])
    }
  }
}
```
**Time complexity:** O(nlogn)\
**Space complexity:** O(1) 

## Code (optimal solution)
```js
/**
 * @param {number[]} nums
 * @return {number[]}
 */
function findDuplicates(nums) {
  let result = []
  for(let i = 0; i < nums.length; i++){
    let index = Math.abs(nums[i]) - 1
    if(nums[index] < 0) result.push(index + 1)
    nums[index] = -nums[index]
  }
  return result
};
```
**Time complexity:** O(n)\
**Space complexity:** O(1)
