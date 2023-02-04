//
//  TodoListView.swift
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    @ObservedResults(Todo.self) var todos
    @State var name = ""
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Todo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button {
                        let newTodo = Todo(name: name)
                        $todos.append(newTodo)
                        name = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(name.isEmpty)
                }
                .padding()
                List() {
                    ForEach(todos) { todo in
                        Text(todo.name)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Realm Todo")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
