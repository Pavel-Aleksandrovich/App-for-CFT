//
//  Model.swift
//  App for CFT
//
//  Created by pavel mishanin on 27.09.2021.
//

import RealmSwift

class Model: Object {
    @objc dynamic var title = ""
    @objc dynamic var subTitle: String?
    @objc dynamic var newImage: Data?
}

let image = UIImage(named: )
