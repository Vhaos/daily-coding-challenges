---
title: "Same Tree"
date: 2020-07-13T01:00:52+01:00
author: Kareem
tags:
  - "Queue"
  - "Binary Tree"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 13

## Problem Statement

Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

**Example 1:**
```
Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]
```
Output: true

**Example 2:**
```
Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]
```
Output: false

**Example 3:**
```
Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]
```
Output: false

## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode, TreeNode
- **O**: boolean
- **C**: none, optimise
- **E**: inputs are null, only one node in trees


## Code

```js
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {boolean}
 */
function isSameTree(p, q) {
  if(!p && !q){
    return true
  }

  let queue1 = []
  queue1.push(p)
  let queue2 = []
  queue2.push(q)
  
  while(queue1.length || queue2.length){
    let curr1 = queue1.shift()
    let curr2 = queue2.shift()
    
    if (curr1 && curr2 && curr1.val !== curr2.val) {
      return false;
    }
    
    if((curr1 && !curr2) || (!curr1 &&curr2)){
      return false;
    }

    if (curr1) {
      queue1.push(curr1.left);
      queue1.push(curr1.right);
    }
    
    if (curr2) {
      queue2.push(curr2.left);
      queue2.push(curr2.right);
    }
  }

  return true
};
```

**_Time complexity_**: O(Max(N, M)) \
\- where n and m are the number of node in trees p and q\
**_Space complexity_**: O(N + M)