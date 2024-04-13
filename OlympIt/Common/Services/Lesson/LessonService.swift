//
//  LessonEndpoints.swift
//  OlympIt
//
//  Created by Nariman on 07.04.2024.
//

import Moya

protocol ILessonService {
    func getLessonsList(
        with type: LessonType,
        completion: @escaping (Result<LessonsBaseList, NetworkError>) -> Void
    )
}

final class LessonService {
    private let provider: MoyaProvider<LessonEndpoints>
    
    init(
        provider: MoyaProvider<LessonEndpoints> = MoyaProvider<LessonEndpoints>(
            plugins: [NetworkLoggerPlugin()]
        )
    ) {
        self.provider = provider
    }
}

extension LessonService: ILessonService {
    func getLessonsList(
        with type: LessonType,
        completion: @escaping (Result<LessonsBaseList, NetworkError>) -> Void
    ) {
        provider.request(.baseLessonsList(type: type.rawValue)) { result in
            let response = RequestDecoder.shared.decodeResult(result, for: LessonsBaseList.self)
            completion(response)
        }
    }
}
