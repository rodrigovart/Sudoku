//
//  SplashView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 10/05/25.
//

import SwiftUI

struct SplashView: View {
    @State private var moveUp1 = false
    @State private var moveUp2 = false
    @State private var moveUp3 = false
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 12) {
                    Image("Egg 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 31)
                        .offset(y: moveUp1 ? -10 : 10)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: moveUp1
                        )
                    
                    Image("Egg 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 31)
                        .offset(y: moveUp2 ? -10 : 10)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: moveUp2
                        )
                    
                    Image("Egg 3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 31)
                        .offset(y: moveUp3 ? -10 : 10)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: moveUp3
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.yellowApp))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    moveUp1 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    moveUp2 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    moveUp3 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    shouldNavigate = true
                }
            }
            .navigationDestination(isPresented: $shouldNavigate) {
                OnboardingView()
            }
        }
    }
}

#Preview {
    SplashView()
}
