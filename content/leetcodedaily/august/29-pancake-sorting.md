---
title: "Pancake Sorting"
date: 2020-08-29T01:00:52+01:00
author: Kareem
tags:
  - Array
  - Sort
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 29

## Problem Statement

Given an array of integers arr, sort the array by performing a series of pancake flips.

In one pancake flip we do the following steps:

1. Choose an integer k where 1 <= k <= arr.length.
2. Reverse the sub-array `arr[1...k]`.
For example, if arr = [3,2,1,4] and we performed a pancake flip choosing k = 3, we reverse the sub-array [3,2,1], so arr = [1,2,3,4] after the pancake flip at k = 3.

Return the k-values corresponding to a sequence of pancake flips that sort arr. Any valid answer that sorts the array within 10 * arr.length flips will be judged as correct.

**Example 1:**
```
Input: arr = [3,2,4,1]
Output: [4,2,4,3]
Explanation: 
We perform 4 pancake flips, with k values 4, 2, 4, and 3.
Starting state: arr = [3, 2, 4, 1]
After 1st flip (k = 4): arr = [1, 4, 2, 3]
After 2nd flip (k = 2): arr = [4, 1, 2, 3]
After 3rd flip (k = 4): arr = [3, 2, 1, 4]
After 4th flip (k = 3): arr = [1, 2, 3, 4], which is sorted.
Notice that we return an array of the chosen k values of the pancake flips.
```
**Example 2:**
```
Input: arr = [1,2,3]
Output: []
Explanation: The input is already sorted, so there is no need to flip anything.
Note that other answers, such as [3, 3], would also be accepted.
```

**Constraints:**
1. 1 <= arr.length <= 100
2. 1 <= arr[i] <= arr.length
3. All integers in arr are unique (i.e. arr is a permutation of the integers from 1 to arr.length).

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number[]
- **C**: 
- **E**: - arr.length === 1
  - arr is sorted
  - all elements in arr are the same


## Code

```js
/**
 * @param {number[]} A
 * @return {number[]}
 */
function pancakeSort(A) {
  if(A.length < 2) return [];
  
  const flip = (arr, k) => {
    let i = 0, j = k;
    while(i < j){
      [arr[i], arr[j]] = [arr[j], arr[i]];
      j--;
      i++;
    }
  }
  
  const res = []
  for(let i = A.length - 1; i >= 1; i--){
    for(let j = 1; j <= i; j++){
      if(A[j] === i + 1){
        flip(A, j);
        res.push(j + 1);
        break;
      }
    }
    flip(A, i)
    res.push(i + 1)
  }
  
  return res
}
```

**_Time complexity_**: O(N)\
\- where N is the length of the input arr
**_Space complexity_**: O(N)