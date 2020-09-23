---
title: "Find Minimum in Rotated Sorted Array II"
date: 2020-07-25T01:00:52+01:00
author: Kareem
tags:
  - "Array"
  - "Binary Search"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 25

## Problem Statement

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

The array may contain duplicates.

**Example 1:**
```
Input: [1,3,5]
Output: 1
```
**Example 2:**
```
Input: [2,2,2,0,1]
Output: 0
```
**Note:**

This is a follow up problem to Find Minimum in Rotated Sorted Array.
Would allow duplicates affect the run-time complexity? How and why?

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number
- **C**: time complexity < O(n), optimise
- **E**: - array of 1 element
  - array of duplicates of the same element
  - array is not 'rotated' at all

## Code (bruteforce)

```js
function findMin(nums) {
  if(nums.length === 1) return nums[0]
  for(let i = 1; i < nums.length; i++){
    if(nums[i] < nums[i-1]){
      return nums[i]
    }
  }
  return nums[0]
};
```

**_Time complexity_**: O(N) \
**_Space complexity_**: O(1)

## Code (binary search)

```js
function findMin(nums) {
  /* todo */
};
```

**_Time complexity_**: O(LogN) \
**_Space complexity_**: O(1)
