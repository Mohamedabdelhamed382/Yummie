//
//  ListOrderViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 17/01/2022.
//

import UIKit
import ProgressHUD

class ListOrderViewController: UIViewController {
    @IBOutlet weak var listOrderTableView: UITableView!
    var order:[Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bindData()
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
        ProgressHUD.show()
        NetworkService.shared.fetchOrder { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.order = orders
                self?.listOrderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
