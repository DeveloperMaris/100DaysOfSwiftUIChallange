//
//  ContentView.swift
//  Moonshot
//
//  Created by Maris Lagzdins on 25/04/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

// MARK: - 1. Resizing images to fit the screen using GeometryReader

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Image("aldrin")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geo.size.width)
//            }
//        }
//    }
//}

// MARK: - 2. How ScrollView lets us work with scrolling data

//struct CustomText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a CustomText")
//        self.text = text
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        // Using Scrollview - creates 100 text objects instantly.
////        ScrollView(.vertical) {
////            VStack(spacing: 10) {
////                ForEach(0..<100) {
////                    CustomText("Item \($0)")
////                        .font(.title)
////                }
////            }
////            .frame(maxWidth: .infinity)
////        }
//
//        // Using List - creates new objects only when they are needed.
//        List {
//            ForEach(0..<100) {
//                CustomText("Item \($0)")
//                    .font(.title)
//            }
//        }
//    }
//}

// MARK: - 3. Pushing new views onto the stack using NavigationLink

//struct ContentView: View {
//    var body: some View {
////        NavigationView {
////            VStack {
////                NavigationLink(destination: Text("Detail View")) {
////                    Text("Hello World")
////                }
////            }
////            .navigationBarTitle("SwiftUI")
////        }
//
//        NavigationView {
//            List(0..<100) { row in
//                // Navigation Link will add grey indicators on the right side of the list rows automatically.
//                NavigationLink(destination: Text("Detail \(row)")) {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
//    }
//}

// MARK: - 4. Working with hierarchical Codable data

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            struct User: Codable {
                var name: String
                var address: Address
            }

            struct Address: Codable {
                var street: String
                var city: String
            }

            let data = Data(input.utf8)
            let decoder = JSONDecoder()

            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
