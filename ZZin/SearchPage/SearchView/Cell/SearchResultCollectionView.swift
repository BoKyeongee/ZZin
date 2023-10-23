//
//  SearchResultView.swift
//  Pods
//
//  Created by t2023-m0045 on 10/18/23.
//

import UIKit
import SnapKit
import Then


class SearchResultCollectionView: UIView {
    
    //MARK: - Properties
                    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        
        return cv
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCollectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    //MARK: - Constraints
    
    func setCollectionViewConstraints(){
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
}



