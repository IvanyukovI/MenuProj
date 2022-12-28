//
//  СharacterModel.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 28.12.2022.
//

import Foundation

class Сharacter {
    
    var emojiArray: [Unicode.Scalar] = []
    
    let emojiRanges = [
        
        0x1F600...0x1F64F, // Emoticons
        8400...8447,// Combining Diacritical Marks for Symbols
        9100...9300, // Misc items
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0x1F018...0x1F270, // Various asian characters
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        ]
    
    func getEmoji() {
        for range in emojiRanges {
            for i in range {
                emojiArray.append(UnicodeScalar(i)!)
            }
        }
    }
    
    func getNumber() {
        
    }
}
