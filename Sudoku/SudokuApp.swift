//
//  SudokuApp.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 10/05/25.
//

import SwiftUI

@main
struct SudokuApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.font, .custom("Summary Notes", size: 17))
        }
    }
}

extension UIColor {
    static let yellowApp = UIColor(red: 255/255, green: 215/255, blue: 46/255, alpha: 1.0)
}
