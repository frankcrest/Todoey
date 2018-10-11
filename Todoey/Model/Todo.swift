//
//  Todo.swift
//  Todoey
//
//  Created by Frank Chen on 2018-10-11.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import Foundation

class Todo: Encodable, Decodable{
    //can also write Codable to conform to both classes
    var title : String = ""
    var done : Bool = false
}

