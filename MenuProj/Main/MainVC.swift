//
//  ViewController.swift
//  MenuProj
//
//  Created by Игорь Иванюков on 26.12.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var CategoryCV: UICollectionView!
    @IBOutlet weak var resultTV: UITableView!
    
    var symbolArray = Сharacter()
    var allSymbol: [String] = []
    var category = Category.allCases
    var selectCategory: [Category] = [.all]
    var filt: Set<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryCV.dataSource = self
        CategoryCV.delegate = self
        CategoryCV.register(UINib.init(nibName: "MainCVC", bundle: nil), forCellWithReuseIdentifier: MainCVC.reuseId)
        resultTV.register(UINib(nibName: "MainTVC", bundle: nil), forCellReuseIdentifier: MainTVC.reuseId )
        resultTV.delegate = self
        resultTV.dataSource = self
        CategoryCV.allowsMultipleSelection = true
        symbolArray.getAll()
        allSymbol = symbolArray.allCategory
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
//            allSymbol.removeAll()
            sortArray(selectCategory: selectCategory)
            resultTV.reloadData()
            return
        case .words, .numbers, .emoji :
            if selectCategory.contains(cellData) {
                selectCategory = selectCategory.filter(){$0 != .all}
                selectCategory = selectCategory.filter(){$0 != cellData}
                CategoryCV.reloadData()
//                allSymbol.removeAll()
                sortArray(selectCategory: selectCategory)
                resultTV.reloadData()
            } else {
                selectCategory.append(cellData)
                selectCategory = selectCategory.filter(){$0 != .all}
                CategoryCV.reloadData()
//                allSymbol.removeAll()
                sortArray(selectCategory: selectCategory)
                resultTV.reloadData()
            }
            if selectCategory.isEmpty {
                selectCategory.removeAll()
                selectCategory.append(.all)
                CategoryCV.reloadData()
//                allSymbol.removeAll()
                sortArray(selectCategory: selectCategory)
                resultTV.reloadData()
            }
            return
        }
    }
    
    func sortArray (selectCategory: [Category]) {
       
//        allSymbol = symbolArray.allCategory
        
        
        for categ in selectCategory {
                switch categ {
                case .all :
                    allSymbol = symbolArray.allCategory
                    return
                case .words :
                    filt = Set(symbolArray.words)
                    //                allSymbol = symbolArray.allCategory.filter{ filt.contains($0)}
                    allSymbol = allSymbol.filter{ filt.contains($0)}
                    return
                case .emoji :
                    filt = Set(symbolArray.emojiArray)
                    //                allSymbol.append(contentsOf: symbolArray.allCategory.filter{ filt.contains($0)})
                    //                allSymbol = symbolArray.allCategory.filter{ filt.contains($0)}
                    allSymbol = allSymbol.filter{ filt.contains($0)}
                    return
                case .numbers :
                    filt = Set(symbolArray.numbArray)
                    //                allSymbol.append(contentsOf: symbolArray.allCategory.filter{ filt.contains($0)})
                    //                allSymbol = symbolArray.allCategory.filter{ filt.contains($0)}
                    allSymbol = allSymbol.filter{ filt.contains($0)}
                    return
                }
        }
    }
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSymbol.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTVC.reuseId , for: indexPath) as? MainTVC else { return UITableViewCell() }
        let cellData = allSymbol[indexPath.row]
        cell.set(text: String(cellData))
        return cell
    }
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = allSymbol[indexPath.row]
        let detailsVC = DetailsVC()
        detailsVC.symbol = cellData
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Назад", style: .done, target: nil, action: nil)
        show(detailsVC, sender: nil)
        
    }
    
   
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            let filterId = self.allSymbol.filter{$0 != self.allSymbol[indexPath.row]}
            self.allSymbol.removeAll()
            for filterId in filterId {
                self.allSymbol.append(filterId)
            }
            tableView.reloadData()
            completionHandler(true)
        }
        
        delete.image = UIImage(systemName: "multiply.circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        delete.backgroundColor = .systemBackground
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}
