---
title: "Flatten a Multilevel Doubly Linked List"
date: 2020-07-10T01:00:52+01:00
author: Kareem
tags:
  - "Linked List"
  - "Queue"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 10

## Problem Statement

You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.

Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.

**Example 1:**

Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
Output: [1,2,3,7,8,11,12,9,10,4,5,6]
Explanation:

The multilevel linked list in the input is as follows:

![](https://assets.leetcode.com/uploads/2018/10/12/multilevellinkedlist.png)

After flattening the multilevel linked list it becomes:

![](https://assets.leetcode.com/uploads/2018/10/12/multilevellinkedlistflattened.png)

**Example 2:**

Input: head = [1,2,null,3]
Output: [1,3,2]
Explanation:

The input multilevel linked list is as follows:
```
  1---2---NULL
  |
  3---NULL
```
**Example 3:**

Input: head = []
Output: []
 

How multilevel linked list is represented in test case:

We use the multilevel linked list from Example 1 above:
```
 1---2---3---4---5---6--NULL
         |
         7---8---9---10--NULL
             |
             11--12--NULL
```
The serialization of each level is as follows:
```
[1,2,3,4,5,6,null]
[7,8,9,10,null]
[11,12,null]
```
To serialize all levels together we will add nulls in each level to signify no node connects to the upper node of the previous level. The serialization becomes:
```
[1,2,3,4,5,6,null]
[null,null,7,8,9,10,null]
[null,11,12,null]
```
Merging the serialization of each level and removing trailing nulls we obtain:
```
[1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
```

Constraints:

Number of Nodes will not exceed 1000.
1 <= Node.val <= 10^5

## Inputs, Outputs, Constraints & Exceptions
- **I**: Node
- **O**: Node
- **C**: none, optimise
- **E**: head is null, only on node in list, every node (except parent) is a child

## Code

```js
/**
 * // Definition for a Node.
 * function Node(val,prev,next,child) {
 *    this.val = val;
 *    this.prev = prev;
 *    this.next = next;
 *    this.child = child;
 * };
 */
/**
 * @param {Node} head
 * @return {Node}
 */
const flatten = (head) => {
    if(!head){return null} //error
  
    const q = []
    q.push(head)
    let curr = null, prev = null;

    while(q.length){
      curr = q.pop()
      while(curr){
        if(curr.child){
          q.push(curr.next)
          curr.child.prev = curr
          curr.next = curr.child
          curr.child = null
        }
        
        prev = curr
        curr = curr.next
      }

      let lastNode = q[q.length - 1]
      if(lastNode){
        prev.next = lastNode
        lastNode.prev = prev
      }
    }
    return head
}
```

**_Time complexity_**: O(N) \
\- where N is the number of nodes in the list\
**_Space complexity_**: O(N)\
\- worst case where every parent node has a child and next node 