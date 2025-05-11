//
//  WelcomeView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 11/05/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Welcome to")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Sudoku")
                        .font(.system(size: 48, weight: .bold))
                    
                    Text("Hatchling")
                        .font(.system(size: 36, weight: .light))
                }
                
                Image("LogoOwl")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .padding(.top, 20)
                
                Text("Crack the puzzles, spread your wings,\nand become a Sudoku master!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // ação de início aqui
                }) {
                    Text("Let’s Start!")
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
    }
}


#Preview {
    WelcomeView()
}
