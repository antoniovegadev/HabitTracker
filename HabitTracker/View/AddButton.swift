//
//  AddButton.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/16/21.
//

import SwiftUI

struct AddButton: View {
    @State private var done = false
    @Binding var tapped: Bool
    
    let width: CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.45), style: StrokeStyle(lineWidth: width * 0.075, lineCap: .round))
                
                Circle()
                    .trim(from: 0, to: CGFloat(done ? 3.0 : 0.0))
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: width * 0.075, lineCap: .round))
                    .rotationEffect(.degrees(-90))

                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .frame(width: width * 0.45)
            }
            .frame(width: width, height: width)
            .contentShape(Circle())
            .onTapGesture {
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    done = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    tapped = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+0.35) {
                    done = false
                }
            }
            .padding(.bottom, 5)
            
            Text("ADD A TASK")
                .font(.title3)
                .foregroundColor(.orange)
                .fontWeight(.bold)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(tapped: .constant(false), width: 100)
    }
}
