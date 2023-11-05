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
    var data: String = ""
    let storageManager = FireStorageManager()
    
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
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    func dataBinding(rid: String) {
        self.data = rid
        storageManager.bindViewOnStorageWithRid(rid: rid,
                                                reviewImgView: reviewUiView.img,
                                                title: reviewUiView.reviewTitleLabel,
                                                companion: reviewUiView.withKeywordLabel,
                                                condition: reviewUiView.conditionKeywordLabel,
                                                town: reviewUiView.regionLabel)
    }
}
