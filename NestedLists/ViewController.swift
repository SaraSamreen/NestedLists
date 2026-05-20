//
//  ViewController.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category] = [
        Category(title: "Electronics", description: "Phones, laptops, gadgets",
                 imageName: "Electronics",
                 items: [
                    CategoryItem(imageName: "laptop"),
                    CategoryItem(imageName: "Phone"),
                    CategoryItem(imageName: "macbook")
                 ]),
        
        Category(title: "Fashion", description: "Clothes, shoes, accessories",
                 imageName: "Fashion",
                 items: [
                    CategoryItem(imageName: "bag"),
                    CategoryItem(imageName: "watch"),
                 ]),
        Category(title: "Books", description: "Fiction, non-fiction, education",
                 imageName: "Books",
                 items: [
                    CategoryItem(imageName: "book1"),
                    CategoryItem(imageName: "book2"),
                    CategoryItem(imageName: "book3"),
                    CategoryItem(imageName: "book4")
                 ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return categories[section].isExpanded ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.titleLabel.text = category.title
            cell.descriptionLabel.text = category.description
            cell.categoryImageView.image = UIImage(named: category.imageName)
            
            cell.onExploreTapped = { [weak self] in
                self?.toggleSection(indexPath.section)
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
            cell.configure(with: category.items)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 124 : 160
    }
    
   func toggleSection(_ section: Int) {
        categories[section].isExpanded.toggle()
        
        let collectionIndexPath = IndexPath(row: 1, section: section)
        tableView.beginUpdates()
        if categories[section].isExpanded {
            tableView.insertRows(at: [collectionIndexPath], with: .fade)
        } else {
            tableView.deleteRows(at: [collectionIndexPath], with: .fade)
        }
        tableView.endUpdates()
    }
}


