//
//  Logger+Extensions.swift
//  starwarsdirectory
//
//  Created by Vlad on 08/03/2025.
//
import Foundation
import os.log

extension Logger {
    static let coredata = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "CoreData")
    static let network = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Network")
}
