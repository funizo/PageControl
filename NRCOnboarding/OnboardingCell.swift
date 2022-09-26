//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by 김세준 on 2022/09/23.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure (_ message: OnboardingMessage){
        thumbnailImageView.image = UIImage(named: message.imageName)
        
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}
