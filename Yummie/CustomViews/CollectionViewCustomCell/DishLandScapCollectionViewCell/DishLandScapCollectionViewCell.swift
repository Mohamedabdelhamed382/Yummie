//
//  DishLandScapCollectionViewCell.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import UIKit
import Kingfisher

class DishLandScapCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandScapCollectionViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    func setup(dish: Dish ){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
    
    

}
