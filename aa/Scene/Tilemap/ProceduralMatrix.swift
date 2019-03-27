//
//  ManipulationMatrix.swift
//  TleMapPrototype
//
//  Created by João batista Romão on 01/03/19.
//  Copyright © 2019 João batista Romão. All rights reserved.
//
//
//
//
//
import Foundation
import GameKit
class ProceduralMatriz {
    var typeTyle  = TypeTile.self
    var numberColumn = 0
    var numberRows = 0
    func createMatrix(column: Int, row: Int ) -> [[Int]] {
        self.numberColumn = column
        self.numberRows = row
        var matrixTileMap = [[Int]](repeating: [Int](repeating: typeTyle.backgorund.rawValue, count: column), count: row)
        matrixTileMap = createBounds(matrixTile: matrixTileMap)
        matrixTileMap = cretatePlataforms(matrixTile: matrixTileMap)
        matrixTileMap = createGap(matrixTile: matrixTileMap)
        return matrixTileMap
        
    }
    
    func createBounds( matrixTile: [[Int]]) -> [[Int]] {
        var matrix = matrixTile
        let numberColumn = matrixTile[0].count
        let numberRows = matrixTile.count
        for row in 0..<numberRows {
            for column in 0..<numberColumn{
                if row == 0 || column == 0 || row == numberRows-1 || column == numberColumn-1{
                    matrix[row][column] = typeTyle.bounds.rawValue
                }
            }
        }
        return matrix
    }
    
    func cretatePlataforms(matrixTile: [[Int]]) -> [[Int]] {
        var matrix = matrixTile
       
        var distanceHeightPlataform = 0
        var column = numberColumn-2
        var row = numberRows - 4
        while(row > 2 && row < numberRows - 3 ){
            
                distanceHeightPlataform = sizeRandom(rangeMin: 1, rangerMax: 4)
                if distanceHeightPlataform == 2 {
                    distanceHeightPlataform = sizeRandom(rangeMin: 3, rangerMax: 4)
                }
            
                while(column > 0 && column <= numberColumn-2){
                    matrix[row][column] = typeTyle.plataforms.rawValue
                    column -= 1
                }
                column = numberColumn - 2
                row -= distanceHeightPlataform
            
        }
        return matrix
    }
    
    func createGap(matrixTile:[[Int]]) -> [[Int]] {
        var matrix = matrixTile
        var gapPlataform = 0
        var sizeGap = 0
        var row = numberRows - 2
        var lastPlataform = 0
        var lastSize = -1
        while(row > 2 && row < numberRows - 1 ){
            
          
            //size gap in plataforma
            sizeGap = sizeRandom(rangeMin: 2, rangerMax: 4)
            if lastSize == sizeGap{
                sizeGap = lastSize+1
            }
            
            if checkGap(rowMatrix: matrix[row+1]) == -1 {
                gapPlataform = sizeRandom(rangeMin: 1, rangerMax: numberColumn-sizeGap-2)
            }else{
                gapPlataform = checkGap(rowMatrix: matrix[row+1])
            }
            //Verifica se a linha tem plataformas
            if (matrix[row][3] == typeTyle.plataforms.rawValue){
                //Evita que crie buracos na mesma posicao e mesmo tamanho em plataformas afastadas
                if lastPlataform == gapPlataform{
                     lastPlataform = gapPlataform
                     matrix[row] = createGapInPlataform(rowMatrix: matrix[row], sizeGap: sizeGap + 1, initialGap: lastPlataform-1)
                    
                }else{
                     matrix[row] = createGapInPlataform(rowMatrix: matrix[row], sizeGap: sizeGap, initialGap: gapPlataform)
                }
               
            }
            lastPlataform = gapPlataform
            lastSize = sizeGap
            row -= 1
        }
        return matrix
    }
    
    func createGapInPlataform(rowMatrix: [Int], sizeGap: Int, initialGap: Int) -> [Int] {
        var column = initialGap
        let size = sizeGap+initialGap
        var row = rowMatrix
        while (column < size+1) {
            row[column] = typeTyle.backgorund.rawValue
            column += 1
        }
        return row
    }
    
    func checkGap(rowMatrix: [Int]) -> Int {
        var column = 1
        var initialGap = -1
        while (column < numberColumn-2) {
            if rowMatrix[column] == typeTyle.plataforms.rawValue{
                if rowMatrix[column+1] == typeTyle.backgorund.rawValue{
                    initialGap = column+1
                    break
                }
            }
            column += 1
        }
       return initialGap
        
    }
    
    func sizeRandom(rangeMin: Int, rangerMax: Int) -> Int {
        let random = Int.random(in: rangeMin..<rangerMax)
        return random
    }
    
    func reverseMatriz(matrix: [[Int]], rows: Int) -> [[Int]]{
        var matrixReverse = matrix
        var rowReverse = 0
        var row = rows-1
        while (row > 0) {
            matrixReverse[rowReverse] = matrix[row]
            row -= 1
            rowReverse += 1
        }
        return matrixReverse
    }
    
    
}