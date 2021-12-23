//
//  MenuTableViewCell.swift
//  clockInOut
//
//  Created by armyxx on 14/12/2564 BE.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuTableViewCell"

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with menuListValue: MenuList) {
        labelView.text = menuListValue.menuList
        imagesView.image = menuListValue.menuImage
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MenuTableViewCell", bundle: nil)
    }
}
