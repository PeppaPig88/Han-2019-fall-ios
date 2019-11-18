//
//  ContentView.swift
//  CoredataTodoList
//
//  Created by Songming Han on 2019/11/18.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var mangedObjectContext
    @FetchRequest(fetchRequest:ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    @State private var newTodoItem = ""

    var body: some View {
            NavigationView{
                List{
                    Section(header:Text("What next")){
                        HStack{
                            TextField("New item", text: self.$newTodoItem)
                            Button(action:{
                                let toDoItem = ToDoItem(context: self.mangedObjectContext)
                                toDoItem.title = self.newTodoItem
                                toDoItem.createdAt = Date()
                                
                                do{
                                    try self.mangedObjectContext.save()
                                }catch{
                                    print(error)
                                }
                                self.newTodoItem = ""
                            }){
                                
                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                            }
                        }
                    }.font(.headline)
                    Section(header:Text("To Do's")){
                        ForEach(self.toDoItems){
                            todoItem in ToDoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                        }.onDelete{
                            IndexSet in
                            let deleteItem = self.toDoItems[IndexSet.first ?? 1]
                            self.mangedObjectContext.delete(deleteItem)
                            do {
                                try self.mangedObjectContext.save()
                            }catch{
                                print(error)
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("My List"))
                .navigationBarItems(trailing:EditButton())
            }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
