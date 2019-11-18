//
//  ToDoItemView.swift
//  CoredataTodoList
//
//  Created by Songming Han on 2019/11/18.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
}
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "To DO", createdAt: "today")
    }
}
