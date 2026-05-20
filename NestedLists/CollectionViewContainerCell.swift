//
//  CollectionViewContainerCell.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

import UIKit

class CollectionViewContainerCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [CategoryItem] = []
    
    func configure(with items: [CategoryItem]) {
        self.items = items
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false  // cleaner look
        collectionView.reloadData()
    }
}

extension CollectionViewContainerCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    // Controls the size of each item
    func collectionView(_ cv: UICollectionView,
                        layout layout2: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    
    // Padding around the whole section
    func collectionView(_ cv: UICollectionView,
                        layout layout2: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    // Gap between each item
    func collectionView(_ cv: UICollectionView,
                        layout layout2: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ cv: UICollectionView,
                        layout layout2: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
