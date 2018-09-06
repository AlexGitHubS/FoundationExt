//  AsyncOperation.swift
//  Created by Alexei on 2017-09-03.
//  Copyright © 2017 Alexei Kozachenko. All rights reserved.

import Foundation

public class AsynchronousOperation : Operation {
    enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        fileprivate var keyPath: String { return "is" + self.rawValue }
    }

    override public var isAsynchronous: Bool { return true }
    override public var isExecuting: Bool { return state == .executing }
    override public var isFinished: Bool { return state == .finished }
    
    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    public func finish() {
        state = .finished
    }
    public func execute() {
        state = .executing
    }
    
}
