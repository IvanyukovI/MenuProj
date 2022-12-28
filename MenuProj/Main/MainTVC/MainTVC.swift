//
//  MainTVC.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 27.12.2022.
//

import UIKit

class MainTVC: UITableViewCell {
    
    static let reuseId = "MainCell"
    
    @IBOutlet weak var TextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(text: String) {
        
        TextLabel.text = text
        
    }
    
}
