//
//  TodoListRow.swift
//

import SwiftUI
import RealmSwift

struct TodoListRow: View {
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        HStack {
            Button {
                $todo.completed.wrappedValue.toggle()
            } label: {
                Image(systemName: todo.completed ? "checkmark.circle" : "circle")
            }
            .buttonStyle(.plain)
            TextField("Update Todo", text: $todo.name)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
                $todo.urgency.wrappedValue = todo.increment()
            } label: {
                Text(todo.urgency.text)
                    .padding(5)
                    .frame(width: 80)
                    .foregroundColor(Color(.systemBackground))
                    .background(RoundedRectangle(cornerRadius: 10).fill(todo.urgency.color))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

struct TodoListRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRow(todo: Todo(name: "sample") )
    }
}
