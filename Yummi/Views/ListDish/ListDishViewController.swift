//
//  ListDishViewController.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/1/23.
//

import UIKit

class ListDishViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var popular: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id!) { [weak self] result in
            switch result {
            case .success(let dishes):
                self?.popular = dishes
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

//MARK: - TableView
extension ListDishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popular.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setUp(dish: popular[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = popular[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
