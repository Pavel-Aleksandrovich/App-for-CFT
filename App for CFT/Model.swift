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
    @objc dynamic var oneImage: Data?
     
    convenience init(title: String, subTitle: String?, oneImage: Data?){
        self.init()
        self.title = title
        self.subTitle = subTitle
        self.oneImage = oneImage
    }
}


