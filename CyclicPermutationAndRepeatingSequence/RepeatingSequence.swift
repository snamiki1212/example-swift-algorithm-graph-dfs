//
//  RepeatingSequence.swift
//  CyclicPermutationAndRepeatingSequence
//
//  Created by shunnamiki on 2021/08/11.
//

import Foundation

struct RepeatingSequence {
    static func main(){
        let inputs = readLine()!.split(separator: " ").map { Int($0)! }
        let num = inputs[0]
        let exponent = UInt(inputs[1])
        var histories = [Int:Int]();
        let position = 0
        let count = getNumberOfElementsInNonPartOfRepeating(&histories, num, exponent, position)
        print(count)
    }

    private static func pow (_ base:Int, _ power:UInt) -> Int {
      var answer : Int = 1
      for _ in 0..<power { answer *= base }
      return answer
    }

    private static func calcSumOfEachDigitPowed(_ num: Int, _ exponent: UInt) -> Int{
        var n = num
        var sum = 0;
        while(n != 0 ){
            let digit = Int(n % 10)
            sum += pow(digit, exponent)
            n = n / 10
        }
        return sum
    }

    private static func getNumberOfElementsInNonPartOfRepeating(_ histories: inout [Int:Int], _ num: Int, _ exponent: UInt, _ position: Int ) -> Int {
        // base case
        if let prevPosition = histories[num] { return prevPosition }
        
        // recursive case
        histories[num] = position;
        let newPosition = position + 1;
        let newNum = calcSumOfEachDigitPowed(num, exponent)
        return getNumberOfElementsInNonPartOfRepeating(&histories, newNum, exponent, newPosition)
    }
}
