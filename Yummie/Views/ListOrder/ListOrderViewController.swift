//
//  ListOrderViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 17/01/2022.
//

import UIKit

class ListOrderViewController: UIViewController {
    @IBOutlet weak var listOrderTableView: UITableView!
    var order:[Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
 
}

extension ListOrderViewController{
    private func setup(){
        title = "Orders"
        initialization()
        registerNib()
        bindData()
    }
    
    private func initialization(){
        listOrderTableView.delegate = self
        listOrderTableView.dataSource = self
    }
    
    private func registerNib(){
        listOrderTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    private func bindData(){
        order.append(.init(id: "234234", name: "mohamed", dish: .init(id: "1", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 1230)))
       
        order.append(.init(id: "232312", name: "ahmed", dish:.init(id: "2", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294598769.png", calories: 1045)))
       
        order.append(.init(id: "234234", name: "mohamed", dish: .init(id: "1", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 1230)))
       
        order.append(.init(id: "234234", name: "mohamed", dish: .init(id: "1", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 1230)))
      
        order.append(.init(id: "234234", name: "mohamed", dish:.init(id: "3", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 70)))
    }
}

extension ListOrderViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOrderTableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)as! DishListTableViewCell
        cell.setup(order: order[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = order[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
