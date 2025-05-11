//
//  OnbordingView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 10/05/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentStep) {
                    OnboardingStepView(step: currentStep, 
                                       title: "Bem-vindo",
                                       description: "Aqui começa sua jornada")
                    .tag(0)
                    OnboardingStepView(step: currentStep,
                                       title: "Dica 1",
                                       description: "Use o app com sabedoria")
                    .tag(1)
                    OnboardingStepView(step: currentStep,
                                       title: "Pronto!",
                                       description: "Vamos começar?")
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Button(action: {
                    if currentStep < 2 {
                        currentStep += 1
                    } else {
                        // Finalizar onboarding
                        print("Ir para a Home")
                    }
                }) {
                    Text(currentStep < 2 ? "Próximo" : "Começar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.yellowApp))
        }
    }
}

struct OnboardingStepView: View {
    let step: Int
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            if step == 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        VStack {
                            Image("EggShell")
                                .resizable()
                                .frame(width: 52, height: 62)
                                .padding()
                            Text("EggShell")
                                .font(.title)
                                .bold()
                            Text("(Iniciante)")
                                .font(.body)
                        }
                        VStack {
                            Image("EggCracked")
                                .resizable()
                                .frame(width: 52, height: 62)
                                .padding()
                            Text("EggCracked")
                                .font(.title)
                                .bold()
                            Text("(Fácil)")
                                .font(.body)
                        }
                        VStack {
                            Image("EggChick")
                                .resizable()
                                .frame(width: 52, height: 62)
                                .padding()
                            Text("EggChick")
                                .font(.title)
                                .bold()
                            Text("(Intermediário)")
                                .font(.body)
                        }
                        VStack {
                            Image("Fledgeling")
                                .resizable()
                                .frame(width: 52, height: 62)
                                .padding()
                            Text("Fledgeling")
                                .font(.title)
                                .bold()
                            Text("(Avançado)")
                                .font(.body)
                        }
                        VStack {
                            Image("WiseOwl")
                                .resizable()
                                .frame(width: 52, height: 62)
                                .padding()
                            Text("texto 1")
                                .font(.title)
                                .bold()
                            Text("(Expert)")
                                .font(.body)
                        }
                    }
                }
            }
            Spacer()
            Text(title)
                .font(.largeTitle)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
