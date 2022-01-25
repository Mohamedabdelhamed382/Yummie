//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishesTableView: UITableView!
    var dish:[Dish] = []
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
        dish.append(.init(id: "1", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 1230))
        dish.append(.init(id: "2", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294598769.png", calories: 1045))
        dish.append(.init(id: "3", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 70))
        dish.append(.init(id: "4", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294598769.png", calories: 80))
        dish.append(.init(id: "5", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 90))
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listDishesTableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dish[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dish[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
