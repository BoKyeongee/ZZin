//
//  CustomTextfieldView.swift
//  ZZin
//
//  Created by Jack Lee on 2023/10/24.
//

import UIKit
import SnapKit
import Then

class CustomTextfieldView: UIView {
    
    let animatingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let textfield = UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.keyboardType = .default
    }
    
    let validationLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.textColor = UIColor.init(hexCode: "F55951")
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
    }

    let cancelButton = UIButton().then {
        let image = UIImage(systemName: "x.circle")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.imageView?.tintColor = .systemGray
        $0.isHidden = true
        $0.setImage(image, for: .normal)
        $0.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
    }
    
    let secureButton = UIButton().then {
        let image = UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let selectedImage = UIImage(systemName: "eye.slash")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.setImage(selectedImage, for: .selected)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
    }

    init(placeholder: String, text: String) {
        super.init(frame: .zero)
        textfield.placeholder = placeholder
        animatingLabel.text = text
        
        configure()
        setUI()
    }
    
    init(placeholder: String, text: String, alertMessage: String? = "다시 확인해주세요", hasEyeButton: Bool) {
        super.init(frame: .zero)
        textfield.placeholder = placeholder
        animatingLabel.text = text
        validationLabel.text = alertMessage
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
        
        configure()
        setUI()
        
        if hasEyeButton {
            addEyeButton()
        } else {
            addCancelButton()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
}

extension CustomTextfieldView {
    func configure() {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 12
        [animatingLabel, textfield, validationLabel].forEach{ addSubview($0) }
    }

    func setUI() {
        animatingLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
        }
        
        validationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.leading.equalToSuperview().inset(5)
        }

        textfield.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
        }
    }
    
    // Label Animation 적용
    func labelAnimation() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0) {
            self.backgroundColor = .white
            self.animatingLabel.textColor = .green
            self.layer.borderWidth = 1
            self.layer.borderColor = self.animatingLabel.textColor.cgColor

            //Animation 적용시 이동 범위
            let movement = CGAffineTransform(translationX: -8, y: -24)
            let scale = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.animatingLabel.transform = movement.concatenating(scale)

        //Animation 이후 행동
        } completion: { position in
            self.textfield.isHidden = false
            self.textfield.becomeFirstResponder()
            
            self.cancelButton.isHidden = false
        }
    }
    
    // Label Animation을 되돌리는 함수
    private func undo() {
        let movement = UIViewPropertyAnimator(duration: 0.1, curve: .linear) {
            self.backgroundColor = .systemGray5
            self.animatingLabel.textColor = .systemGray
            self.layer.borderWidth = 0
            self.layer.borderColor = UIColor.clear.cgColor

            // visibility
            self.textfield.text = ""
            self.textfield.isHidden = true
            self.cancelButton.isHidden = true

            // movement
            self.animatingLabel.transform = .identity
        }
        movement.startAnimation()
    }
    
    func validateEmail(_ email: String) -> Bool {
        // 이메일 형식이 맞는지 확인
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailpred = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if let emailText = textfield.text, !emailText.isEmpty {
            return emailpred.evaluate(with: email)
        }
        return false
    }
    
    func showInvalidMessage() {
        self.validationLabel.isHidden = false
        self.animatingLabel.isHidden = true
        self.layer.borderColor = UIColor.init(hexCode: "F55951").cgColor
        self.textfield.tintColor = UIColor.init(hexCode: "F55951")
    }
    
    func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.textfield.delegate = delegate
    }
    
    func addEyeButton() {
        addSubview(secureButton)
        self.secureButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.height.width.equalTo(30)
        }
    }
    
    func addCancelButton() {
        addSubview(cancelButton)
        cancelButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.height.width.equalTo(30)
        }
    }

    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            print("탭이 눌렸습니다.")
            labelAnimation()
        }
    }
    
    @objc func cancelTapped(_ sender: UIButton) {
        textfield.resignFirstResponder()
        undo()
    }
    
    @objc func secureButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            textfield.isSecureTextEntry = true
            print("비밀번호가 숨겨졌습니다.")
        } else {
            textfield.isSecureTextEntry = false
            print("숨겨진 비밀번호가 해제됐습니다.")
        }
        // 왜 sender 값에 따라 설정하는 방식은 안될까?
//        if sender.isSelected {
//            self.textfield.isSecureTextEntry = true
//        }
    }
}
