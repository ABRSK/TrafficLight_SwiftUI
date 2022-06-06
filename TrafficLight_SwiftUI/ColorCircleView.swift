//
//  ColorCircleView.swift
//  TrafficLight_SwiftUI
//
//  Created by Андрей Барсук on 06.06.2022.
//

import SwiftUI

struct ColorCircleView: View {
    var color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(maxWidth: 150, maxHeight: 150)
            .overlay(
                Circle()
                    .strokeBorder(lineWidth: 5)
                    .foregroundColor(color)
                    .opacity(opacity)
            )
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .green, opacity: 0.5)
    }
}
