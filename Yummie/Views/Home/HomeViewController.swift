//
//  HomeViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 13/01/2022.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    var categories:[DishCategory] = []
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

        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result{
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popular = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return  categories.count
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
            cell.setup(category: categories[indexPath.row])
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
            controller.category = categories[indexPath.row]
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
