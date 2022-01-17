//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/01/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitlrlabel: UILabel!
    @IBOutlet weak var slideDescripationLabel: UILabel!
    
    func configureSlideCell(_ model: OnboardingSlide){
        self.slideImageView.image = model.image
        self.slideDescripationLabel.text = model.description
        self.slideTitlrlabel.text = model.title
    }
    
    
}
