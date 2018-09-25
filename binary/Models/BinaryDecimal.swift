//
//  BinaryDecimal.swift
//  binary
//
//  Created by Devodriq Roberts on 9/24/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import Foundation

class BinaryDecimal {
    
    private(set) var bits: [Int]?
    private(set) var integer: Int?
    
    init(_ bits: [Int]) {
        self.bits = bits
    }
    
    init(_ decimal: Int) {
        self.integer = decimal
    }
    
    
    // Calculate the Int version for an input binary
    func calculateBinaryValue() -> String {
        var binaryRows = [Int]()
        let rows = [128, 64, 32 ,16, 8 ,4, 2 ,1]
        guard let int = integer else {return "Error binary func"}
        var changingInt = int
        for row in rows {
            let bitValue = oneOrZero(forValue: changingInt, withBitValue: row)
            binaryRows.append(bitValue)
            if bitValue == 1  {
            changingInt -= row
            }
        }
        let stringFromIntArr = binaryRows.map { String($0) }
        return stringFromIntArr.joined()
    }
    
    
    // Calculate the binary version for an input Int
    func calculateIntValueForBinary() -> String {
        var value = 0
        var multiplier = 1
        guard let bits = bits else { return "Error decimal func"}
            for bit in bits.reversed() {
                let newValue = bit * multiplier
                value += newValue
                multiplier *= 2
        }
        return String(value)
    }
    
    // Binary fub=nc helper
    func oneOrZero(forValue value: Int, withBitValue bitValue: Int) -> Int {
        if value - bitValue >= 0 {
            return 1
        } else {
            return 0
        }
    }
}






