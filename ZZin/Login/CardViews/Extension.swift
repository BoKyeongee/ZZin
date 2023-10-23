//
//  Extension.swift
//  ZZin
//
//  Created by Jack Lee on 2023/10/18.
//

import UIKit

extension UIView {
    // MARK: - 지정된 View에게 특정 색상을 활용한 컬러의 그림자를 적용한다. offset & opacity
    func applyShadow(radius: CGFloat,
                     opacity: Float,
                     offset: CGSize,
                     color: UIColor = .black) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
    // MARK: - view의 네가지 꼭지점에 값을 고정하여 view가 이동하더라도 view의 전체적인 틀이 변형되지 않도록
    //  @discardableResult이 친구는 어떤 역할을 하는 친구일까?
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat = 0,
                height: CGFloat = 0) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        if height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        anchors.forEach { $0.isActive = true }
        
        return anchors
    }
    
    @discardableResult
    func anchorToSuperview() -> [NSLayoutConstraint] {
        return anchor(top: superview?.topAnchor,
                      left: superview?.leftAnchor,
                      bottom: superview?.bottomAnchor,
                      right: superview?.rightAnchor)
    }
}

extension NSAttributedString.Key {
    static var overlayAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold",
                                                                                                       size: 42)!,
                                                                   NSAttributedString.Key.kern: 5.0]
    
    static var shadowAttribute: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        shadow.shadowBlurRadius = 2
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
        return shadow
    }()
    
    static var titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute]
}

extension UIColor {
    static var sampleRed = UIColor(red: 252/255, green: 70/255, blue: 93/255, alpha: 1)
    static var sampleBlue = UIColor(red: 52/255, green: 154/255, blue: 254/255, alpha: 1)
}