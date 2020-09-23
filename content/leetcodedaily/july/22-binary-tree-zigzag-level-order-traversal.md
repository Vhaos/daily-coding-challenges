---
title: "Binary Tree Zigzag Level Order Traversal"
date: 2020-07-22T01:00:52+01:00
author: Kareem
tags:
  - "Binary Tree"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 22

## Problem Statement

Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

For example:\
Given binary tree [3,9,20,null,null,15,7],
```
    3
   / \
  9  20
    /  \
   15   7
```
return its zigzag level order traversal as:
```
[
  [3],
  [20,9],
  [15,7]
]
```


## Inputs, Outputs, Constraints & Exceptions
- **I**: Node<val, left, right>
- **O**: number[][]
- **C**: none/optimise
- **E**: - root is null
  - root is only node in tree

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
 * @param {TreeNode} root
 * @return {number[][]}
 */
function zigzagLevelOrder(root) {
  // root is null
  if(!root) return [];

  const q = []
  const result = []
  let level = 0
  q.push(root)
 
  while(q.length){
    const qlen = q.length
    const levelNodes = []

    for(let i = 0; i < qlen; i++){
      const node = q.shift()
      
      if(node.left) q.push(node.left);
      if(node.right) q.push(node.right);

      levelNodes.push(node.val)
    }
    
    if(level % 2 === 1) levelNodes.reverse()   
    result.push(levelNodes)
    level++
  }

  return result 
};
```

## Code (using .unshift instead of .reverse)
```js
function zigzagLevelOrder(root) {
  // root is null
  if(!root) return [];

  const q = []
  const result = []
  let level = 0
  q.push(root)
 
  while(q.length){
    const qlen = q.length
    const levelNodes = []
    
    const reverse = level % 2 === 1

    for(let i = 0; i < qlen; i++){
      const node = q.shift()
      
      if(node.left) q.push(node.left);
      if(node.right) q.push(node.right);

      if(reverse) levelNodes.unshift(node.val);
      else levelNodes.push(node.val);
    }
    
    result.push(levelNodes)
    level++
  }

  return result 
};
```