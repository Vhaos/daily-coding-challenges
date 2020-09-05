---
title: "All Elements in Two Binary Search Trees"
date: 2020-09-05T01:00:52+01:00
author: Kareem
tags:
  - Binary Tree
  - Sort
draft: true
---

<!-- LeetCode month and day here -->

# LeetCode September - Day 5

## Problem Statement

Given two binary search trees root1 and root2.

Return a list containing all the integers from both trees sorted in ascending order.

**Example 1:**
![](https://assets.leetcode.com/uploads/2019/12/18/q2-e1.png)
```
Input: root1 = [2,1,4], root2 = [1,0,3]
Output: [0,1,1,2,3,4]
```
**Example 2:**
```
Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
Output: [-10,0,0,1,2,5,7,10]
```
**Example 3:**
```
Input: root1 = [], root2 = [5,1,7,0,2]
Output: [0,1,2,5,7]
```
**Example 4:**
```
Input: root1 = [0,-10,10], root2 = []
Output: [-10,0,10]
```
**Example 5:**
![](https://assets.leetcode.com/uploads/2019/12/18/q2-e5-.png)
```
Input: root1 = [1,null,8], root2 = [8,1]
Output: [1,1,8,8]
```

**Constraints:**
1. Each tree has at most 5000 nodes.
2. Each node's value is between [$-10^5$, $10^5$].


## Inputs, Outputs, Constraints & Exceptions

- **I**: - TreeNode {root1}
  - TreeNode {root2}
- **O**: number[]
- **C**: none other than the above
- **E**: - root1 or root2 is null
  - root1 or root2 only have one node

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
 * @param {TreeNode} root1
 * @param {TreeNode} root2
 * @return {number[]}
 */
function getAllElements(root1, root2) {
  const M = inOrder(root1, [])
  const N = inOrder(root2, [])
  return merge(M, N)
};

function inOrder(node, res){
  if(node !== null) {
    if(node.left) inOrder(node.left, res);
    res.push(node.val);
    if(node.right) inOrder(node.right, res);
  }
  return res
}

function merge(M, N) {
  let [i, j, k] = [0, 0, 0]
  let res = []
  while(i < M.length && j < N.length){
    if(M[i] < N[j]) {
      res.push(M[i++])
    } else if (M[i] > N[j]){
      res.push(N[j++])
    } else {
      res.push(N[j++], M[i++])
    }
  }
  
  if(i < M.length){
    res = [...res, ...M.slice(i)]
  }
  
  if(j < N.length){
    res = [...res, ...N.slice(j)]
  }
  
  return res
}
```

**_Time complexity_**: O(M + N)\
\- where M is the number of nodes in root1\
\- and N is the number of nodes in root2\
**_Space complexity_**: O(M + N)
