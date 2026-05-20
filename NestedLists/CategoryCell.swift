//
//  CategoryCell.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exploreButton: UIButton!
    
    var onExploreTapped: (() -> Void)?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImageView.layer.cornerRadius = 12
        categoryImageView.clipsToBounds = true
        categoryImageView.contentMode = .scaleAspectFill
        categoryImageView.layer.borderWidth = 1
        self.selectionStyle = .none

    }
    
    @IBAction func exploreTapped(_ sender: UIButton) {
        onExploreTapped?()
    }
}
