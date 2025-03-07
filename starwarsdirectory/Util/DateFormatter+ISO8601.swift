//
//  DateFormatter+ISO8601.swift
//  starwarsdirectory
//
//  Created by Vlad on 07/03/2025.
//
import Foundation

extension DateFormatter {
    
    static var iso8601: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        return formatter
    }
}
