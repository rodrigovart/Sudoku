//
//  SplashView.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 10/05/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Egg 1")
                Image("Egg 2")
                Image("Egg 3")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

#Preview {
    SplashView()
}
