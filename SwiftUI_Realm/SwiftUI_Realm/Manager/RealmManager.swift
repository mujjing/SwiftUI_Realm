//
//  RealmManager.swift
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var resultList: [JsonTestListRealmModel] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func saveToRealm(_ result: JsonTestModel) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newResult = JsonTestRealmModel(symbol: result.symbol, name: result.name, type: result.type, primary: result.primary)
                    let newResultList = JsonTestListRealmModel()
                    newResultList.listModel.append(newResult)
                    localRealm.add(newResultList)
                    getTasks()
                    print("realm 저장 완료")
                }
            } catch {
                print("Error save Realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allLists = localRealm.objects(JsonTestListRealmModel.self)
            resultList = []
            allLists.forEach { data in
                resultList.append(data)
            }
        }
    }
    
}
