/// Main idea:
/// 1. Create 2 source queue:
///     - one for the nodes along pacific (top + left edge),
///     - the other for nodes along atlantic (bottem + right edge)
/// 2. Do BFS to 2 source queue to get the visited node list of pacific & atlantic separately
/// 3. The intersection of 2 visited node list is the result
///
/// ATTENTION:
/// Use visited map instead of visited node list can improve the performance,
/// because there will be 
/// 1) no need to do the intersection &
/// 2) to check if the nodes is already in the visited node list
/// I have implemented these 2 versions below

class Solution {
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        if m == 0 {
            return [[Int]]()
        }
        let n = matrix[0].count
        if n == 0 {
            return [[Int]]()
        }
        
        var pacificVisit = [[Bool]](repeatElement([Bool](repeatElement(false, count: n)), count: m))
        var atlanticVisit = [[Bool]](repeatElement([Bool](repeatElement(false, count: n)), count: m))
        
        // Add left & right edge location
        var leftEdge = [[Int]]()
        var rightEdge = [[Int]]()
        for y in 0 ..< n {
            leftEdge.append([0, y])
            pacificVisit[0][y] = true
            rightEdge.append([m - 1, y])
            atlanticVisit[m - 1][y] = true
        }
        
        // Add top & bottom edge location
        var topEdge = [[Int]]()
        var bottomEdge = [[Int]]()
        for x in 0 ..< m {
            topEdge.append([x, 0])
            pacificVisit[x][0] = true
            bottomEdge.append([x, n - 1])
            atlanticVisit[x][n - 1] = true
        }
        
        var pacific = topEdge + leftEdge
        pacific.remove(at: 0)
        print(pacific)
        var atlantic = bottomEdge + rightEdge
        atlantic.remove(at: atlantic.count - 1)
        
        
        BFS(&pacificVisit, pacific, m, n, matrix)
        BFS(&atlanticVisit, atlantic, m, n, matrix)
        
        var result = [[Int]]()
        for i in 0 ..< m {
            for j in 0 ..< n {
                if pacificVisit[i][j] && atlanticVisit[i][j] {
                    result.append([i, j])
                }
            }
        }
        return result
    }
    
    func BFS(_ visit: inout [[Bool]], _ source: [[Int]], _ m: Int, _ n: Int, _ matrix: [[Int]]) {
        var queue = source
        while !queue.isEmpty {
            let loc = queue.remove(at: 0)
            let moves = [[1, 0], [-1, 0], [0, 1], [0, -1]]
            for move in moves {
                let nx = loc[0] + move[0]
                let ny = loc[1] + move[1]
                if nx >= 0 && nx < m && ny >= 0 && ny < n && matrix[nx][ny] >= matrix[loc[0]][loc[1]] && !visit[nx][ny]  {
                    queue.append([nx, ny])
                    visit[nx][ny] = true
                }
            }
        }
    }
}

/// The following code is correct, but will get TLE in LeetCode
/*
class Solution {
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        if m == 0 {
            return [[Int]]()
        }
        let n = matrix[0].count
        if n == 0 {
            return [[Int]]()
        }
        
        // Add left & right edge location
        var leftEdge = [(Int, Int)]()
        var rightEdge = [(Int, Int)]()
        for y in 0 ..< n {
            leftEdge.append((0, y))
            rightEdge.append((m - 1, y))
        }
        
        // Add top & bottom edge location
        var topEdge = [(Int, Int)]()
        var bottomEdge = [(Int, Int)]()
        for x in 0 ..< m {
            topEdge.append((x, 0))
            bottomEdge.append((x, n - 1))
        }
        
        var pacific = topEdge + leftEdge
        pacific.remove(at: 0)
        var atlantic = bottomEdge + rightEdge
        atlantic.dropLast()
        
        BFS(&pacific, m, n, matrix)
        BFS(&atlantic, m, n, matrix)
        
        let result = intersect(pacific, atlantic)
        return result
    }
    
    func BFS(_ visit: inout [(Int, Int)], _ m: Int, _ n: Int, _ matrix: [[Int]]) {
        var queue = visit
        while !queue.isEmpty {
            let loc = queue.remove(at: 0)
            let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
            for move in moves {
                let nx = loc.0 + move.0
                let ny = loc.1 + move.1
                if nx >= 0 && nx < m && ny >= 0 && ny < n {
                    if matrix[nx][ny] >= matrix[loc.0][loc.1] && !visit.contains(where: { (x, y) in return (x, y) == (nx, ny) }) {
                        queue.append((nx, ny))
                        visit.append((nx, ny))
                    }
                }
            }
        }
    }
    
    func intersect(_ arrayA: [(Int, Int)], _ arrayB: [(Int, Int)]) -> [[Int]] {
        var result = [[Int]]()
        for itemA in arrayA {
            if arrayB.contains(where: { itemB in return itemA == itemB }) && !result.contains(where: { item in return item == [itemA.0, itemA.1] }) {
                result.append([itemA.0, itemA.1])
            }
        }
        return result
    }
}
*/
