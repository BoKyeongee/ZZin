//
//  CommonCell.swift
//  ZZin
//
//  Created by 보경 on 10/16/23.
//

import UIKit
import SnapKit
import Then


//MARK: - ZZin 맛집에 대한 리뷰 cell을 위한 UIView 입니다.

class ViewForReview: UIView {
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Settings
    
    func setView(){
        backgroundColor = .systemGroupedBackground
        
        addSubViews()
        setConstraints()
    }
    
    
    // MARK: - Properties
    
    let wrap = UIView().then {
        $0.layer.cornerRadius = 50
        $0.backgroundColor = .black
    }
    
    let img = UIImageView().then{
        $0.image = UIImage(named: "ogudangdang_review.jpeg") // dummy img 입니다. 추후 변경 예정
        $0.layer.cornerRadius = 50
        $0.layer.opacity = 0.4
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
    }
    
    let titleLabel = UILabel().then {
        $0.text = "식감도 맛도 너무 좋은 '삼겹살' 맛집, 하남돼지집" // dummy, 각 VC에서 덮어써서 Custom 하세요.
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.textColor = .white
        $0.numberOfLines = 2 // 2줄로 제한
        $0.textAlignment = .left
        $0.baselineAdjustment = .alignBaselines
    }
    
    let regionLabel = UILabel().then {
        $0.text = "강남구" // dummy 입니다. 각 VC에서 덮어써서 Custom 하세요.
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 1 // 1줄로 제한
        $0.textAlignment = .left
        $0.baselineAdjustment = .alignBaselines
    }
    
    let companyLabel = UILabel().then {
        $0.text = "#가족과 함께💜" // dummy 입니다. 각 VC에서 덮어써서 Custom 하세요.
        $0.font = .systemFont(ofSize: 15, weight: .light)
        $0.textColor = .white
    }
    
    let conditionLabel = UILabel().then {
        $0.text = "#고급 분위기🍷" // dummy 입니다. 각 VC에서 덮어써서 Custom 하세요.
        $0.font = .systemFont(ofSize: 15, weight: .light)
        $0.textColor = .white
    }
    
    let underline = UIView().then {
        $0.backgroundColor = UIColor(red: 226, green: 58, blue: 37, alpha: 1.0)
    }
    
    
    // MARK: - ConfigureUI
    
    
    func addSubViews(){
        addSubview(wrap)
        wrap.addSubview(img)
        wrap.addSubview(titleLabel)
        wrap.addSubview(companyLabel)
        wrap.addSubview(conditionLabel)
        wrap.addSubview(regionLabel)
        wrap.addSubview(underline)
    }
    
    func setConstraints(){
        wrap.snp.makeConstraints{
            $0.edges.centerX.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 353, height: 237))
        }
        
        img.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.bottom.equalToSuperview().inset(25)
            $0.size.equalTo(CGSize(width: 303, height: 60))
        }
        
        companyLabel.snp.makeConstraints{
            $0.top.equalTo(wrap.snp.top).offset(25)
            $0.left.equalTo(wrap.snp.left).offset(25)
        }
        
        conditionLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(25)
            $0.left.equalTo(companyLabel.snp.right).offset(5)
        }
        
        regionLabel.snp.makeConstraints{
            $0.top.equalTo(companyLabel.snp.bottom).offset(50)
            $0.left.equalToSuperview().inset(25)
        }
        
        underline.snp.makeConstraints{
            $0.top.equalTo(regionLabel.snp.bottom).offset(10)
            $0.left.equalTo(regionLabel.snp.left)
            $0.size.equalTo(CGSize(width: 52, height: 7))
        }
    }
}


class ZZinView: UIView {
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Settings
    
    func setView(){
        backgroundColor = .systemGroupedBackground
        
        addSubViews()
        setConstraints()
    }
    
    
    // MARK: - Properties
    
    let wrap = UIView().then {
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .systemBackground
    }
    
    let img = UIImageView().then{
        $0.image = UIImage(named: "ogudangdang.jpeg") // dummy img 입니다. 추후 변경 예정
        $0.layer.cornerRadius = 16
        $0.layer.opacity = 0.4
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
    }
    
    let titleLabel = UILabel().then {
        $0.text = "하남돼지집" // dummy 입니다. 각 VC에서 덮어써서 Custom 하세요.
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.numberOfLines = 0 // 글자 줄 제한 없음
        $0.textAlignment = .left
        $0.baselineAdjustment = .alignBaselines
    }
    
    let descriptionLabel = UILabel().then {
        $0.text = "분위기 좋은 돼지집"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.numberOfLines = 0 // 글자 줄 제한 없음
        $0.textAlignment = .left
        $0.baselineAdjustment = .none
    }
    
    
    // MARK: - Configure UI
    
    
    func addSubViews(){
        addSubview(wrap)
        wrap.addSubview(img)
        wrap.addSubview(descriptionLabel)
        wrap.addSubview(titleLabel)
    }
    
    func setConstraints() {
        wrap.snp.makeConstraints{
            $0.edges.centerX.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 170, height: 228))
        }
        
        img.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.left.bottom.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(12)
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-5)
        }
    }
    
}
