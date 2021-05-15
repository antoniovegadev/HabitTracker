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
        GeometryReader { geo in
            VStack(spacing: geo.size.width * 0.1) {
                ForEach(0..<3) { _ in
                    HStack(spacing: geo.size.width * 0.1) {
                        ForEach(0..<2) { _ in
                            CircleView(width: geo.size.width * 0.35, height: geo.size.width * 0.35)
                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
            .offset(y: 20)
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
