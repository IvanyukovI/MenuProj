//
//  DetailsVC.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 10.01.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var labelSymbol: UILabel!
    
    var symbol: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set(symbol: symbol)

    }
    
    func set(symbol: String) {
        labelSymbol.text = symbol
    }

}
