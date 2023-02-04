//
//  TodoListView.swift
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    // Realm 모델을 데이터를 관찰(?)하는 property wrapper
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
                        /// 모델에 데이터 추가
                        let newTodo = Todo(name: name)
                        /// 추가한 데이터를 Realm에 추가
                        ///  아마도 이부분이 Realm. write의 기능을 담당하는 듯
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
                        TodoListRow(todo: todo)
                    }
                    .onDelete(perform: $todos.remove)
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
