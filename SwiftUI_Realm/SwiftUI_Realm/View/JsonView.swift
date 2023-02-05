//
//  JsonView.swift
//

import Foundation
import SwiftUI
import RealmSwift

struct JsonView: View {
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            readFromJsonFile()
        }
    }
}

extension JsonView {
    func readFromJsonFile() {
        guard let path = Bundle.main.url(forResource: "RealmTestJson", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: path)
            let result = try JSONDecoder().decode([JsonTestModel].self, from: data)
            
            print("결과 : \(result)")
            for data in result {
                realmManager.saveToRealm(data)
            }
        } catch {
            print("에러 :\(error)")
        }
    }
}

struct JsonView_Previews: PreviewProvider {
    static var previews: some View {
        JsonView()
    }
}
