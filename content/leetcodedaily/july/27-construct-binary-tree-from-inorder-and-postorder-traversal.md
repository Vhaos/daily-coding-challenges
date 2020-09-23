---
title: "Construct Binary Tree From Inorder and Postorder Traversal"
date: 2020-07-27T01:00:52+01:00
author: Kareem
tags:
  - "Binary Tree"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 27

## Problem Statement

Given inorder and postorder traversal of a tree, construct the binary tree.

**Note:**\
You may assume that duplicates do not exist in the tree.

For example, given

inorder = [9,3,15,20,7]\
postorder = [9,15,7,20,3]\
Return the following binary tree:
```
    3
   / \
  9  20
    /  \
   15   7
```

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {inorder}, number[] {postorder}
- **O**: TreeNode(val, left, right)
- **C**: 0 <= N <= 1000,
- **E**: - tree is null i.e. empty arrays
  - root is only node in tree
  - all nodes along one branch

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

class TreeNode {
  constructor(val = 0, left = null, right = null){
    this.val = val
    this.right = right
    this.left = left
  }
}

/**
 * @param {number[]} inorder
 * @param {number[]} postorder
 * @return {TreeNode}
 */
function buildTree(inorder, postorder) {
  if(inorder.length === 0){
    return null
  }
  
  const posMap = new Map()
  for(let i = 0; i < inorder.length; i++){
    posMap.set(inorder[i], i)
  }
  
  const recur = (start, end) => {
    if(start > end) return null
    const rootVal = postorder.pop()
    const root = new TreeNode(rootVal)
    root.right = recur(posMap.get(rootVal) + 1, end)
    root.left = recur(start, posMap.get(rootVal) - 1)
    return root
  }
 
  const tree = recur(0, inorder.length - 1)
  return tree
};
```

**_Time complexity_**: O(N)\
\- where N is the number of nodes in the tree/array\
**_Space complexity_**: O(N)