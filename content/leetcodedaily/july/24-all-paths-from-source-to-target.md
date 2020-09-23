---
title: "All Paths From Source to Target"
date: 2020-07-24T01:00:52+01:00
author: Kareem
tags:
  - "Graph"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 24

## Problem Statement

Given a directed, acyclic graph of N nodes.  Find all possible paths from node 0 to node N-1, and return them in any order.

The graph is given as follows:  the nodes are `0, 1, ..., graph.length - 1`.  graph[i] is a list of all nodes j for which the edge (i, j) exists.
 
**Example**:
```
Input: [[1,2], [3], [3], []] 
Output: [[0,1,3],[0,2,3]] 
```
Explanation: The graph looks like this:
```
0--->1
|    |
v    v
2--->3
```
There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

**Note**:\
The number of nodes in the graph will be in the range [2, 15].\
You can print different paths in any order, but you should keep the order of nodes inside one path.


## Inputs, Outputs, Constraints & Exceptions

- **I**: number[][] {graph}
- **O**: number[][] {result}
- **C**: none/optimise
- **E**: - the graph only has one node (exception)
  - the graph has 2 nodes


## Code

```js
function allPathsSourceTarget(graph){
  const result = []
  findPaths([0], 0, graph, result)
  return result
}

function findPaths(path, node, graph, result){
  if(node === graph.length){
    result.push([...path])
    return
  }


  for(let i = 0; i < graph[node].length; i++){
    path.push(graph[node][i])
    findPaths(path, graph[node][i], graph, result)
    path.pop()
  }
}
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(N)