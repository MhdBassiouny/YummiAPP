//
//  OnboardingViewController.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/30/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageCotroller: UIPageControl!
    
    var onboardingSlides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageCotroller.currentPage = currentPage
            if currentPage == onboardingSlides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setModelData()
    }
    


    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage >= onboardingSlides.count - 1 {
            UserDefaults.standard.hasOnboarder = true
            let homeNavigationController = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            homeNavigationController.modalPresentationStyle = .fullScreen
            homeNavigationController.modalTransitionStyle = .flipHorizontal
            present(homeNavigationController, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
//Mark: - Double check this
            let rect = self.collectioView.layoutAttributesForItem(at: indexPath)?.frame
            self.collectioView.scrollRectToVisible(rect!, animated: false)
//            collectioView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
    }
    
    private func setModelData() {
        onboardingSlides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        pageCotroller.numberOfPages = onboardingSlides.count
    }
    
}

//MARK: - CollectionView
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setUp(onboardingSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
