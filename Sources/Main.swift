import Foundation

func createMatrix(with number: Int) -> [[Int]] {
    let matrixSize = 4
    return Array(repeating: Array(repeating: number, count: matrixSize), count: matrixSize)
}

func printMatrix(_ matrix: [[Int]]) {
    for row in matrix {
        print(row.map { String($0) }.joined(separator: " "))
    }
}

print("Enter a number: ", terminator: "")
if let input = readLine(), let number = Int(input) {
    let matrix = createMatrix(with: number)
    print("4x4 Matrix:")
    printMatrix(matrix)
} else {
    print("Invalid input. Please enter an integer.")
}