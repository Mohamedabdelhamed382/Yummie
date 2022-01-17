//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import UIKit
import Kingfisher
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
    override func viewWillAppear(_ animated: Bool) {
        populateView()
    }
    
    
}

extension DishDetailViewController{

    private func populateView(){
        
        dishImageVIew.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        descriptionlabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        
    }


}

extension DishDetailViewController{
    @IBAction func placeOrderPressedButton(_ sender: Any) {
        
        
    }
}
