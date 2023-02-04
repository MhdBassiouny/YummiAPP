//
//  DishDetailsViewController.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/31/22.
//

import UIKit

class DishDetailsViewController: UIViewController {
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        // Do any additional setup after loading the view.
    }
    
    private func populateView() {
        dishImage.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

    @IBAction func placeOrder(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            return
        }
        
        NetworkService.shared.placeOrder(dishId: dish.id!, name: dish.name!) { result in
            switch result {
            case .success(let order):
                    print("success")
            case .failure(let error):
                    print(error)
            }
        }
        
    }
    
}
