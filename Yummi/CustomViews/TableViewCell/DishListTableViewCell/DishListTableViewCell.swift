//
//  DishListTableViewCell.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/1/23.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = String(describing: DishListTableViewCell.self)

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUp(dish: Dish) {
        dishImage.kf.setImage(with: dish.image?.asURL)
        titelLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
}
