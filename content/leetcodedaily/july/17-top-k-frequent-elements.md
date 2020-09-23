---
title: "Top K Frequent Elements"
date: 2020-07-17T01:00:52+01:00
author: Kareem
tags:
  - "Heap"
  - "Quickselect"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 17

## Problem Statement

Given a non-empty array of integers, return the k most frequent elements.

**Example 1:**
```
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
```
**Example 2:**
```
Input: nums = [1], k = 1
Output: [1]
```
**Note:**

- You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
- Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
- It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
- You can return the answer in any order.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {nums}, number {k}
- **O**: number[] {res}
- **C**: at least nlogn fast, optimise
- **E**: array size is 1

## Code

```js
// create a hashmap mapping num -> occurence
// sort this hashmap in descending order of occurence

// iterate through hashmap place first n elements in res array
// return res 

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
function topKFrequent(nums, k) {
  let occurences = new Map()
  for(let num of nums){
    if(occurences.has(num)) {
      occurences.set(num, occurences.get(num) + 1)
    } else {
      occurences.set(num, 1)
    }
  }

  let freq = Array.from(occurences).sort((a, b) => -a[1] + b[1])
  
  let res = []
  for(let i = 0; i < k; i++){
    res.push(freq[i][0])
  }

  return res
};
```

## Code (using a Heap)

```js
// JS has no in-built heap datastructure, so we'll have to implement one
class MaxHeap {
  constructor(){
    this.heap = [null]
  }

  get min(){
    return this.heap[1]
  }
  
  insert(item){
    let heap = this.heap
    heap.push(item)
    let curr = heap.length - 1
    
    while(curr > 1 && heap[curr].val > heap[Math.floor(curr/2)].val){
      [heap[curr], heap[Math.floor(curr/2)]] = [heap[Math.floor(curr/2)], heap[curr]]
      curr = Math.floor(curr/2)
    }
  }

  remove() {
    let heap = this.heap
    let biggest = heap[1]
    heap[1] = heap.pop()

    let curr = 1
    let left = 2 * curr
    let right = 2 * curr + 1

    while(heap[left] && heap[right] && heap[curr].val < Math.max(heap[left].val, heap[right].val)){
      if(heap[right].val < heap[left].val){
        [heap[curr], heap[left]] = [heap[left], heap[curr]]
        curr = left
      } else {
        [heap[curr], heap[right]] = [heap[right], heap[curr]]
        curr = right
      }
      left = 2 * curr
      right = 2 * curr + 1
    }

    if(heap[right] === undefined && heap[curr].val < heap[left]?.val){
      [heap[curr], heap[left]] = [heap[left], heap[curr]]
    }
     
    return biggest
  }
}

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
function topKFrequent(nums, k) {
  // build frequency map
  let freq = new Map()
  for(let num of nums){
    if(freq.has(num)){
      freq.set(num, freq.get(num) + 1)
    } else {
      freq.set(num, 1)
    }
  }

  let heap = new MaxHeap()
  for(let [k, v] of freq.entries()){
    heap.insert({key: k, val: v})
  }
 
  console.log(heap.heap)
  let res = []
  for(let i = 0; i < k; i++){
    res.push(Number(heap.remove().key))
  }

  return res
}
```

## Code (using quickselect)

```js
function topKFrequent(nums, k) {
  /*todo*/
}
```