//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/01/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextToOnbordingScreenButton: UIButton!
    @IBOutlet weak var onbordingPageControl: UIPageControl!
    
    var slides:[OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            onbordingPageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextToOnbordingScreenButton.setTitle("Get Started", for: .normal)
            }else {
                nextToOnbordingScreenButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuo()
    }
    
}

extension OnboardingViewController{
    
    private func setuo(){
        initializeCollectionView()
        bindingData()
        onbordingPageControl.numberOfPages = slides.count
    }
    
    private func bindingData(){
        slides = [ OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from differnt cultures around the world", image: UIImage(named: "slide1")!),
                   OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: UIImage(named: "slide2")!),
                   OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your order will be deliverd instantly irrespective of your location arounf=d the world", image: UIImage(named: "slide3")!)]
    }
    
    private func updatedSlideByActionButton(){
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "Controller") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private func initializeCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)as! OnboardingCollectionViewCell
        cell.configureSlideCell(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnboardingViewController{
    @IBAction func nextToOnbordingScreenPressedButton(_ sender: UIButton) {
        updatedSlideByActionButton()
    }
}
