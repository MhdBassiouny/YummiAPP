//
//  DishLandscapeCollectionViewCell.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/31/22.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(dish: Dish) {
        self.titleLabel.text = dish.name ?? "Dish Title"
        self.dishImage.kf.setImage(with: dish.image?.asURL)
        self.caloriesLabel.text = dish.formattedCalories
        self.descriptionLabel.text = dish.description ?? ""
    }
    
}
