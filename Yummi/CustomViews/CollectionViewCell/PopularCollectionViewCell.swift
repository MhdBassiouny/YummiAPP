//
//  PopularCollectionViewCell.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/31/22.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: PopularCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(dish: Dish) {
        self.titleLabel.text = dish.name ?? "Dish Title"
        self.dishImageView.kf.setImage(with: dish.image?.asURL)
        self.caloriesLabel.text = dish.formattedCalories
        self.descriptionLabel.text = dish.description ?? " "
    }
}
