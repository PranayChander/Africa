//
//  MotionAnimationView.swift
//  Africa
//
//  Created by pranay chander on 31/03/21.
//

import SwiftUI

struct MotionAnimationView: View {

    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    //1. random Coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //1. random Size
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 10...300)
    }
    //1. random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //1. random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //1. random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1.0)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height))
                }
                .animation(
                    Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                )
                .onAppear(perform: {
                    isAnimating = true
                })
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
