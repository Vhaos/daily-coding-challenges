---
title: "Sum of Left Leaves"
date: 2020-08-24T01:00:52+01:00
author: Kareem
tags:
  - Binary Tree
  - Inorder Traversal
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 24

## Problem Statement

Find the sum of all left leaves in a given binary tree.

**Example:**
```
    3
   / \
  9  20
    /  \
   15   7
```
There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode(val, left, right) {root}
- **O**: number
- **C**: none/optimise
- **E**: - root is null
  - root is the only node
  - all child nodes are `.right` nodes


## Code (inorder traversal)

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
function sumOfLeftLeaves(root) {
  let sum = 0;
  
  const traverse = (node, isLeftLeaf = false) => {
    if(!node) return;
    
    if(isLeftLeaf && !node.left && !node.right){
      sum += node.val
    }
    
    traverse(node.left, true)
    traverse(node.right)
  }
  
  traverse(root)
  return sum
}
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(N)