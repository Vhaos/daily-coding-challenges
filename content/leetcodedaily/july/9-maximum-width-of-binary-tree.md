---
title: "Maximum Width of Binary Tree"
date: 2020-07-09T01:00:52+01:00
author: Kareem
tags:
  - "Binary Tree"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 9

## Problem Statement

Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.

The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

**Example 1:**

Input: 
```
           1
         /   \
        3     2
       / \     \  
      5   3     9 
```
Output: 4
Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

**Example 2:**

Input: 
```
          1
         /  
        3    
       / \       
      5   3     
```
Output: 2
Explanation: The maximum width existing in the third level with the length 2 (5,3).

**Example 3:**

Input: 
```
          1
         / \
        3   2 
       /        
      5      
```
Output: 2
Explanation: The maximum width existing in the second level with the length 2 (3,2).

**Example 4:**

Input: 
```
          1
         / \
        3   2
       /     \  
      5       9 
     /         \
    6           7
```
Output: 8
Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).


Note: Answer will in the range of 32-bit signed integer.

## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode
- **O**: number
- **C**: none
- **E**: root is null, root node is only node in tree, all nodes along one branch


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
 * @return {number}
 */
const widthOfBinaryTree = (root) => {
  
  if(!root){
    return -1; //error
  }

  let maxWidth = 0
  const q = []
  q.push(root)

  while(q.length){
    let qlength = q.length
    for(let i = 0; i < qlength; i++){
      let node = q.shift();
      if(node){
        q.push(node.left)
        q.push(node.right)
      }
    }
    
    let l = 0, r = qlength;
    while(q[l] === null){l++}
    while(q[r] === null){r--}

    const width = r - l 
    if(width > maxWidth && r > l ){
      maxWidth = width
    }
  }
 
  return maxWidth
};
```
## Code 2

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
 * @return {number}
 */
const widthOfBinaryTree = (root) => {
 
  let maxWidth = 0; 
  let q = [];
  q.push([root, 0]);

  while(q.length){
   let levelLength = q.length;
   let min = Number.MAX_VALUE, max = 0;

    for(let i = 0; i < levelLength; i++){
      let [node, pos] = q.shift();
      
      min = Math.min(min, pos);
      max = Math.max(max, pos);
  
      if(node.left){
        q.push([node.left, pos * 2 + 1])
      }
      
      if(node.right){ 
        q.push([node.right, pos * 2 + 2])
      } 
    }

    let width = levelLength === 1 ? 1 : max - min + 1;
    maxWidth = Math.max(width, maxWidth)
  }
  return maxWidth;
}
```

**_Time complexity_**: O(N)\
\- where N is the number of node in the tree\
**_Space complexity_**: O(N)\
\- worst case we store N nodes in queue