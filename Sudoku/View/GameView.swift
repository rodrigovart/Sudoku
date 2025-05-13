//
//  GameView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 12/05/25.
//

import SwiftUI

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Header
                Spacer()
                HStack {
                    Button(action: {
                        // voltar
                    }) {
                        Image(systemName: "xmark")
                            .padding()
                            .background(Color.redApp)
                            .clipShape(Circle())
                            .tint(.white)
                    }
                    
                    Spacer()
                    
                    Text("Eggshell Level - 1 of 10")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellowApp)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Toque em uma célula e escolha um número abaixo para preencher o tabuleiro.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Grade com grid da ViewModel
                VStack(spacing: 1) {
                    ForEach(0..<9, id: \.self) { row in
                        HStack(spacing: 1) {
                            ForEach(0..<9, id: \.self) { col in
                                let cell = viewModel.grid[row][col]
                                
                                Text(cell.value.map(String.init) ?? "")
                                    .frame(width: 32, height: 32)
                                    .background(cell.isSelected ? Color.yellowApp : Color.white)
                                    .border(Color.gridLine, width: 0.5)
                                    .onTapGesture {
                                        viewModel.selectCell(row: row, col: col)
                                    }
                            }
                        }
                    }
                }
                .padding(8)
                .background(Color.lightGrayApp)
                .cornerRadius(8)
                
                // Teclado
                VStack(spacing: 12) {
                    ForEach(0..<2) { row in
                        HStack(spacing: 12) {
                            ForEach(1..<6) { i in
                                let value = row == 0 ? i : i + 5
                                if value <= 9 {
                                    NumberButton(title: "\(value)") {
                                        viewModel.inputNumber(value)
                                    }
                                } else {
                                    NumberButton(title: "⌫") {
                                        viewModel.erase()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                // Botão resolver
                Button(action: {
                    // resolver
                }) {
                    Text("Resolver")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.pinkApp, .redApp]),
                                           startPoint: .top, endPoint: .bottom)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .padding(.top, 40)
                .padding(.bottom, 40)
                .padding(.horizontal, 24)
            }
            .background(Color.backgroundApp)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct NumberButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3)
                .frame(width: 48, height: 48)
                .background(Color.white)
                .foregroundColor(.black)
                .clipShape(Circle())
                .shadow(radius: 1)
        }
    }
}

#Preview {
    GameView()
}
