---
title: "Vertical Order Traversal of a Binary Tree"
date: 2020-08-07T01:00:52+01:00
author: Kareem
tags:
  - "Binary Tree"
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 7

## Problem Statement

Given a binary tree, return the vertical order traversal of its nodes values.

For each node at position (X, Y), its left and right children respectively will be at positions (X-1, Y-1) and (X+1, Y-1).

Running a vertical line from X = -infinity to X = +infinity, whenever the vertical line touches some nodes, we report the values of the nodes in order from top to bottom (decreasing Y coordinates).

If two nodes have the same position, then the value of the node that is reported first is the value that is smaller.

Return an list of non-empty reports in order of X coordinate. Every report will have a list of values of nodes.

**Example 1:**
{{<figure src="https://assets.leetcode.com/uploads/2019/01/31/1236_example_1.PNG" width="200" height="200" attr="Image taken from LeetCode" attrlink="https://leetcode.com">}}
```
Input: [3,9,20,null,null,15,7]
Output: [[9],[3,15],[20],[7]]
```
Explanation: \
Without loss of generality, we can assume the root node is at position (0, 0):\
Then, the node with value 9 occurs at position (-1, -1);\
The nodes with values 3 and 15 occur at positions (0, 0) and (0, -2);\
The node with value 20 occurs at position (1, -1);\
The node with value 7 occurs at position (2, -2).

**Example 2:**
{{<figure src="https://assets.leetcode.com/uploads/2019/01/31/tree2.png" width="300" height="200" attr="Image take from LeetCode" attrlink="https://leetcode.com">}}
```
Input: [1,2,3,4,5,6,7]
Output: [[4],[2],[1,5,6],[3],[7]]
```
Explanation: \
The node with value 5 and the node with value 6 have the same position according to the given scheme.\
However, in the report "[1,5,6]", the node value of 5 comes first since 5 is smaller than 6.

**Note:**

The tree will have between 1 and 1000 nodes.\
Each node's value will be between 0 and 1000.

## Inputs, Outputs, Constraints & Exceptions
- **I**: TreeNode(val,left,right) {root}
- **O**: number[]
- **C**: none/optimise
- **E**: - root is null
  - root is only node
  - all nodes are only along one branch

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
function verticalTraversal(root) {
  if(root === null) {
    return []
  }

  const cache = new Map(); // col -> [row, val] 
  let maxC = 0, minC = 0;

  const dfs = (node, row, col) => {
    minC = Math.min(col, minC)
    maxC = Math.max(col, maxC)

    let colNodes = cache.get(col)
    if(colNodes){
      cache.set(col, [...colNodes, [row, node.val]])
    } else {
      cache.set(col, [[row, node.val]])
    }

    if(node.left){
      dfs(node.left, row + 1, col - 1)
    }

    if(node.right){
      dfs(node.right, row + 1, col + 1)
    }
  }

  dfs(root, 0, 0)

  const result = []
  for(let i = minC; i < maxC + 1; i++){
    let colNodes = cache.get(i)
      .sort((a,b) => {
        if(a[0] === b[0]) return a[1] - b[1];
        else return a[0] - b[0]
      })
      .map( curr => {
        return curr[1]
      })
    result.push(colNodes)
  }
  
  return result;
};
```

**_Time complexity_**: O(n log n)\
**_Space complexity_**: O(n)