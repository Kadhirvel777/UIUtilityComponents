//
//  TimeMeridian.swift
//  UIUtilityComponents
//
//  Created by Kadhirvel on 09/08/22.
//  Copyright © 2017 Ner. All rights reserved.
//

public enum TimeMeridian {

    case am
    case pm
}

extension TimeMeridian: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .am: return "AM"
        case .pm: return "PM"
        }
    }
}
