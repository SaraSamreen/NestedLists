//
//  CollectionViewContainerCell.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

import UIKit

class CollectionViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [CategoryItem] = []
    
    func configure(with items: [CategoryItem]) {
        self.items = items
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.reloadData()
    }
}


extension CollectionViewCell: UICollectionViewDataSource{
    
    func collectionView(_ cv: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ cv: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "ItemCell",
                                          for: indexPath) as! ItemCell
        let item = items[indexPath.item]
        cell.itemImageView.image = UIImage(named: item.imageName)
        return cell
    }
}
