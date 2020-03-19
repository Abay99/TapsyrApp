//
//  MainViewController.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - SampleOnBoardingData
    let onBoardingData: [OnboardingModel] = [
        OnboardingModel(title: "Сортируйте отходы", description: "Ознакомьтесь, что можно сдать и сортируйте отходы дома.", image: "onboarding1"),
        OnboardingModel(title: "Вызовите водителя", description: "Вызовите водителя в удобное для вас время, и получите за это деньги.", image: "onboarding2"),
        OnboardingModel(title: "Помогите планете", description: "Сдавайте мусор на переработку, чтобы сохранить будущее.", image: "onboarding3")
    ]
    
    //MARK: - Properties
    var scrollWidth: CGFloat?
    var scrollHeight: CGFloat?
    
    //MARK: - UIElements
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoTapsyr")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let screenWidth = UIScreen.main.bounds.width
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(hexString: "#0AA8BA")
        pageControl.addTarget(self, action: #selector(pageControlPressed), for: .valueChanged)
        return pageControl
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = UIColor(hexString: "#0AA8BA")
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var accountExistenceLabel: UILabel = {
        let label = UILabel()
        label.text = "Уже есть аккаунт?"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributedText = NSAttributedString(string: "Вход", attributes: attributes)
        let button = UIButton()
        button.setTitleColor(UIColor(hexString: "#0AA8BA"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.titleLabel?.attributedText = attributedText
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.setTitle("Вход", for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountExistenceLabel, loginButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
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
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureOnboarding(datas: onBoardingData)
    }
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    //MARK: - @objc methods
    @objc private func loginButtonPressed() {
        let viewController = LoginViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    @objc private func pageControlPressed() {
        if let scrollWidth = scrollWidth, let scrollHeight = scrollHeight {
            scrollView.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl.currentPage)), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        }
    }
    
    //MARK: - Methods
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let scrollWidth = scrollWidth {
            let page = (scrollView.contentOffset.x)/scrollWidth
            pageControl.currentPage = Int(page)
        }
    }
    
    private func configureOnboarding(datas: [OnboardingModel]) {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        if let scrollWidth = scrollWidth, let scrollHeight = scrollHeight {
            for (index, result) in datas.enumerated() {
                frame.origin.x = scrollWidth * CGFloat(index)
                frame.size = CGSize(width: scrollWidth, height: scrollHeight)
                let view = OnboardingView(frame: frame)
                view.configureItems(model: result)
                scrollView.addSubview(view)
            }
            scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(datas.count), height: scrollHeight)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        [logoImageView, registerButton, stackView, copyRightsLabel, scrollView, pageControl].forEach { (views) in
           view.addSubview(views)
        }
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.width.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).offset(16)
            $0.width.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(pageControl.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        copyRightsLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-16)
        }
    }
}
