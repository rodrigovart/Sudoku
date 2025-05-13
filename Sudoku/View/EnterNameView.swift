//
//  EnterNameView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 11/05/25.
//

import SwiftUI

struct EnterNameView: View {
    @AppStorage("playerName") private var storedName: String = ""
    @State private var playerName: String = ""
    @State private var shouldNavigate = false

    var body: some View {
        NavigationStack {
            Spacer()
            
            VStack(spacing: 32) {
                VStack(spacing: 12) {
                    Text("Sudoku")
                        .font(.system(size: 48, weight: .bold))

                    Text("Iniciante")
                        .font(.custom("Summary Notes", size: 36))

                    Image("LogoOwl")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
                .padding(.top, 60)

                Text("Me diga seu nome:")
                    .font(.title2)
                    .bold()

                TextField("", text: $playerName)
                    .padding()
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.yellowApp, lineWidth: 2)
                    )
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.horizontal, 32)

                Spacer()

                Button {
                    storedName = playerName
                    shouldNavigate = true
                } label: {
                    Text("Continuar")
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
            .background(Color.white)
            .ignoresSafeArea()
            .navigationDestination(isPresented: $shouldNavigate) {
                GameView()
            }
        }
    }
}

#Preview {
    EnterNameView()
}
