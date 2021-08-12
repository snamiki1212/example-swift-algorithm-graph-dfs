class Solution {
     
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var visited = [Int](repeating: 0, count: isConnected.count)
        
        var count = 0;
        for i in 0..<isConnected.count {
            if visited[i] == 1 { continue }
            for j in i + 1..<isConnected[i].count {
                if i == j { continue }
                if isConnected[i][j] == 1 { visitCity(isConnected, i, &visited) }
            }
            count += 1;
        }
        return count
    }
    
    private func visitCity (_ isConnected: [[Int]], _ city: Int, _ visited: inout [Int]){
        // base case
        if visited[city] == 1 { return }
        
        // recursive case
        visited[city] = 1
        for (nextCity, connected) in isConnected[city].enumerated() {
            if connected == 1 {
                visitCity(isConnected, nextCity, &visited)
            }
        }
    }
}
