//
//  ContentView.swift
//  TrafficLight_SwiftUI
//
//  Created by Андрей Барсук on 06.06.2022.
//

import SwiftUI

enum TrafficLight {
    case none
    case red
    case yellow
    case green
}

struct ContentView: View {
    @State private var currentLight = TrafficLight.none
    @State private var redLightOpacity = 0.5
    @State private var yellowLightOpacity = 0.5
    @State private var greenLightOpacity = 0.5
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Text("Traffic Light")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                ColorCircleView(color: .red, opacity: redLightOpacity)
                ColorCircleView(color: .yellow, opacity: yellowLightOpacity)
                ColorCircleView(color: .green, opacity: greenLightOpacity)
                Spacer()
                Button(action: {
                    switchTrafficLight()
                }) {
                    Text(currentLight == TrafficLight.none ? "Start" : "Next")
                        .font(.title)
                }
            }
            .padding(.top)
        }
    }
    
    private func switchTrafficLight() {
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightOpacity = 0.5
            yellowLightOpacity = 1
        case .yellow:
            currentLight = .green
            yellowLightOpacity = 0.5
            greenLightOpacity = 1
        case .green, .none:
            currentLight = .red
            greenLightOpacity = 0.5
            redLightOpacity = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
