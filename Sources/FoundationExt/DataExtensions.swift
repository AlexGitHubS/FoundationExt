//  Data Extensions.swift
//  Created by Alex on 2017-10-30.
//  Copyright © 2017 Alexei Kozachenko. All rights reserved.

import Foundation

public extension Data {
    
    public func scanValue<T>(start: Int, length: Int) -> T {
        return self.subdata(in: start..<start+length).withUnsafeBytes { $0.pointee }
    }
    
    /*
     https://appventure.me/2016/07/15/swift3-nsdata-data/
     let data = Data(bytes: [0x01, 0x02, 0x01, 0x02])
     let a: Int16 = data.scanValue(start: 0, length: 1)
     print(a)
     // : 1
     */
    
    //VALUE
    public init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
        
    }
    
    public func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }
    
    //ARRAY
    public init<T>(fromArray values: [T]) {
//        let values = values
        let numOfElements = values.count/MemoryLayout<T>.stride
        self.init(buffer: UnsafeBufferPointer(start: values, count: numOfElements))
    }
    
    public func toArray<T>(type: T.Type) -> [T] {
        return self.withUnsafeBytes {
            [T](UnsafeBufferPointer(start: $0, count: self.count/MemoryLayout<T>.stride))
        }
    }
}
