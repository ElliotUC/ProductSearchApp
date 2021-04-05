//
//  Converter.swift
//  ProductSearchApp
//
//  Created by Elliot on 03-04-21.
//

import Foundation

class Converter {
    static func convertToDecimal(_ number: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter.string(from: number)!
    }
    
    static func convertToDecimal(_ number: Int) -> String {
        return convertToDecimal(NSNumber(value: number))
    }
    
    static func convertToDecimal(_ number: Double) -> String {
        return convertToDecimal(NSNumber(value: number))
    }
}
