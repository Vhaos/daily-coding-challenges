---
title: "H-Index"
date: 2020-08-11T01:00:52+01:00
author: Kareem
tags:
  - String
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 11

## Problem Statement

Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."

**Example:**
```
Input: citations = [3,0,6,1,5]
Output: 3 
```
Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively. Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, her h-index is 3.

Note: If there are several possible values for h, the maximum one is taken as the h-index.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {citations}
- **O**: number {h}
- **C**: - citations length in range [0,1000]
  - citations[i] in range [0,1000]
  - citations[i] are non-unique
- **E**: - c.length is 0
  - c.length is 1
  - all citations are the same

## Code (with sorting)
```js
/**
 * @param {number[]} citations
 * @return {number}
 */
function hIndex(citations) {
  citations.sort((a,b) => b-a)
  let h = 0;
  for(let i = 0; i < citations.length; i++){
    if(citations[i] >= i + 1){
      h = i + 1
    }
  }
  return h
};
```
**Time complexity:** O(NlogN)\
**Space complexity:** O(1)

## Code (with a hashmap/countsort)
```js
/**
 * @param {number[]} citations
 * @return {number}
 */
function hIndex(citations) {
  const cMap = new Array(citations.length + 1).fill([])
  for(let c of citations){
    if(c >= citations.length){
      cMap[citations.length] = cMap[citations.length].concat(c)
    } else {
      cMap[c] = cMap[c].concat(c)
    }
  }
  const sorted = cMap.reduce((acc, curr) => acc.concat(curr), [])
  let h = 0;
  for(let i = sorted.length - 1; i >= 0; i--){
    if(sorted.length - i > sorted[i])
      break;
    if(sorted[i] >= sorted.length - i)
      h = sorted.length - i;
  }
  return h
};
```
**Time complexity:** O(N)\
**Space complexity:** O(N)

## Best solution found online
```js
/**
 * @param {number[]} citations
 * @return {number}
 */
var hIndex = function(citations) {
    const n = citations.length
    const bucket = new Array(n + 1).fill(0)
    
    for(const c of citations) {
        if(c >=n) {
            bucket[n]++
        }
        else {
            bucket[c]++
        }
    }
    
    let count = 0
    for(let i = n; i >= 0; i--) {
        count += bucket[i]
        
        if(count >= i) return i
    }
    
    return 0
};
```