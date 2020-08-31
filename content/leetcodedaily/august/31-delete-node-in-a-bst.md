---
title: "Delete Node in a BST"
date: 2020-08-31T01:00:52+01:00
author: Kareem
tags:
  - Binary Tree
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 31

## Problem Statement

Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

Basically, the deletion can be divided into two stages:

1. Search for a node to remove.
2. If the node is found, delete the node.

**Follow up:** Can you solve it with time complexity O(height of tree)?

**Example 1:**
![](https://assets.leetcode.com/uploads/2020/09/04/del_node_1.jpg)
```
Input: root = [5,3,6,2,4,null,7], key = 3
Output: [5,4,6,2,null,null,7]
Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
```
**Example 2:**
{{<figure src="https://assets.leetcode.com/uploads/2020/09/04/del_node_supp.jpg" height="142" width="280">}}
```
Input: root = [5,3,6,2,4,null,7], key = 0
Output: [5,3,6,2,4,null,7]
Explanation: The tree does not contain a node with value = 0.
```
**Example 3:**
```
Input: root = [], key = 0
Output: []
 ```

**Constraints:**
1. The number of nodes in the tree is in the range [0, 104].
2. $-10^5$ <= Node.val <= $10^5$
3. Each node has a unique value.
4. root is a valid binary search tree.
5. $-10^5$ <= key <= $10^5$

## Inputs, Outputs, Constraints & Exceptions
- **I**: - TreeNode(val, left, right) {root}
  - number {key}
- **O**: TreeNode
- **C**: none other than the above
- **E**: - root is null
  - key is not in the tree
  - root.val === key


## Code

```js
/**
 * @param {TreeNode} node
 * @return {number}
 */
const successor = node => {
    node = node.right;
    while (node.left) {
        node = node.left;
    }
    return node.val;
}
/**
 * @param {TreeNode} node
 * @return {number}
 */
const predecessor = node => {
    node = node.left;
    while (node.right) {
        node = node.right;
    }
    return node.val;
}
/**
 * @param {TreeNode} root
 * @param {number} key
 * @return {TreeNode}
 */
var deleteNode = function(root, key) {
    if (!root) {
        return null;
    }
    if (root.val < key) {
        root.right = deleteNode(root.right, key);
    }
    else if (root.val > key) {
        root.left = deleteNode(root.left, key);
    }
    else {
        if (root.left) {
            root.val = predecessor(root);
            root.left = deleteNode(root.left, root.val);
        }
        else if (root.right) {
            root.val = successor(root);
            root.right = deleteNode(root.right, root.val);
        }
        else {
            root = null;
        }
    }
    return root;
};
```

**_Time complexity_**: O(H)\
\- where H is the height of the tree
**_Space complexity_**: O(H)