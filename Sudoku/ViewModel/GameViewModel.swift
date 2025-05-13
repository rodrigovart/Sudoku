//
//  GameViewModel.swift
//  Sudoku
//
//  Created by Rodrigo Vart on 12/05/25.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var grid: [[SudokuCell]] = []
    @Published var selectedRow: Int? = nil
    @Published var selectedCol: Int? = nil
    
    init() {
        generateEmptyGrid()
    }
    
    func generateEmptyGrid() {
        grid = (0..<9).map { row in
            (0..<9).map { col in
                SudokuCell(row: row, col: col, value: nil)
            }
        }
    }
    
    func selectCell(row: Int, col: Int) {
        selectedRow = row
        selectedCol = col
        for r in 0..<9 {
            for c in 0..<9 {
                grid[r][c].isSelected = (r == row && c == col)
            }
        }
    }
    
    func inputNumber(_ number: Int) {
        guard let row = selectedRow, let col = selectedCol else { return }
        grid[row][col].value = number
    }
    
    func erase() {
        guard let row = selectedRow, let col = selectedCol else { return }
        grid[row][col].value = nil
    }
}

