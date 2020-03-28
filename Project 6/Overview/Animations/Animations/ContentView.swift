//
//  ContentView.swift
//  Animations
//
//  Created by Maris Lagzdins on 28/03/2020.
//  Copyright © 2020 DeveloperMaris. All rights reserved.
//

import SwiftUI

// 1. Creating implicit animations

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//
//    var body: some View {
//        Button("Tap me") {
//            self.animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default)
//    }
//}

// 2. Customizing animations in SwiftUI

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//
//    var body: some View {
//        //        Button("Tap me") {
//        //            self.animationAmount += 1
//        //        }
//        //        .padding(50)
//        //        .background(Color.red)
//        //        .foregroundColor(.white)
//        //        .clipShape(Circle())
//        //        .scaleEffect(animationAmount)
//        //        .animation(
//        //            Animation
//        //                .easeInOut(duration: 1)
//        //                .repeatCount(3, autoreverses: true)
//        //                .delay(1)
//        //        )
//
//        Button("Tap me") {
//            //            self.animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation
//                        .easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear {
//            self.animationAmount = 2
//        }
//    }
//}

// 3. Animating bindings

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//
//    var body: some View {
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                Animation
//                    .easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//
//            Spacer()
//
//            Button("Tap me") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//
//        }
//    }
//}

// 4. Creating explicit animations

struct ContentView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
