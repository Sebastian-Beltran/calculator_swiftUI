//
//  Home.swift
//  Calculator
//
//  Created by Sebastian Beltran Gonzalez on 3/03/25.
//

import SwiftUI


struct Home: View {
    @State var displayValue = "0"
    
    @State var computeValue = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("\(displayValue)").bold()
                        .font(.system(size: 100)).foregroundColor(.white)
                }
                .padding()
                ForEach(buttons, id: \.self){
                    row in HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            let buttonAction = { self.handle(button: item) }
                            Button(action: buttonAction) {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .clipShape(.rect(cornerRadius: self.buttonWidth(item: item) / 2))
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    func buttonWidth(item: CalculatorButtons) -> CGFloat {
        if item == .zero{
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return ((UIScreen.main.bounds.width - (5 * 12)) / 4)
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func handle(button: CalculatorButtons) {
        switch button {
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOperation = .add
                self.computeValue = Int(self.displayValue) ?? 0
                
            }else if button == .substract{
                self.currentOperation = .substract
                self.computeValue = Int(self.displayValue) ?? 0
            }else if button == .multiply{
                self.currentOperation = .multiply
                self.computeValue = Int(self.displayValue) ?? 0
            }else if button == .divide{
                self.currentOperation = .substract
                self.computeValue = Int(self.displayValue) ?? 0
            }else if button == .equal{
                let runningValue = self.computeValue
                let currentValue = Int(self.displayValue) ?? 0
                switch self.currentOperation {
                case .add:
                    self.displayValue = "\(runningValue + currentValue)"
                case .substract:
                    self.displayValue = "\(runningValue - currentValue)"
                case .multiply:
                    self.displayValue = "\(runningValue * currentValue)"
                case .divide:
                    self.displayValue = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.displayValue = "0"
            }
        case .clear:
            self.displayValue = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.displayValue == "0" {
                displayValue = number
            } else {
                self.displayValue = "\(self.displayValue)\(number)"
            }
        }
    }
}


#Preview {
    Home()
}
