//
//  AstronautView.swift
//  Moonshot
//
//  Created by Maris Lagzdins on 25/04/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let astronautMissions: [Mission]

    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut

        var matches = [Mission]()

        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                matches.append(mission)
            }
        }

        self.astronautMissions = matches
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    HStack {
                        Text("Missions:")
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ForEach(self.astronautMissions, id: \.id) { mission in
                        HStack {
                            Image(systemName: "airplane")
                            Text("\(mission.displayName)")

                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
