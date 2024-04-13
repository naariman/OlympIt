//
//  LessonsList.swift
//  OlympIt
//
//  Created by Nariman on 13.04.2024.
//

import Foundation

enum LessonType: String,
                 CaseIterable,
                 Decodable {
    case olymp
    case exam
    
    var title: String {
        switch self {
        case .exam:
            return "ЕГЭ"
        case .olymp:
            return "Олимпиада"
        }
    }
}

typealias LessonsBaseList = [LessonBaseInfoModel]

struct LessonBaseInfoModel: Decodable {
    let id: String
    let name: String
    let iconUrl: URL
    let type: LessonType.RawValue
}
