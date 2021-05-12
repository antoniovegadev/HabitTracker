//
//  AddView.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var name = ""
    @State private var description = ""
    @State private var goal = "30"

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description (Optional)", text: $description)
                TextField("Goal", text: $goal)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("New Activity")
            .navigationBarItems(trailing: Button("Save") {
                let activityItem = Activity(name: name, description: description, goal: Int(goal) ?? 30)
                
                activities.items.append(activityItem)
                
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
