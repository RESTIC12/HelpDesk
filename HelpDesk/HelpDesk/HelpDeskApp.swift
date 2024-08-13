//
//  HelpDeskApp.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI
import FirebaseAuth

@main
struct HelpDeskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser == nil {
                LoginView()
            } else {
                HomeView()
            }
        }
    }
}

