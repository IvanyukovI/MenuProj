//
//  СharacterModel.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 28.12.2022.
//

import Foundation

class Сharacter {
    var allCategory: [String] = []
    var emojiArray: [String] = []
    let numbArray = ["0","1","2","3","4","5","6","7","8","9"]
    let words = ["автарх", "аконин", "алнико", "апанаж", "афереза", "ширит", "банька", "белуга", "бетаин", "бонито", "бражка", "булава", "вахлак", "виксит", "вирник", "воронь", "гастат", "гнеток", "гнидия", "грелка"]
    
    let emojiRanges = [
        
        0x1F600...0x1F64F, // Emoticons
//        8400...8447,// Combining Diacritical Marks for Symbols
//        9100...9300, // Misc items
//        0x2600...0x26FF,   // Misc symbols
//        0x2700...0x27BF,   // Dingbats
//        0x1F018...0x1F270, // Various asian characters
//        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
//        0x1F680...0x1F6FF, // Transport and Map
//        0x1F1E6...0x1F1FF, // Regional country flags
//        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        ]
    
    func getEmoji() {
        for range in emojiRanges {
            for i in range {
                emojiArray.append(String(UnicodeScalar(i)!))
            }
        }
        for range in emojiArray {
            allCategory.append(String(range))
        }
    }
    
    func getArr(array: [String]) {
        for range in array {
            allCategory.append(range)
        }
    }
    
   public func getAll() {
        getEmoji()
//        getNumber()
//        getWords()
       getArr(array: numbArray)
       getArr(array: words)
       allCategory.shuffle()
    }
}
