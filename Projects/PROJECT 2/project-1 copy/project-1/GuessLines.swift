//
//  GuessLines.swift
//  project-1
//
//  Created by Kelly Brichta on 10/27/15.
//  Copyright (c) 2015 Kelly Brichta. All rights reserved.
//

import Foundation

class GuessLines : NSObject, NSCoding, NSCopying {
    var lines:[String]?
    let linesKey = "linesKey"
    
    override init() {
    }
    
    
    required init(coder decoder: NSCoder) {
        lines = decoder.decodeObjectForKey(linesKey) as? [String]
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let saveLines = lines {
            coder.encodeObject(saveLines, forKey: linesKey)
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = GuessLines()
        if var linesToCopy = lines {
            var newLines = Array<String>()
            for line in linesToCopy {
                newLines.append(line)
            }
            copy.lines = newLines
        }
        return copy
    }
}