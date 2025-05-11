//
//  OnbordingView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 10/05/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var shouldShowWelcome = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentStep) {
                    OnboardingStepView(step: currentStep,
                                       title: "Desafios Progressivos de Sudoku",
                                       description: "Evolua de Casca de Ovo até Coruja Sábia enquanto resolve desafios criados para todos os níveis de habilidade!")
                    .tag(0)
                    OnboardingStepView(step: currentStep,
                                       title: "Caça Diária aos Ovos",
                                       description: "Descubra recompensas escondidas todos os dias com a nossa Caça Diária aos Ovos!")
                    .tag(1)
                    OnboardingStepView(step: currentStep,
                                       title: "Modo Coruja Noturna",
                                       description: "Resolva quebra-cabeças de Sudoku com estilo, de dia ou à noite!")
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                VStack(spacing: 12) {
                    Button(action: {
                        if currentStep < 2 {
                            currentStep += 1
                        } else {
                            shouldShowWelcome = true
                        }
                    }) {
                        Text("Próximo")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.pinkApp, .redApp]),
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    if currentStep > 0 {
                        Button(action: {
                            currentStep -= 1
                        }) {
                            Text("Voltar")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(                              LinearGradient(gradient: Gradient(colors: [.lightGrayApp, .white]),
                                                                                         startPoint: .top,
                                                                                         endPoint: .bottom))
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                    }
                }
                .frame(height: 150)
                .padding(.horizontal, 24)
                .background(Color.yellowApp)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $shouldShowWelcome) {
                WelcomeView()
            }
        }
    }
}

struct OnboardingStepView: View {
    let step: Int
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top, 40)
                .padding(.bottom, 40)
            
            OnboardingHeaderImageView(step: step)
                .padding(.bottom, 40)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Spacer()
        }
    }
}

struct OnboardingHeaderImageView: View {
    let step: Int
    
    var body: some View {
        if step == 0 {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(eggStages, id: \.title) { item in
                        VStack(spacing: 8) {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 52, height: 62)
                            
                            Text(item.title)
                                .font(.title)
                                .bold()
                            
                            Text(item.level)
                                .font(.body)
                        }
                    }
                }
                .padding(.vertical, 30)
            }
            .frame(maxWidth: .infinity)
            .background(Color.yellowApp)
            .ignoresSafeArea(.all)
        } else {
            HStack {
                Image("Feature \(step)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: 175, maxHeight: 175)
                    .clipped()
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var eggStages: [(image: String, title: String, level: String)] {
        [
            ("EggShell", "EggShell", "(Iniciante)"),
            ("EggCracked", "EggCracked", "(Fácil)"),
            ("EggChick", "EggChick", "(Intermediário)"),
            ("Fledgeling", "Fledgeling", "(Avançado)"),
            ("WiseOwl", "WiseOwl", "(Expert)")
        ]
    }
}

#Preview {
    OnboardingView()
}
