//
//  SwiftUI_RealmApp.swift
//  SwiftUI_Realm
//
//  Created by 전지훈 on 2023/02/04.
//

import SwiftUI

@main
struct SwiftUI_RealmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                }
        }
    }
}
