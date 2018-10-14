//
//  Category.swift
//  Todoey
//
//  Created by Frank Chen on 2018-10-12.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}


