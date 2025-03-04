//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Sebastian Beltran Gonzalez on 3/03/25.
//

import SwiftUI

enum CalculatorButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case substract = "-"
    case divide = "/"
    case multiply = "X"
    case add = "+"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "±"

    var buttonColor: Color {
        switch self {
        case .add, .substract, .divide, .multiply, .equal:
            return .orange

        case .clear, .negative, .percent:
            return Color(.lightGray)

        default:
            return Color(UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1))
        }
    }


}


enum Operation{
    case add, substract, divide, multiply, none
}
