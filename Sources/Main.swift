import Foundation

// MARK: - Launch options

enum MainUseCases: Int, CaseIterable {
    case selectDataSet
    case showcaseGradientDescent
    
    var description: String {
        switch self {
        case .selectDataSet:
            return "Select Data Set"
        case .showcaseGradientDescent:
            return "Showcase Gradient Descent"
        }
    }
    
    func launchPath() {
        switch self {
        case .selectDataSet:
            print("### Exit, [\(self.description)] not implemented")
        case .showcaseGradientDescent:
            readInputForSimpleGradientDescentAndLaunch()
        }
    }
}

// MARK: - Main

@main
fileprivate struct Main {
    static func main() {
        displayAndSelectUseCase()
    }
    
    static func displayAndSelectUseCase() {
        print("> Select option:")
        for useCase in MainUseCases.allCases {
            print("- \(useCase.rawValue). \(useCase.description)")
        }
        if let input = readLine(), let selection = Int(input), let useCase = MainUseCases(rawValue: selection) {
            useCase.launchPath()
        } else {
            displayAndSelectUseCase() 
        }
    }
}
