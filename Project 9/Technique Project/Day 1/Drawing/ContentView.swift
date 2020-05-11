//
//  ContentView.swift
//  Drawing
//
//  Created by Maris Lagzdins on 02/05/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

// MARK: - 1. Creating custom paths with SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            // path.addLine(to: CGPoint(x: 100, y: 300))
//        }
//            // .fill(Color.blue)
//            // .stroke(Color.blue.opacity(0.25), lineWidth: 10)
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//
//    }
//}

// MARK: - 2. Paths vs shapes in SwiftUI

//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}
//
//struct Arc: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        /*
//         What’s happening here is two-fold:
//
//         1. In the eyes of SwiftUI 0 degrees is not straight upwards, but instead directly to the right.
//         2. Shapes measure their coordinates from the bottom-left corner rather than the top-left corner, which means SwiftUI goes the other way around from one angle to the other.
//
//         We can fix both of those problems with a new path(in:) method that subtracts 90 degrees from the start and end angles, and also flips the direction so SwiftUI behaves the way nature intended:
//         */
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        // Triangle()
//            // .fill(Color.red)
//            // .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            // .frame(width: 300, height: 300)
//
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//            .stroke(Color.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
//    }
//}

// MARK: - 3. Adding strokeBorder() support with InsettableShape

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
        // Circle()
        //     .strokeBorder(Color.blue, lineWidth: 40)
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
