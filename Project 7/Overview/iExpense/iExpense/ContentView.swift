//
//  ContentView.swift
//  iExpense
//
//  Created by Maris Lagzdins on 07/04/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

// MARK: - 2. Sharing SwiftUI state with @ObservedObject

//class User: ObservableObject {
//    @Published var firstname = "Bilbo"
//    @Published var lastname = "Baggins"
//}
//
//struct ContentView: View {
//    @ObservedObject private var user = User()
//
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstname) \(user.lastname)")
//            TextField("First name", text: $user.firstname)
//            TextField("Last name", text: $user.lastname)
//        }
//    }
//}

// MARK: - 3. Showing and hiding views

//struct SecondView: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    var name: String
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Hello \(name)")
//            Button("Dismiss") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var showingSheet = false
//
//    var body: some View {
//        Button("Show Sheet") {
//            self.showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "Maris")
//        }
//    }
//}

// MARK: - 4. Deleting items using onDelete()

//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//
//                Button("Add Number") {
//                    self.numbers.append(self.currentNumber)
//                    self.currentNumber += 1
//                }
//            }
//            .navigationBarItems(leading: EditButton())
//        }
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}

// MARK: - 5. Storing user settings with UserDefaults

//struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//        Button("Tap count \(tapCount)") {
//            self.tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//        }
//    }
//}

// MARK: - 6. Archiving Swift objects with Codable

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
