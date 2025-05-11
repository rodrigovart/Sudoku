//
//  WelcomeView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 11/05/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Bem-vindo ao")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Sudoku")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Iniciante")
                        .font(.title)
                        .fontWeight(.light)
                }
                
                Image("LogoOwl")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .padding(.top, 20)
                
                Text("Resolva os desafios,\nabra suas asas e torne-se um mestre do Sudoku!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    shouldNavigate = true
                }) {
                    Text("Começar!")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.pinkApp, .redApp]),
                                           startPoint: .top, endPoint: .bottom)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                VStack(spacing: 0) {
                    Color.white
                    Color.yellowApp.frame(height: 150)
                }
            )
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $shouldNavigate) {
            EnterNameView()
        }
    }
}

#Preview {
    WelcomeView()
}
