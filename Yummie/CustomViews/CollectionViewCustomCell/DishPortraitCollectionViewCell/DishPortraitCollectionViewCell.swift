//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 15/01/2022.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    
    func setup(dish: Dish){
        
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionlabel.text = dish.description
    }
}
