//
//  ImLikeIt.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 16.12.2020.
//

import UIKit

@IBDesignable class ImLikeIt: UIControl {
    
    var countLikes: Int = 0 {
        didSet {
            label.text = String(countLikes)
            button.isSelected = self.isLiked
        }
    }
    
    var isLiked: Bool = false {
        didSet {
            button.isSelected = self.isLiked
        }
    }
    
    private var stackView = UIStackView()
    private let button = UIButton(type: .custom)
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
    
        button.setImage(UIImage(systemName: "heart")!, for: .normal)
        button.setImage(UIImage(systemName: "heart.fill")!, for: .selected)
        button.addTarget(self, action: #selector(selectLike(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(button)
        
        label.text = String(self.countLikes)
        stackView.addArrangedSubview(label)
        self.addSubview(stackView)
        
        stackView.spacing = 1
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally

    }
    
    @objc
    private func selectLike(_ sender: UIButton) {
        self.isLiked = !self.isLiked
        self.updateCountLikes()
    }
    
    private func updateCountLikes() {
        self.countLikes = self.isLiked ? self.countLikes + 1 : self.countLikes - 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

}
