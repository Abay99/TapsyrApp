//
//  CustomSegmentedControl.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/19/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate: class {
    func changeToIndex(index:Int)
}

class CustomSegmentedControl: UIView {
    
    //MARK: - Properties
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    
    var textColor: UIColor = #colorLiteral(red: 0.818418622, green: 0.854342401, blue: 0.8959576488, alpha: 1)
    var selectorViewColor: UIColor = UIColor(hexString: "#0AA8BA")
    var selectorTextColor: UIColor = .black
    
    public private(set) var selectedIndex : Int =  1
    
    //MARK: - CustomSegmentedControlDelegate
    weak var delegate: CustomSegmentedControlDelegate?
    
    //MARK: - UIElements
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var selectorView: UIView = {
        let selectorWidth = frame.width/2
        let view = UIView(frame: CGRect(x: 0 , y: self.frame.height, width: selectorWidth, height: 2))
        view.backgroundColor = selectorViewColor
        return view
    }()
    
    //MARK: - Initializers
    convenience init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.white
        updateView()
    }
    
    //MARK: - Methods
    func setButtonTitles(buttonTitles:[String]) {
        self.buttonTitles = buttonTitles
    }
    
    func setIndex(index: Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    //MARK: - @objc methods
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            if button == sender {
                selectedIndex = buttonIndex
                delegate?.changeToIndex(index: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = button.frame.origin.x
                    self.selectorView.frame.size.width = button.frame.size.width
                }
                button.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}

//MARK: - ConfigurationView
extension CustomSegmentedControl {
    private func updateView() {
        createButton()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        [stackView, selectorView].forEach { (views) in
            addSubview(views)
        }
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({ $0.removeFromSuperview() })
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}
