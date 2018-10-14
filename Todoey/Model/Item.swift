//
//  Item.swift
//  Todoey
//
//  Created by Frank Chen on 2018-10-12.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
