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
        
        // Cell clipping
        self.layer.cornerRadius = 12
        self.clipsToBounds = true        // THIS clips the image to the rounded corners
        
        // Image fills the cell
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true
    }
}
