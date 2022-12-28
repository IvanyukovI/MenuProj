//
//  Category.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 27.12.2022.
//

import Foundation

enum Category: Int, CaseIterable, Codable {
    
    case all = 0
    case emoji = 1
    case numbers = 2
    case words = 3
    
    var title: String {
        switch self {
        case .all : return "Все"
        case .emoji: return "Эмоджи"
        case .numbers: return "Цифры"
        case .words: return "Cлова"
        }
    }
    
}

