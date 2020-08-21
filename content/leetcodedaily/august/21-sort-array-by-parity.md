---
title: "Sort Array by Parity"
date: 2020-08-21T01:00:52+01:00
author: Kareem
tags:
  - Array
  - Two Pointers
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 21

## Problem Statement

Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

You may return any answer array that satisfies this condition. 

**Example 1:**
```
Input: [3,1,2,4]
Output: [2,4,3,1]
```
The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted. 

**Note:**\
1 <= A.length <= 5000\
0 <= A[i] <= 5000

## Code (easy naive/bruteforce solution)
```js
function sortArrayByParity(A){
  const even = [], odd = [];
  for(let x in A){
    if(x % 2) odd.push(x);
    else even.push(x);
  }
  return [...even, ...odd];
}
```
**_Time complexity:_** O(N)\
**_Space complexity:_** O(N)

## Code (two pointers)
```js
function sortArrayByParity(A){
  if(A.length < 2) return [...A];

  let i = 0, j = A.length - 1;
  while(i < j){
    if(A[j] % 2 < A[i] % 2){
      [A[i], A[j]] = [A[j], A[i]];
    }

    if(A[i] % 2 === 0) i++;
    if(A[j] % 2 === 1) j--;
  }
  return A;
}
```
**_Time complexity:_** O(N)\
**_Space complexity:_** O(1)
