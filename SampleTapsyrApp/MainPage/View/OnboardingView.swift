//
//  OnboardingView.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit

class OnboardingView: UIView {

    //MARK: - UIElements
    
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoTapsyr")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var wasteSortingLabel: UILabel = {
        let label = UILabel()
        label.text = "Сортируйте отходы"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Ознакомьтесь, что можно сдать и сортируйте отходы дома"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    public func configureItems(model: OnboardingModel){
        if let image = model.image {
            mainImageView.image = UIImage(named: image)
            wasteSortingLabel.text = model.title
            descriptionLabel.text = model.description
        }
    }
    
    private func setupViews() {
        [mainImageView, wasteSortingLabel, descriptionLabel].forEach { (views) in
            addSubview(views)
        }
    }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        wasteSortingLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(wasteSortingLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
}
