//
//  step 2_checkLottoWinner.swift
//  CodeStarterCamp_Week2
//
//  Created by Minseong Kang on 2022/02/20.
//

import Foundation

func generateLottoNumbers(maxRange: Int, maxNumber: Int) -> Set<Int> {
    var generatedNumbers: Set<Int> = []
    
    while generatedNumbers.count < maxNumber {
        generatedNumbers.insert(Int.random(in: 1...maxRange))
    }
    
    storeWinningNumbersByRounds(roundNumber: round, winningNumbers: generatedNumbers)
    
    return generatedNumbers
}

func checkLottoWinnerByRound(searchRound: Int = round, myNumberSet: Set<Int>) {
    
    guard let numbersForSearchRound = numbersByRounds[searchRound] else {
        printUnvalidRoundMessage(inputRound: searchRound)
        return
    }
    
    let winningNumbers = numbersForSearchRound.intersection(myNumberSet)
    
    if winningNumbers.count > 0 {
        print("축하합니다! \(searchRound)회차 결과와 겹치는 번호는 \(convertingIntSetToStringArray(winningNumbers).joined(separator: ", ")) 입니다!")
    } else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
}
