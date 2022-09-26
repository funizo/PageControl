//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 김세준 on 2022/09/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout =
            collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        pageControl.numberOfPages = messages.count
        
        pageControl.currentPage = 0 //점3개 중 흰색설정
        
        
    }
}
extension OnboardingViewController:
    UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
    }
    
    
}

extension OnboardingViewController:
    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}
//페이지 컨트롤 흰색 바꾸기
extension OnboardingViewController :
    UIScrollViewDelegate {
    //        func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //            print(Int(scrollView.contentOffset.x / self.collectionView.bounds.width))
    //        }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x /
                        self.collectionView.bounds.width)
        
        pageControl.currentPage = index
    }
}
