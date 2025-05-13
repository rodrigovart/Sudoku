//
//  SudokuCell.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 12/05/25.
//

import Foundation

struct SudokuCell: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    var value: Int?
    var isSelected: Bool = false
}
