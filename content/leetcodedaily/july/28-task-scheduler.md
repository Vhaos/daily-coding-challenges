---
title: "Task Scheduler"
date: 2020-07-28T01:00:52+01:00
author: Kareem
tags:
  - "Array"
  - "Greedy"
  - "Queue"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 28

## Problem Statement

You are given a char array representing tasks CPU need to do. It contains capital letters A to Z where each letter represents a different task. Tasks could be done without the original order of the array. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.

You need to return the least number of units of times that the CPU will take to finish all the given tasks.


**Example 1:**
```
Input: tasks = ["A","A","A","B","B","B"], n = 2
Output: 8
```
Explanation:
``` 
A -> B -> idle -> A -> B -> idle -> A -> B
```
There is at least 2 units of time between any two same tasks.

**Example 2:**
```
Input: tasks = ["A","A","A","B","B","B"], n = 0
Output: 6
```
Explanation: On this case any permutation of size 6 would work since n = 0.
```
["A","A","A","B","B","B"]
["A","B","A","B","A","B"]
["B","B","B","A","A","A"]
...
```
And so on.

**Example 3:**
```
Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
Output: 16
```
Explanation: \
One possible solution is
``` 
A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A
```

**Constraints**:

The number of tasks is in the range [1, 10000].
The integer n is in the range [0, 100].

## Inputs, Outputs, Constraints & Exceptions
- **I**: - string[] {tasks}, tasks
  - number {n}, cooldown
- **O**: number, time cpu needs to take to finish all tasks
- **C**: - tasks in range [1, 10000]
  - n in range [0, 100]
- **E**: - n is 0
  - queue is only 1 task
  - all tasks are unique


## Code (buggy initial attempt)

```js
function leastInterval(tasks, n) {
  const freqMap = new Map()
  for(let i = 0; i < tasks.length; i++){
    let count = freqMap.get(tasks[i]);
    if(count) freqMap.set(tasks[i], count + 1);
    else freqMap.set(tasks[i], 1)
  }
  const freq = [...freqMap.entries()]

  const result = []
  for(let i = 0; i < freq.length; i++){

    while(freq[i][1] > 0){

      result.push(freq[i][0])
      freq[i][1]--
      let gap = n
      
      let j = i+1
      for(; j < freq.length && gap > 0; j++){
        if(freq[j][1] < 1){
          continue;
        }
        result.push(freq[j][0])
        freq[j][1]--
        gap--
      }

      while(gap > 0 && freq[i][1] > 0){
        result.push('idle')
        gap--
      }
    }
  }

  return result.length
};
```

## Code (corrected)

```js
function leastInterval(tasks, n) {
  let charMap = new Map()
  for(let t of tasks){
    charMap.set(t, (charMap.get(t) || 0 ) + 1)
  }

  charMap = [...charMap.values()].sort((a,b) => a - b)
  const mostFreq = charMap[charMap.length - 1] - 1
  let idleSlots = mostFreq * n

  for(let i = charMap.length - 2; i >= 0; i--){
    idleSlots -= Math.min(charMap[i], mostFreq)
  }

  return idleSlots > 0 ? idleSlots + tasks.length : tasks.length  
}
```