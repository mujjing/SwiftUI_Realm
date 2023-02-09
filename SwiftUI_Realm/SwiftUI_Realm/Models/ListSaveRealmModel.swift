//
//  ListSaveRealmModel.swift
//

import SwiftUI
import RealmSwift

class ListSaveRealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId // primary key defalut값은 false
    @Persisted var symbol: String
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var primary: Bool

    
    convenience init(symbol: String, name: String, type: String, primary: Bool) {
        self.init()
        
        self.symbol = symbol
        self.name = name
        self.type = type
        self.primary = primary
    }
}
