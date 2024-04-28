//
//  NetworkService.swift
//  OlympIt
//
//  Created by Nariman on 28.04.2024.
//

import Foundation
import FirebaseFirestore

protocol NetworkService {
    func getExams(completion: @escaping (Result<ExamList, Error>) -> Void)
}

final class NetworkServiceImp {
    let db = Firestore.firestore()
}

extension NetworkServiceImp: NetworkService {
    func getExams(completion: @escaping (Result<ExamList, Error>) -> Void) {
        db.collection("Exams").getDocuments { querySnapshot, error in
            if let error { 
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
            if let querySnapshot {
                var response: ExamList = []
                
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? "Error"
                    let icon = data["iconUrl"] as? String ?? "Error"
                    
                    let iconUrl = URL(string: icon)
                    
                    let model: Exam = .init(name: name, icon: iconUrl!)
                    response.append(model)
                }
                
                completion(.success(response))
            }
        }
    }
}
