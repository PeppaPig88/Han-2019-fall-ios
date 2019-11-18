//
//  ToDoItem.swift
//  CoredataTodoList
//
//  Created by Songming Han on 2019/11/18.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import Foundation
import CoreData
public class  ToDoItem:NSManagedObject,Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}
extension ToDoItem{
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem>{
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()as!
        NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key:"createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
