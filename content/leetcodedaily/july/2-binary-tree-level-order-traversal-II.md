---
title: "Binary Tree Level Order Traversal II"
date: 2020-07-02T00:45:20+01:00
author: Kareem
tags:
  - "Binary Tree"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 2

## Problem Statement

Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

For example:
Given binary tree `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```
return its bottom-up level order traversal as:
```
[
  [15,7],
  [9,20],
  [3]
]
```

## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode<val, left, right>
- **O**: array<array<numbers>>
- **C**: none/optimise
- **E**: root has no children, root is null

## PseudoCode
```
levelOrderBottom(root):
  define level = new Map()
  define queue = []
  push root to queue
  set level[root] = 0
  while queue not empty:
    define curr as queue[0]
    if curr.left exists:
      enqueue left
      set level[curr.left] = level[curr]+1
    if curr.right exists:
      enqueue right
      set level[curr.right] = level[curr]+1
    dequeue curr
  
  define result = [][]
  for k,v in level:
    push k to result[v] 
```
## Code
```js
class TreeNode {
  constructor(val = 0, left = null, right = null){
    this.val = val
    this.left = left
    this.right = right
  }
}

/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
const levelOrderBottom = (root) => {
  //error checks
  if(root === null){
    return []
  }

  const level = new Map()
  const queue = []
  
  queue.push(root)
  level.set(root, 0)

  while(queue.length > 0){
    let currNode = queue[0]
    if(currNode.left){
      queue.push(currNode.left)
      level.set(currNode.left, level.get(currNode) + 1)
    }
    if(currNode.right){
      queue.push(currNode.right)
      level.set(currNode.right, level.get(currNode) + 1)
    }
    queue.shift()
  }

  const result = []
  for(let [node, level] of level){
    if(Array.isArray(result[level])){
      result[level].push(node.val)
    } else {
      result[level] = [node.val]
    }
  }

  return result.reverse()
};
```

**_Time comeplexity_**: O(n) \
**_Space complexity_**: O(n)

## PseudoCode 2
```
levelOrderBottom(root):
  define result = []
  define queue = []
  push root to queue
  while queue is not empty:
    define level = []
    for i = 0 to size of queue, i++:
      define node = queue.pop()
      if node.left:
        q.push node.left
      if node.right:
        q.push node.right
      level.push node.val
    result.unshift level
  return result
```
## Code 2
```js
const levelOrderBottom = (root) => {]
  //error check
  if(!root){
    return []
  }

  const result = []
  const queue = []
  queue.push(root)
  while (queue.length) {
    let level = []
    for(let i = 0; i < queue.length; i++) {
      let node = queue.shift()
      if (node.left){
        queue.push(node.left)
      }
      if (node.right){
        queue.push(node.right)
      }
      level.push(node.val)
    }
    result.unshift(level)
  }
  return result
}
```

**_Time comeplexity:_** O(n) \
**_Space complexity:_** O(n)
