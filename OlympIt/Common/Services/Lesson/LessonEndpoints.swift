//
//  LessonEndpoints.swift
//  OlympIt
//
//  Created by Nariman on 07.04.2024.
//

import Foundation
import Moya

enum LessonEndpoints {
    case baseLessonsList(type: String)
}

extension LessonEndpoints: TargetType {
    var baseURL: URL {
        return URL(string: "\(URLBase.prodUrl)lessons/")!
    }
    
    var path: String {
        switch self {
        case .baseLessonsList(let type):
            return "\(type)/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .baseLessonsList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .baseLessonsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
