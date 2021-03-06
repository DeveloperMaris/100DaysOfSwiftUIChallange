//
//  ContentView.swift
//  Drawing
//
//  Created by Maris Lagzdins on 02/05/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

// MARK: - 1. Special effects in SwiftUI: blurs, blending, and more

//struct ContentView: View {
//    @State private var amount: CGFloat = 0.0
//
//    var body: some View {
//        //        ZStack {
//        //            Image("Me")
//        //
//        //            Rectangle()
//        //                .fill(Color.red)
//        //                .blendMode(.multiply)
//        //        }
//        //        .frame(width: 400, height: 500)
//        //        .clipped()
//
//
//        //        Image("Me")
//        //            .colorMultiply(.red)
//
//        VStack {
////            ZStack {
////                Circle()
//////                    .fill(Color.red)
////                    .fill(Color(red: 1, green: 0, blue: 0))
////                    .frame(width: 200 * amount)
////                    .offset(x: -50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
//////                    .fill(Color.green)
////                    .fill(Color(red: 0, green: 1, blue: 0))
////                    .frame(width: 200 * amount)
////                    .offset(x: 50, y: -80)
////                    .blendMode(.screen)
////
////                Circle()
//////                    .fill(Color.blue)
////                    .fill(Color(red: 0, green: 0, blue: 1))
////                    .frame(width: 200 * amount)
////                    .blendMode(.screen)
////            }
////            .frame(width: 300, height: 300)
//
//            Image("Me")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .saturation(Double(amount))
//                .blur(radius: (1 - amount) * 20)
//
//            Slider(value: $amount)
//            .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(.all)
//    }
//}

// MARK: - 2. Animating simple shapes with animatableData

//struct Trapezoid: Shape {
//    var insetAmount: CGFloat
//
//    var animatableData: CGFloat {
//        get { insetAmount }
//        set { self.insetAmount = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var insetAmount: CGFloat = 50
//    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    self.insetAmount = CGFloat.random(in: 10...90)
//                }
//        }
//    }
//}

// MARK: - 3. Animating complex shapes with AnimatablePair

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int

    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4

    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
