---
title: "Path Sum III"
date: 2020-08-08T01:00:52+01:00
author: Kareem
tags:
  - "Binary Tree"
  - "Dynammic Programming"
  - "Backtracking"
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 8

## Problem Statement

You are given a binary tree in which each node contains an integer value.

Find the number of paths that sum to a given value.

The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

**Example:**

root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
```
      10
     /  \
    5   -3
   / \    \
  3   2   11
 / \   \
3  -2   1
```
Return 3. The paths that sum to 8 are:

1.  5 -> 3
2.  5 -> 2 -> 1
3. -3 -> 11


## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode(val, left, right) {root}
- **O**: number
- **C**: - number of nodes is in range [0,1000]
  - val of nodes in range [-10^6, 10^6]
- **E**: - root is null
  - root is only node
  - there are paths that add to sum
  - there are nodes values that === sum

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
 * @param {number} sum
 * @return {number}
 */
function pathSum(root, sum) {
  let count = 0
  const list = []

  const findSum = (node) => {
   if(node === null){
     return;
   }

   list.push(node.val)
   findSum(node.left)
   findSum(node.right)

   let temp = 0
   for(let i = list.length - 1; i >= 0; i--){
     temp += list[i]
     if(temp === sum)
       count++
   }

   list.pop()
  }

  findSum(root)
  return count
};
```

**_Time complexity_**: O($N^{2}$) \
**_Space complexity_**: O($N$)