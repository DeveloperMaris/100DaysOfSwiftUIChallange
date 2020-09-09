//
//  ContentView.swift
//  Drawing
//
//  Created by Maris Lagzdins on 08/09/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    var thickness: CGFloat = 20.0
    
    var animatableData: CGFloat {
        get { thickness }
        set { thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        let xModifier = thickness / 2
        path.move(to: CGPoint(x: rect.midX - xModifier, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - xModifier, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + xModifier, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + xModifier, y: rect.midY))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var gradientStartPoint: UnitPoint = .top
    var gradientEndPoint: UnitPoint = .bottom
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.2),
                    ]), startPoint: self.gradientStartPoint, endPoint: self.gradientEndPoint), lineWidth: 2)
            }
        }
    }
    
    private func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps)
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var arrowThickness: CGFloat = 30
    @State private var gradientStartXPoint = 0.0
    
    private var gradientStartPoint: UnitPoint {
        let x = sin(gradientStartXPoint)
        return UnitPoint(x: CGFloat(x), y: 0)
    }
    
    private var gradientEndPoint: UnitPoint {
        let x = cos(gradientStartXPoint)
        return UnitPoint(x: CGFloat(abs(x)), y: 1)
    }
    
    var body: some View {
        VStack {
            Arrow(thickness: arrowThickness)
                .frame(width: 100, height: 200)
                .onTapGesture {
                    withAnimation {
                        self.arrowThickness = .random(in: 10...70)
                    }
            }
            
            ColorCyclingRectangle(gradientStartPoint: gradientStartPoint, gradientEndPoint: gradientEndPoint)
                .frame(width: 300, height: 300)
                .drawingGroup()
            
            Slider(value: $gradientStartXPoint, in: 0...Double.pi)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
