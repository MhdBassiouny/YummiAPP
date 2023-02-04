//
//  OnboardingCollectionViewCell.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/30/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescripionLabel: UILabel!
    
    func setUp(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescripionLabel.text  = slide.description
    }
}
