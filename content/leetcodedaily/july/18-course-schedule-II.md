---
title: "Course Schedule II"
date: 2020-07-18T01:00:52+01:00
author: Kareem
tags:
  - "Depth-first search"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 18

## Problem Statement

There are a total of n courses you have to take, labeled from 0 to n-1.

Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.

**Example 1:**
```
Input: 2, [[1,0]] 
Output: [0,1]
```
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished   
             course 0. So the correct course order is [0,1] .

**Example 2:**
```
Input: 4, [[1,0],[2,0],[3,1],[3,2]]
Output: [0,1,2,3] or [0,2,1,3]
```
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.  So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .

**Note:**

The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
You may assume that there are no duplicate edges in the input prerequisites.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number {numCourses}, number[][] {prerequisites}
- **O**: number[]
- **C**: none/optimise
- **E**: -  theres a cycle in the graph
  - theres only one node in graph

## Approach
```
// let stack: number[]
// let visited: boolean[]

// create an adjList: Map number->number[], maps vertices to edges it leads to
// iterate through nodes 0 to n and at time check if its been visited
// initiate a dfs if not visited

// in dfs iterate through the list of nodes out current nodes goes to
// onces theres are no more nodes to iterate through...
// ...push curr node to stack and set as visited
// otherwise we continue with dfs
```

## Code

```js
/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {number[]}
 */
function findOrder(numCourses, prerequisites) {
 let stack = []
 let visited = new Set()
 let visiting = new Set() 

 // create adjacency list
 let adjList = new Map()
 for(let [v, u] of prerequisites){
   let list = adjList.get(u)
   if(list){
     adjList.set(u, [...list, v])
   } else {
     adjList.set(u, [v])
   }
   console.log(adjList.get(u))
 }

 // 
 for(let i = 0; i < numCourses; i++){
   if(!visited.has(i)){
     if(dfs(i, adjList, stack, visited, visiting)){
       return []
     }
   }
 }

 return [...stack].reverse()
};

function dfs(node, adjList, stack, visited, visiting){
  let connectedNodes = adjList.get(node) || [];
  visiting.add(node)
  
  for(let connection of connectedNodes){
    if(visited.has(connection)){
      continue;
    }

    if(visiting.has(connection)){
      return true
    }
    
    if(dfs(connection, adjList, stack, visited, visiting)){
      return true
    }
  }
 
  visiting.delete(node);
  visited.add(node);
  stack.push(node);
  return false
}
```

**_Time complexity_**: O(n + e)\
**_Space complexity_**: O(n + e)