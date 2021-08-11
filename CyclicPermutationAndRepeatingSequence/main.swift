//
//  main.swift
//  CyclicPermutationAndRepeatingSequence
//
//  Created by shunnamiki on 2021/08/11.
//

import Foundation

func main(){
    let numOfCases = Int(readLine()!)!
    print("\n", "numOfCases", numOfCases)
    for _ in 0...numOfCases {
        let len = Int(readLine()!)!
        print("len", len);
        let list = readLine()!.split(separator: " ").map { str in
            Int(str)!
        }
        var adjList = [[Int]](repeating: [], count: len + 1)
        for (from, to) in list.enumerated() {
            adjList[from + 1].append(to)
        }
        printNumOfCycles(adjList: adjList)
    }
}

func printNumOfCycles(adjList: [[Int]]){
    // count up how many cycles
    
    print("adjList", adjList)
}

main()
