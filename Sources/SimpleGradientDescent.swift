import Foundation

// MARK: - Cost 

// J(w, b) = (1/(2m)) * Σ((w * x[i] + b - y[i])^2)
func quadraticCostFunction(_ w: Double, _ b: Double, _ x: [Double], _ y: [Double]) -> Double {
    let m = Double(x.count)
    var totalCost = 0.0
    for i in 0..<x.count {
        let hypothesis = w * x[i] + b
        let error = hypothesis - y[i]
        totalCost += error * error
    }
    return totalCost / (2 * m)
}

// MARK: - Gradient  w

// ∂J(w, b)/∂w = (1/m) * Σ((w * x[i] + b - y[i]) * x[i])
func calculateGradientW(_ w: Double, _ b: Double, _ x: [Double], _ y: [Double]) -> Double {
    let m = Double(x.count)
    var gradientW = 0.0
    for i in 0..<x.count {
        let hypothesis = w * x[i] + b
        let error = hypothesis - y[i]
        gradientW += error * x[i]
    }
    return gradientW / m
}

// MARK: - Gradient b

// ∂J(w, b)/∂b = (1/m) * Σ(w * x[i] + b - y[i])
func calculateGradientB(_ w: Double, _ b: Double, _ x: [Double], _ y: [Double]) -> Double {
    let m = Double(x.count)
    var gradientB = 0.0
    for i in 0..<x.count {
        let hypothesis = w * x[i] + b
        let error = hypothesis - y[i]
        gradientB += error
    }
    return gradientB / m
}

// MARK: - Descent loop

// 1. w = w - α * ∂J(w, b)/∂w
// 2. b = b - α * ∂J(w, b)/∂b
func gradientDescent(_ x: [Double], _ y: [Double], alpha: Double, iterations: Int) {
    var w = 0.0
    var b = 0.0
    for i in 0..<iterations {
        let gradientW = calculateGradientW(w, b, x, y)
        let gradientB = calculateGradientB(w, b, x, y)
        let tmpW = w - alpha * gradientW
        let tmpB = b - alpha * gradientB
        w = tmpW
        b = tmpB        
        if i % 1000 == 0 {
            print("* Iteration \(i): w = \(w), b = \(b), cost = \(quadraticCostFunction(w, b, x, y))")
        }
    }
    print("### Final values after \(iterations) iterations:")
    print("### w: \(w)")
    print("### b: \(b)")
    print("### Cost: \(quadraticCostFunction(w, b, x, y))")
}

func readDoubleArray() -> [Double] {
    guard let input = readLine() else { return [] }
    return input.split(separator: " ").compactMap { Double($0) }
}

// MARK: - Main

func readInputForSimpleGradientDescentAndLaunch() {
    print("> Enter values for x separated by spaces:")
    let x = readDoubleArray()
    print("> Enter values for y separated by spaces:")
    let y = readDoubleArray()
    print("> Enter learning rate (alpha):")
    let alpha = Double(readLine()!)!
    print("> Enter number of iterations:")
    let iterations = Int(readLine()!)!
    gradientDescent(x, y, alpha: alpha, iterations: iterations)
}
