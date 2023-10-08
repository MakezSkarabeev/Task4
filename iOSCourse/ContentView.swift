//
//  ContentView.swift
//  iOSCourse
//
//  Created by Sivenkov maxim  on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    private var duration = 0.22
    @State private var isAnimated = false

    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                isAnimated.toggle()

                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    isAnimated.toggle()
                }
            }
        } label: {
            HStack(spacing: 0) {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: isAnimated ? 40 : 0,
                        height: isAnimated ? 40 : 0
                    )
                    .opacity(isAnimated ? 1 : .zero)
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: 40,
                        height: 40
                    )

                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: isAnimated ? .zero : 40,
                        height: isAnimated ? .zero : 40
                    )
                    .opacity(isAnimated ? 0 : 1)
            }
        }
        .frame(width: 80, height: 40)
        .buttonStyle(ScaleEffectStyle())
    }
}

struct ScaleEffectStyle: ButtonStyle {

    private var duration = 0.22

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .foregroundColor(.gray)
                    .opacity(configuration.isPressed ? 1 : 0)
                    .animation(.linear(duration: duration), value: configuration.isPressed)
                    .frame(width: 100, height: 100)
            )
            .scaleEffect(configuration.isPressed ? 0.86 : 1)
            .animation(.linear(duration: duration), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
