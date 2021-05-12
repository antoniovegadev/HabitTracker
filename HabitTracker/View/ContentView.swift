//
//  ContentView.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink(destination: DetailView(activities: activities, activity: activity)) {
                        HStack {
                            Text(activity.name)

                            Spacer()
                            
                            Text("\(activity.streak) / \(activity.goal)")
                        }
                    }
                }
            }
            .navigationTitle("HabitTracker")
            .navigationBarItems(trailing: Button(action: {
                showingAddView = true
            }, label: {
                Image(systemName: "plus")
            }))
        }
        .sheet(isPresented: $showingAddView, content: {
            AddView(activities: activities)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
