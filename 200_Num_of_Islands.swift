// When meet the land(1s), use DFS to visit all its adjacent land and mark with another number except 1
// Do the same job to every node in the 2-dimension array
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let x = grid.count
        
        // grid = []
        if x == 0 {
            return 0
        }
        
        let y = grid[0].count
        var mutableGrid = grid
        var count = 0
        
        // Make sure every node is visited
        for i in 0 ..< x {
            for j in 0 ..< y {
                if mutableGrid[i][j] == "1" {
                    visit(i, j, &mutableGrid)
                    count += 1
                }
            }
        }
        return count
    }
    
    func visit(_ x: Int, _ y: Int, _  grid: inout [[Character]]) {
        if x < 0 || x >= grid.count {
            return
        }
        if y < 0 || y >= grid[0].count {
            return
        }
        if grid[x][y] != "1" {
            return
        }
        if grid[x][y] == "1" {
            grid[x][y] = "2"
            visit(x + 1, y, &grid)
            visit(x - 1, y, &grid)
            visit(x, y + 1, &grid)
            visit(x, y - 1, &grid)
        }
    }
}
