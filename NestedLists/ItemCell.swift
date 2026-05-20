//
//  ItemCell.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        itemImageView.contentMode = .scaleAspectFill
    }
}
