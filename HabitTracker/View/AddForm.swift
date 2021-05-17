//
//  AddForm.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/16/21.
//

import SwiftUI

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.secondary.opacity(0.3))
            .foregroundColor(.orange)
    }
}

struct AddForm: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter task title", text: $title)
                    .modifier(CustomTextFieldStyle())
                    .padding(.top)

                Spacer()
                
                Button("SAVE TASK") {
                    let activity = Activity(context: moc)
                    activity.created = Date()
                    activity.id = UUID()
                    activity.name = title
                    activity.streak = 0
                    try? moc.save()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .frame(width: 325, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(title.isEmpty ? Color.gray : Color.orange)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .disabled(title.isEmpty)
                .padding(.bottom, 20)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
            .ignoresSafeArea(.keyboard)
            .navigationBarTitle("Add Task", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()} ) {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .font(.title2)
                    .foregroundColor(.orange)
                }
                .clipShape(Rectangle())
                .padding(.leading, 5)
            )
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct AddForm_Previews: PreviewProvider {
    static var previews: some View {
        AddForm()
    }
}
