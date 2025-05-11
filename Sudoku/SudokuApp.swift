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
    static let redApp = UIColor(red: 239/255, green: 51/255, blue: 73/255, alpha: 1.0)
    static let pinkApp = UIColor(red: 255/255, green: 74/255, blue: 95/255, alpha: 1.0)
    static let lightGrayApp = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
}

extension Color {
    static let yellowApp = Color(UIColor.yellowApp)
    static let redApp = Color(UIColor.redApp)
    static let pinkApp = Color(UIColor.pinkApp)
    static let lightGrayApp = Color(UIColor.lightGrayApp)
}
