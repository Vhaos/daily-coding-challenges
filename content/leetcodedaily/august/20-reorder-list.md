---
title: "Reorder List"
date: 2020-08-20T01:00:52+01:00
author: Kareem
tags:
  - Linked List
  - Stack
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 20

## Problem Statement

Given a singly linked list `L: L0 → L1 → … → Ln-1 → Ln`,
reorder it to: `L0 → Ln → L1 → Ln-1 → L2 → Ln-2 → …`

You may not modify the values in the list's nodes, only nodes itself may be changed.

**Example 1:**

Given 1 -> 2 -> 3 -> 4, reorder it to 1 -> 4 -> 2 -> 3.

**Example 2:**

Given 1 -> 2 -> 3 -> 4 -> 5, reorder it to 1 -> 5 -> 2 -> 4 -> 3.


## Inputs, Outputs, Constraints & Exceptions
- **I**: LinkedListNode(val, next)
- **O**: none / modify list in place
- **C**: none/optimise
- **E**: - head is null
  - linked list length is 1 or 2

## Code (using a stack)
```js
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {void} Do not return anything, modify head in-place instead.
 */
function reorderList(head) {
  if(head?.next?.next == null){
    return;
  }

  const stack = []
  while(head){
    stack.push(head);
    head = head.next;
  }

  while(stack.length > 0){
    let curr = stack.shift()
    if(stack.length > 0){
      curr.next = stack.pop()
      curr = curr.next
      curr.next = stack.length > 0 ? stack[0] : null
    } else {
      curr.next = null
    }
  }
};
```

**_Time complexity_**: O(N) \
**_Space complexity_**: O(N)

## Code (reverse, then merge)
reversing the second half of the list, then merging with the first
```js
function reorderList(head){
  /* todo */
}
```
