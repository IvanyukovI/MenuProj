//
//  MainCVC.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 26.12.2022.
//

import UIKit

class MainCVC: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    static let reuseId = "MainCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.backgroundColor = .systemBackground
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.07)
        label.layer.cornerRadius = 8.0
        label.isUserInteractionEnabled = true
        label.textColor = .black
    }
    
    func set (isOn: Bool, category: [Category], selectCategory: Category) {
        
        if !category.contains(selectCategory) || category.isEmpty, isOn == false {
            label.textColor = .darkGray
            label.layer.borderColor =  CGColor(red: 0, green: 0, blue: 0, alpha: 0.07)
        } else if isOn == true {
            label.textColor = .systemBlue
            label.layer.borderColor = UIColor.systemBlue.cgColor
        } else {
            label.textColor = .darkGray
            label.layer.borderColor =  CGColor(red: 0, green: 0, blue: 0, alpha: 0.07)
        }
    }
    
}
