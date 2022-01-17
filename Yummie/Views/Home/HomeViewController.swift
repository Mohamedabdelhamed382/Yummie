//
//  HomeViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 13/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    var category:[Dishcategory] = []
    var popular:[Dish] = []
    var specials: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    
    
}

extension HomeViewController{
    
    private func setup(){
        initializeCollectionview()
        bindingData()
        registerCategoryCell()
    }
    
    private func initializeCollectionview(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
    }
    
    private func registerCategoryCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandScapCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandScapCollectionViewCell.identifier)
        
    }
    private func bindingData(){
        category.append(.init(id: "1", name: "مطعم ديار الشام", image: "https://apis.tatx.com/uploads/categories/16360294598769.png"))
        category.append(.init(id: "2", name: "تموينات", image: "https://apis.tatx.com/uploads/categories/16360294411016.png"))
        category.append(.init(id: "3", name: "مطعم ديار الشام", image: "https://apis.tatx.com/uploads/categories/16360294598769.png"))
        category.append(.init(id: "4", name: "تموينات", image: "https://apis.tatx.com/uploads/categories/16360294144946.png"))
        category.append(.init(id: "5", name: "مطعم ديار الشام", image: "https://apis.tatx.com/uploads/categories/16360294499354.png"))
        
        popular.append(.init(id: "1", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 1230))
        popular.append(.init(id: "2", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294598769.png", calories: 1045))
        popular.append(.init(id: "3", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 70))
        popular.append(.init(id: "4", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294598769.png", calories: 80))
        popular.append(.init(id: "5", name: "بروفي شورمز", description: "These example sentences are selected automatically from various online news sources to reflect current usage of the word 'description.' Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors. Send us feedback.", image: "https://apis.tatx.com/uploads/categories/16360294144946.png", calories: 90))
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return  category.count
        case popularCollectionView, specialsCollectionView :
        return  popular.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: category[indexPath.row])
            return cell
        
        case popularCollectionView:
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: popular[indexPath.row])
            return cell
            
        case specialsCollectionView:
            let cell = specialsCollectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapCollectionViewCell.identifier, for: indexPath) as! DishLandScapCollectionViewCell
            cell.setup(dish: popular[indexPath.row])
            return cell

        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            let controller = ListDishesViewController.instantiate()
            controller.category = category[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        
        case popularCollectionView:
            let controller = DishDetailViewController.instantiate()
            controller.dish = popular[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        case specialsCollectionView:
            let controller = DishDetailViewController.instantiate()
            controller.dish = popular[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        default:
            return
        }
    }
}
