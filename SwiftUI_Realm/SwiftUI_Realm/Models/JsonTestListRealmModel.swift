//
//  JsonTestListRealmModel.swift
//

import SwiftUI
import RealmSwift

class JsonTestListRealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId // primary key defalut값은 false
    @Persisted var jsonListModel = RealmSwift.List<JsonTestRealmModel>()
    @Persisted var listSaveModel = RealmSwift.List<ListSaveRealmModel>()
    
    convenience init(listModel: [JsonTestRealmModel], listSaveModel: [ListSaveRealmModel]) {
        self.init()
        
        self.jsonListModel.append(objectsIn: listModel)
        self.listSaveModel.append(objectsIn: listSaveModel)
    }
}
