//
//  LoginViewController.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    //MARK: - UIElements
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoTapsyr")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var segmentedView: CustomSegmentedControl = {
        let view = CustomSegmentedControl(frame: .zero, buttonTitle: ["Вход", "Регистрация"])
        view.delegate = self
        return view
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = CustomTextField(option: .emailTextField)
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(option: .passwordTextField)
        return textField
    }()
    
    lazy var textFieldtackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField, passwordLabel, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = UIStackView.Distribution.fillProportionally
        return stackView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = UIColor(hexString: "#0AA8BA")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldtackView, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = UIStackView.Distribution.fillProportionally
        return stackView
    }()
    
    lazy var copyRightsLabel: UILabel = {
        let label = UILabel()
        label.text = "©2019 Tapsyr. Все права защищены."
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - @objc methods
    @objc private func nextButtonPressed() {
        let viewController = ProfileViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    //MARK: - Methods
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        [logoImageView, segmentedView, containerStackView, copyRightsLabel].forEach { (views) in
            view.addSubview(views)
        }
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(80)
            $0.centerX.equalToSuperview()
        }
        
        segmentedView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }

        containerStackView.snp.makeConstraints {
            $0.top.equalTo(segmentedView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        copyRightsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-16)
        }
    }
}

extension LoginViewController: CustomSegmentedControlDelegate {
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            containerStackView.isHidden = false
        default:
            containerStackView.isHidden = true
        }
    }
}
