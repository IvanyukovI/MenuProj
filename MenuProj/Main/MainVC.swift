//
//  ViewController.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 26.12.2022.
//

import UIKit

class MainVC: UIViewController {
    
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

    @IBOutlet weak var CategoryCV: UICollectionView!
    @IBOutlet weak var resultTV: UITableView!
    
    var category = Category.allCases
    var selectCategory: [Category] = [.all]
    var emojiArray: [Unicode.Scalar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryCV.dataSource = self
        CategoryCV.delegate = self
        CategoryCV.register(UINib.init(nibName: "MainCVC", bundle: nil), forCellWithReuseIdentifier: MainCVC.reuseId)
        resultTV.register(UINib(nibName: "MainTVC", bundle: nil), forCellReuseIdentifier: MainTVC.reuseId )
        resultTV.delegate = self
        resultTV.dataSource = self
        CategoryCV.allowsMultipleSelection = true
        getEmoji()
    }
    
    func getEmoji() {
        for range in emojiRanges {
            for i in range {
                emojiArray.append(UnicodeScalar(i)!)
            }
        }
    }

       


}

extension MainVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCVC.reuseId, for: indexPath) as? MainCVC else { return UICollectionViewCell() }
        
        let cellData = category[indexPath.row]
        cell.label.text = cellData.title
        cell.set(isOn: selectCategory.contains(cellData), category: category, selectCategory: cellData)
  
        return cell
    }

}

extension MainVC:  UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellData = category[indexPath.row]
        
        switch cellData {
        case .all :
            selectCategory.removeAll()
            selectCategory.append(.all)
            CategoryCV.reloadData()
            return
        case .words, .numbers, .emoji :
            if selectCategory.contains(cellData) {
                selectCategory = selectCategory.filter(){$0 != .all}
                selectCategory = selectCategory.filter(){$0 != cellData}
                CategoryCV.reloadData()
            } else {
                selectCategory.append(cellData)
                selectCategory = selectCategory.filter(){$0 != .all}
                CategoryCV.reloadData()
            }
            return
        }
        
        
    }
    
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTVC.reuseId , for: indexPath) as? MainTVC else { return UITableViewCell() }
        let cellData = emojiArray[indexPath.row]
        cell.set(text: String(cellData))
        return cell
    }
}

extension MainVC: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let commandVC = CommandVC()
//        commandVC.command = BaseCommand.shared.commands[indexPath.row]
//        commandVC.completion = {[unowned self] command in
//            if command == true {
//            self.dataFilling()
//            self.tableView.reloadData()
//            }
//        }
//        navigationItem.backBarButtonItem = UIBarButtonItem(
//            title: "Команды", style: .plain, target: nil, action: nil)
//        show(commandVC, sender: nil)
//    }
}
