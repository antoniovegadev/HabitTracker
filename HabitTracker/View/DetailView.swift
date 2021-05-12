//
//  DetailView.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activities: Activities
    let index: Int
    
    init(activities: Activities, activity: Activity) {
        self.activities = activities

        if let match = activities.items.firstIndex(where: { $0.id == activity.id }) {
            index = match
        } else {
            fatalError("Couldn't find activity")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Description")) {
                Text(activities.items[index].description)
            }
            
            Section(header: Text("Progress")) {
                Stepper(
                    onIncrement: { activities.items[index].streak += 1 },
                    onDecrement: {},
                    label: {
                        Text("\(activities.items[index].streak) / \(activities.items[index].goal)")
                    })
            }
        }
        .navigationBarTitle(activities.items[index].name, displayMode: .inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(activities: <#Activities#>, activity: Activity(name: "Code", description: "Practice coding skills", goal: 60))
//    }
//}
