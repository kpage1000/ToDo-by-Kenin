//
//  Category.swift
//  ToDo by Kenin
//
//  Created by Kenin Page on 2/8/18.
//  Copyright © 2018 Kenin Page. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
