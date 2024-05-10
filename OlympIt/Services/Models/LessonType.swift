//
//  LessonType.swift
//  OlympIt
//
//  Created by Nariman on 08.05.2024.
//

import Foundation

enum LessonType: String {
    case theory
    case practice
    
    var collectionName: String {
        switch self {
        case .practice:
            return "Practices"
        case .theory:
            return "Theories"
        }
    }
}
