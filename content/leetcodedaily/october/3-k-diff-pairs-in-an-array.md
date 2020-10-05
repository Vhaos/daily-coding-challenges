---
title: "K-Diff Pairs in an Array"
date: 2020-10-03T01:00:52+01:00
author: Kareem
tags:
  - Array
  - Two Pointers
---

<!-- LeetCode month and day here -->
# LeetCode October - Day 3

## Problem Statement

Given an array of integers `nums` and an integer `k`, return the number of **unique** _k-diff_ pairs in the array.

A **k-diff** pair is an integer pair `(nums[i], nums[j])`, where the following are true:

- `0 <= i, j < nums.length`
- `i != j`
- `a <= b`
- `b - a == k`
 

**Example 1:**
```
Input: nums = [3,1,4,1,5], k = 2
Output: 2
```
**Explanation**: There are two 2-diff pairs in the array, (1, 3) and (3, 5).\
Although we have two 1s in the input, we should only return the number of unique pairs.
Example 2:
```
Input: nums = [1,2,3,4,5], k = 1
Output: 4
```
**Explanation:** There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
**Example 3:**
```
Input: nums = [1,3,1,5,4], k = 0
Output: 1
```
**Explanation**: There is one 0-diff pair in the array, (1, 1).
**Example 4:**
```
Input: nums = [1,2,4,4,3,3,0,9,2,3], k = 3
Output: 2
```
**Example 5:**
```
Input: nums = [-1,-2,-3], k = 1
Output: 2
```

**Constraints**:

- 1 <= nums.length <= $10^4$
- $-10^7$ <= nums[i] <= $10^7$
- 0 <= k <= $10^7$

## Inputs, Outputs, Constraints & Exceptions
- **I**: - number[] {nums}
  - number {k}
- **O**: number
- **C**: None other than the above
- **E**: - nums.length is 1
  - k is 0
  - num is filled with same number e.g. `[1, 1, 1, 1]`

## Code (two nested loops)

```js
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
function findPairs(nums, k) {
  nums.sort((a, b) => a - b)
  const store = new Map()

  for(let i = 0; i < nums.length - 1; i++){
    for(let j = i+1; j < nums.length; j++){
      const diff = nums[i] - nums[j]
      if(Math.abs(diff) === k){
        store.set(nums[i], nums[j])
      }
    }
  }

  return store.size
};
```

**_Time complexity_**: O($N^2$)\
**_Space complexity_**: O($N$)\
\- Our the number of pairs HashMap stores increases linearly with N.

## Code (hashmap and looping twice)

```js
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
function findPairs(nums, k) {
  // create hashMap of nums -> freq
  const hm = new Map();
  for(let n of nums){
    hm.set(n, (hm.get(n) || 0) + 1)
  }
  
  // See if nums[i] + k in hashMap
  let count = 0;
  for(let [num, freq] of hm.entries()){
    if(k === 0){
      if(freq > 1) count++;
    } else {
      if(hm.has(num + k)) count++;
    }
  }
  
  return count
};
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(N)