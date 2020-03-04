//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maris Lagzdins on 04/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {

        // 1. VStack
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello, World!")
//            Text("This is another text view")
//        }


        // 2. HStack
//        HStack(spacing: 20) {
//            Text("Hello, World!")
//            Text("This is another text view")
//        }


        // 3. Spacing
//        VStack {
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//        }


        // 4. ZStack
//        ZStack(alignment: .bottom) {
//            Text("Hello, World!")
//            Text("This is inside a stack")
//        }


        // 5. 3x3 grid
//        VStack(spacing: 20)  {
//            HStack(spacing: 20) {
//                Text("1")
//                Text("2")
//                Text("3")
//            }
//            HStack(spacing: 20)  {
//                Text("4")
//                Text("5")
//                Text("6")
//            }
//            HStack(spacing: 20)  {
//                Text("7")
//                Text("8")
//                Text("9")
//            }
//        }

// -----------------------------------------------------

        // 6. Colors and safe area
//        ZStack {
//            Color(red: 1, green: 0.8, blue: 0)
//                .edgesIgnoringSafeArea(.all)
//            Color.red
//                .frame(width: 200, height: 200)
//            Text("Your content")
//        }

// -----------------------------------------------------

        // 7. Linear Gradient
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)


        // 8. Radial Gradient
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)

        // 9. Angular Gradient
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue,. purple, .red]), center: .center)

//        Text("Content")
//            .background(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue,. purple, .red]), center: .center))

// -----------------------------------------------------

        // 10. Buttons
//        Button("Tap me") {
//            print("Button was tapped")
//        }

        // 11. Images
        /*
         Image("pencil") will load an image called “Pencil” that you have added to your project.
         Image(decorative: "pencil") will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
         Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple’s SF Symbols icon collection, and you can search for icons you like – download Apple’s free SF Symbols app from the web to see the full set.
         */
//        Button(action: {
//            print("Button was tapped")
//        }) {
////            Text("Tap me")
////            Image(systemName: "pencil")
//            HStack(spacing: 10) {
//                Image(systemName: "pencil")
//                    .renderingMode(.original)
//                Text("Edit")
//            }
//        }

        // -----------------------------------------------------

        // 12. Alerts

//        Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))

        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
