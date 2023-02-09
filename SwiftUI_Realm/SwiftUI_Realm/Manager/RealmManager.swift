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
            let config = Realm.Configuration(schemaVersion: 10)
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
                    let newListResult = ListSaveRealmModel(symbol: result.symbol, name: result.name, type: result.type, primary: result.primary)
                    
                    let newResultList = JsonTestListRealmModel()
                    
                    newResultList.jsonListModel.append(newResult)
                    newResultList.listSaveModel.append(newListResult)
                    
                    localRealm.add(newResultList, update: .modified)
                    getTasks()
                    print("realm 저장 완료")
                }
            } catch {
                print("Error save Realm: \(error)")
            }
        }
    }
    
//    func saveToRealmFromSample(_ result: JsonTestModel) {
//        if let localRealm = localRealm {
//            do {
//                try localRealm.write {
//                    let newListResult = ListSaveRealmModel(symbol: result.symbol, name: result.name, type: result.type, primary: result.primary)
//                    let newResultList = JsonTestListRealmModel()
//
//                    newResultList.listSaveModel.append(newListResult)
//
//                    localRealm.add(newResultList, update: .modified)
//                    getTasks()
//                    print("realm 저장 완료")
//                }
//            } catch {
//                print("Error save Realm: \(error)")
//            }
//        }
//    }
    
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
