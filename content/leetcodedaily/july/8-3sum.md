---
title: "3Sum"
date: 2020-07-08T01:00:52+01:00
author: Kareem
tags:
  - ""
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 8

## Problem Statement

Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:
The solution set must not contain duplicate triplets.

**Example:**
Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
```
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number[][]
- **C**: no duplicates in result, optimise
- **E**: empty array, no elements satisfy, all zeros

## Code

```js
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
const threeSum = (nums) => {
  let result = []
  nums = nums.sort((a, b) => a - b)

  for(let i = 0; i < nums.length - 2; i++){
    if(nums[i] > 0) break;
    let subArray = [...nums.slice(i+1)]
    let sums = twoSum(subArray, 0 - nums[i])
    for(let sum of sums){
      result.push([nums[i], ...sum])
    }  
  }
  return result;
};

const twoSum = (nums, target) => {
  const diffs = new Map()
  nums.forEach((curr, idx) => diffs.set(target-curr, idx))
  
  let result = []
  for(let i = 0; i < nums.length; i++){
    let match = diffs.get(nums[i])
    if(match && match !== i){
      result.push([nums[i], nums[match]])
    }
  }
  return result
}
```

## Code 2

```js
const threeSum = (nums) => {
  
  if(nums.length < 3) return [];
  
  nums = nums.sort((a, b) => a - b);
  
  let result = [];
  let target = 0;

  for(let i = 0; i < nums.length - 2; i++){
    
    if(nums[i] > target) break;
    if(nums[i] === nums[i - 1]) continue;

    let j = i + 1;
    let k = nums.length - 1;
    
    while(j < k){
      let sum = nums[i] + nums[j] + nums[k];
      if(target === sum){
        result.push([nums[i], nums[j], nums[k]]);

        while(nums[j]===nums[j+1]) j++;
        while(nums[k]===nums[k-1]) k--;
  
        j++;
        k--;

      } else if(sum < target){
        j++;
      } else {
        k--;
      }
    }
  }
  return result;
}
```