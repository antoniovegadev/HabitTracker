//
//  CircleView.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/12/21.
//

import SwiftUI

struct CircleView: View {
    @GestureState var isDetectingLongPress = false
    @State private var done = false
    @State private var streak = 2
    let title = "Go to bed".uppercased()
    
    let width: CGFloat
    let height: CGFloat

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 1.0)
            }
            .onEnded { finished in
                done = true
                streak += 1
            }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.45), style: StrokeStyle(lineWidth: width * 0.075, lineCap: .round))
                
                Circle()
                    .trim(from: 0, to: CGFloat(isDetectingLongPress ? 3.0 : done ? 3.0 : 0.0))
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: width * 0.075, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                
                if done {
                    Circle()
                        .fill(Color.orange)
                }

                Image(systemName: "bed.double")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(done ? .white : .orange)
                    .frame(width: width * 0.45)
                    .padding()
                
                Text("\(streak)")
                    .font(.headline)
                    .bold()
                    .foregroundColor(done ? .white : Color.secondary.opacity(0.55))
                    .offset(y: height * 0.35)
            }
            .frame(width: width, height: height)
            .contentShape(Circle())
            .gesture(longPress)
            .padding(.bottom, 5)
            
            Text(title)
                .font(.title3)
                .foregroundColor(.orange)
                .fontWeight(.bold)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(width: 200, height: 200)
    }
}
