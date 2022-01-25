//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 14/01/2022.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLebel: UILabel!
    
}

extension CategoryCollectionViewCell{
    
    func setup(category: DishCategory){
        categoryTitleLebel.text = category.title
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
     
}
