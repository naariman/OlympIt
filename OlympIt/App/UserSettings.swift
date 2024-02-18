//
//  UserSettings.swift
//  OlympIt
//
//  Created by Nariman on 18.02.2024.
//

import Foundation


final class UserSettings {

    @UserDefault("user_status")
    var userStatus: UserStatus = .displayOnboarding
    
    func clearData() {
        userStatus = .displayOnboarding
    }
}

enum UserStatus: String {
    case displayOnboarding
    case displayApp
}
