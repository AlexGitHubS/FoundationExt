//  AOperation.swift
//  Created by Alex on 01.06.16.
//  Copyright © 2016 Alex Kozachenko. All rights reserved.

import Foundation

//Non-async operation
public class AOperation: Operation {
    
    @objc enum State: Int {
        // The `Operation` is ready to begin execution.
        case ready
        
        // The `Operation` is executing.
        case executing
        
        // The `Operation` has finished executing.
        case finished
        
        // The `Operation` has been cancelled.
        case cancelled
    }

    @objc dynamic var state = State.ready
    
    override public var isExecuting: Bool {
        return state == .executing
    }
    override public var isFinished: Bool {
        return state == .finished
    }
    override public var isCancelled: Bool {
        return state == .cancelled
    }
    
    // use the KVO mechanism to indicate that changes to "state" affect the other key value observable properties of `NSOperation` as well
    class func keyPathsForValuesAffectingIsReady() -> Set<String> {
        return ["state"]
    }
    
    class func keyPathsForValuesAffectingIsExecuting() -> Set<String> {
        return ["state"]
    }
    
    class func keyPathsForValuesAffectingIsFinished() -> Set<String> {
        return ["state"]
    }
    
    class func keyPathsForValuesAffectingIsCancelled() -> Set<String> {
        return ["state"]
    }
    
    public func execute() {
        state = .executing
    }
    public func finish() {
        state = .finished
    }
    
}
