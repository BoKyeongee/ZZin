//
//  MainPageReviewCollectionViewCell.swift
//  ZZin
//
//  Created by clone1 on 2023/10/15.
//

import UIKit
import SnapKit

class ReviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReviewCollectionViewCell"
    
    let reviewUiView = RecommendPlaceReviewThumbnail()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init 오류")
    }
    
    func configureSubview(){
        addSubview(reviewUiView)
        reviewUiView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
