---
title: "Subsets"
date: 2020-07-11T01:00:52+01:00
author: Kareem
tags:
  - "Backtracking"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 11

## Problem Statement

Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

**Example:**

Input: nums = [1,2,3]
Output:
```
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
```
## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number[][]
- **C**: no duplicates in result, optimise
- **E**: empty array


## Code

```js
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
function subsets(nums) {
  if(nums.length === 0){
    return [];
  }

  const result = new Set()
  generateSubsets(nums, [], 0, result)

  return [...result]
};

function generateSubsets(nums, subset, index, result){
  result.add([...subset])  
  for(let i = index; i < nums.length; i++ ){
    subset.push(nums[i])
    generateSubsets(nums, subset, i + 1, result)
    subset.pop(subset.length-1)
  }
}
```

**_Time complexity_**: O(2^N) \
\- where N is the length of the input. This is because for each element of the array we make a choice of whether to include it in\
**_Space complexity_**: O(N)