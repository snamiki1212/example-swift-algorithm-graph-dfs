//
//  main.swift
//  CyclicPermutationAndRepeatingSequence
//
//  Created by shunnamiki on 2021/08/11.
//

import Foundation

func main(){
    let numOfCases = Int(readLine()!)!
    
    for _ in 0...numOfCases {
        let len = Int(readLine()!)!
        
        let list = readLine()!.split(separator: " ").map { str in
            Int(str)!
        }
        var adjList = [Int](repeating: -1, count: len + 1)
        for (from, to) in list.enumerated() {
            adjList[from + 1] = to
        }
        printNumOfCycles(adjList)
    }
}

func getNumberOfCycles(adjList: [Int]) -> Int {
    var visited = [Bool](repeating: false, count: adjList.count + 1)
    var count = 0;
    for from in 1..<adjList.count {
        if visited[from] { continue }
        var cycle = [Bool](repeating: false, count: adjList.count + 1)
        if isCycle(adjList, &visited, &cycle, from) { count += 1 }
    }
    return count
}

func printNumOfCycles(_ adjList: [Int]){
    let count = getNumberOfCycles(adjList: adjList)
    print("adjList", adjList, count)
}

func isCycle(_ adjList: [Int], _ visited: inout [Bool], _ cycle: inout [Bool], _ from: Int) -> Bool {
    // base case
    if visited[from] && cycle[from] { return true }
    if visited[from] && !cycle[from] { return false }

    // recursive case
    visited[from] = true
    cycle[from] = true
    let to = adjList[from]
    return isCycle(adjList, &visited, &cycle, to)
}

main()
