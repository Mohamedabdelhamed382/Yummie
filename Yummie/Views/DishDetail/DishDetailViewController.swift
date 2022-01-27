//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import UIKit
import Kingfisher
import ProgressHUD
class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageVIew: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
}

extension DishDetailViewController{
    
    private func populateView(){
        
        dishImageVIew.kf.setImage(with: dish.image?.asUrl )
        dishTitleLabel.text = dish.name
        descriptionlabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        
    }
    
    private func orderPlaceTextFeild(){
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("please enter your name"); return}
        ProgressHUD.show("Placing Order.....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result{
            case .success(let order):
                ProgressHUD.showSuccess("Your order has beeen received......👨‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}

extension DishDetailViewController{
    @IBAction func placeOrderPressedButton(_ sender: Any) {
        orderPlaceTextFeild()
    }
}
