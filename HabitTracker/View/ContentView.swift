//
//  ContentView.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Activity.entity(),
        sortDescriptors: [NSSortDescriptor(key: "created", ascending: true)]
    ) var activities: FetchedResults<Activity>
    
    @State private var showAddForm = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(activities, id: \.self) { activity in
                    CircleView(width: geo.size.width * 0.325, title: activity.name ?? "Unknown")
                }
                AddButton(tapped: $showAddForm, width: geo.size.width * 0.325)
            }
            .padding(.horizontal, 20)
            .offset(y: 40)
        }
        .sheet(isPresented: $showAddForm) {
            AddForm()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistanceController.preview.container.viewContext)
    }
}
