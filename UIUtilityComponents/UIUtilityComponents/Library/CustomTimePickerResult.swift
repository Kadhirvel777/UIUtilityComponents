//
//  SambagTimePickerResult.swift
//  UIUtilityComponents
//
//  Created by Kadhirvel on 09/08/22.
//  Copyright © 2017 Ner. All rights reserved.
//

public struct CustomTimePickerResult {
    
    public var hour: Int
    public var minute: Int
    public var is24: Bool
    public var meridian: TimeMeridian
    
    public init() {
        self.hour = 0
        self.minute = 0
        self.is24 = false
        self.meridian  = .am
    }
}

extension CustomTimePickerResult: CustomStringConvertible {
    
    public var description: String {
        return "\(hour):\(minute)" + (is24 ? "" : " \(meridian)")
    }
}
