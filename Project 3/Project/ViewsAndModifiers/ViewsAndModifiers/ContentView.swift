//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Maris Lagzdins on 04/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content

            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows) { row in
                HStack {
                    ForEach(0..<self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView: View {
//    @State private var useRedText = false

//    var motto1: some View { Text("Draco dormiens") }
//    let motto2 = Text("nunquam titillandus")

    var body: some View {
        /*
         Modifier order matters.

         The best way to think about it for now is to imagine that SwiftUI renders your view after every single modifier.
         So, as soon as you say .background(Color.red) it colors the background in red, regardless of what frame you give it. If you then later expand the frame, it won’t magically redraw the background – that was already applied.
         */
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
//
//        Button("Hello World") {
//            // do nothing
//        }
//        .background(Color.red)
//        .frame(width: 200, height: 200)
//
//        Text("Hello World")
//            .padding()
//            .background(Color.red)
//            .padding()
//            .background(Color.blue)
//            .padding()
//            .background(Color.green)
//            .padding()
//            .background(Color.yellow)

        /*
         Conditional modifiers

         It’s common to want modifiers that apply only when a certain condition is met, and in SwiftUI the easiest way to do that is with the ternary operator.
         */

//        Button("Hello World") {
//            self.useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)

        /*
         Environment modifiers

         Many modifiers can be applied to containers, which allows us to apply the same modifier to many views at the same time.
         */

//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//                .blur(radius: 5)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title) // Environment modifier
//        .blur(radius: 5) // Regular modifier

        /*
         Views as properties

         There are lots of ways to make it easier to use complex view hierarchies in SwiftUI, and one option is to use properties – to create a view as a property of your own view, then use that property inside your layouts.
         */

//        VStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//        }

        /*
         View composition

         SwiftUI lets us break complex views down into smaller views without incurring much if any performance impact. This means that we can split up one large view into multiple smaller views, and SwiftUI takes care of reassembling them for us.

         We can wrap multiple views up in a new custom view and use that.
         */

//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//                .foregroundColor(.white)
//            CapsuleText(text: "Second")
//                .foregroundColor(.yellow)
//        }

        /*
         Custom modifiers

         SwiftUI gives us a range of built-in modifiers, such as font(), background(), and clipShape(). However, it’s also possible to create custom modifiers that do something specific.
         */

//        Text("Hello World")
//            .modifier(Title())
//            .titleStyle()
//        Color.blue
//            .frame(width: 300, height: 300)
//            .watermarked(with: "Hacking with Swift")

        /*
         Custom containers

         It’s perfectly possible to create custom containers in your SwiftUI apps.
         */

        GridStack(rows: 4, columns: 4) { row, column in
            // @ViewBuilder will automatically create an implicit horizontal stack inside our closure
//            HStack {
                Image(systemName: "\(row * 4 + column).circle")
                Text("R\(row) C\(column)")
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
