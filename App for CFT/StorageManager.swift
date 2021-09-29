//
//  StorageManager.swift
//  App for CFT
//
//  Created by pavel mishanin on 28.09.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveNotes(_ model: Model){
        try! realm.write {
            realm.add(model)
        }
    }
    static func deleteObject(_ model: Model) {
        try! realm.write {
            realm.delete(model)
        }
    }
}
