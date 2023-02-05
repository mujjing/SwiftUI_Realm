//
//  JsonTestListRealmModel.swift
//

import SwiftUI
import RealmSwift

class JsonTestListRealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId // primary key defalut값은 false
    @Persisted var listModel = RealmSwift.List<JsonTestRealmModel>()
    
    convenience init(listModel: [JsonTestRealmModel]) {
        self.init()
        self.listModel.append(objectsIn: listModel)
    }
}
