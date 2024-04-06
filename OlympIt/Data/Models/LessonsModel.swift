//
//  LessonModel.swift
//  OlympIt
//
//  Created by Nariman on 04.04.2024.
//

import Foundation

typealias Lessons = [LessonModel]

struct LessonModel {
    let id: String
    let image: URL
    let name: String
    
    static var examsMock: [Self] = [
        .init(id: "1", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeCfy5Uau3iIpmH0wd7Gzw8y5Oz0MeRTz7TfyObBLfA&s")!, name: "Math"),
        .init(id: "1", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeCfy5Uau3iIpmH0wd7Gzw8y5Oz0MeRTz7TfyObBLfA&s")!, name: "Physics"),
        .init(id: "1", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeCfy5Uau3iIpmH0wd7Gzw8y5Oz0MeRTz7TfyObBLfA&s")!, name: "Some"),
        .init(id: "1", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeCfy5Uau3iIpmH0wd7Gzw8y5Oz0MeRTz7TfyObBLfA&s")!, name: "Some"),
    ]
    
    static var olympMock: [Self] = [
        .init(id: "1", image: URL(string: "https://w7.pngwing.com/pngs/515/758/png-transparent-octopus-swimming-lessons-jonathan-carlisle-swimming-cartoon-sports-lesson-thumbnail.png")!, name: "Math"),
        .init(id: "1", image: URL(string: "https://w7.pngwing.com/pngs/515/758/png-transparent-octopus-swimming-lessons-jonathan-carlisle-swimming-cartoon-sports-lesson-thumbnail.png")!, name: "Physics"),
        .init(id: "1", image: URL(string: "https://w7.pngwing.com/pngs/515/758/png-transparent-octopus-swimming-lessons-jonathan-carlisle-swimming-cartoon-sports-lesson-thumbnail.png")!, name: "Some"),
        .init(id: "1", image: URL(string: "https://w7.pngwing.com/pngs/515/758/png-transparent-octopus-swimming-lessons-jonathan-carlisle-swimming-cartoon-sports-lesson-thumbnail.png")!, name: "Some"),
    ]
}
