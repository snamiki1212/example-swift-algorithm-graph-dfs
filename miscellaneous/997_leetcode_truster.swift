//
//  Solution.swift
//  CyclicPermutationAndRepeatingSequence
//
//  Created by shunnamiki on 2021/08/11.
//

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var truster = [[Int]](repeating: [Int](), count: n + 1)
        var trustee = [[Int]](repeating: [Int](), count: n + 1)
        var _trust = trust
        
        mutCreateTrusterAndTrustee(&truster, &trustee, &_trust)
        
        var result = -1
        for i in 1...n {
            
            let meetsCondition = truster[i].isEmpty && trustee[i].count == n - 1
            if !meetsCondition { continue }
            let alreadyExists = result != -1
            if alreadyExists { return -1 }
            result = i
        }
        print("Results:", result)
        
        return result
    }
    
    func mutCreateTrusterAndTrustee(_ truster: inout [[Int]], _ trustee: inout [[Int]], _ trust: inout [[Int]]) {
        if trust.isEmpty { return }
        let set = trust.popLast()!
        let from = set[0]
        let to = set[1]
        
        truster[from].append(to)
        trustee[to].append(from)
        mutCreateTrusterAndTrustee(&truster, &trustee, &trust)
    }
}
