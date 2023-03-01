//
//  Task.swift
//  ToDoAppDemo
//
//  Created by Newwave on 01/03/2023.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
