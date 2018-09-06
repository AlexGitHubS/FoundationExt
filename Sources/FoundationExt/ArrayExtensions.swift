//  ArrayExtensions.swift
//  Created by Alexei on 2017-10-29.
//  Copyright © 2017 Alexei Kozachenko. All rights reserved.

import Foundation

public extension Array where Element: Equatable  {
    public func stringify() -> [String]{
        return self.map( {return "\($0)"})
    }
}
