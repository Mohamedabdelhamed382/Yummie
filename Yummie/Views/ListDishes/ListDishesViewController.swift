//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import UIKit
import ProgressHUD
class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishesTableView: UITableView!
    var dishes:[Dish] = []
    var category: DishCategory!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

}
extension ListDishesViewController{
    private func setup(){
        title = category.title
        initializeCollectionview()
        bindingData()
        registerCategoryCell()
    }
    
    private func initializeCollectionview(){
        listDishesTableView.delegate = self
        listDishesTableView.dataSource = self
    }
    
    private func registerCategoryCell(){
        listDishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    private func bindingData(){
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(CategoryId: category.id ?? "") { [weak self](result) in
            switch result{
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.listDishesTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }

    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listDishesTableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
