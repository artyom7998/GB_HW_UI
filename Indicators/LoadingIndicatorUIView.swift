//
//  LoadingIndicatorUIView.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 26.12.2020.
//

import UIKit

@IBDesignable class LoadingIndicatorUIView: UIView {
    
    private var stackView: UIStackView!
    private var circles = [UIImageView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupIndicatior()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupIndicatior()
    }
    
    private func setupIndicatior() {
        
        addCircle()
        stackView = UIStackView(arrangedSubviews: circles)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.frame = CGRect(x: 0, y: 0, width: 80, height: 20)
    
        self.addSubview(stackView)
        
        startIndicator()
    }
    
    func startIndicator() {
        
        // 0 - прозрачный , 1 - нет
        
        UIView.animateKeyframes(withDuration: 3,
                                delay: 0,
                                options: [.repeat],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        
                                                        self.circles[0].alpha = 1.0
                                                        self.circles[1].alpha = 0.0
                                                        self.circles[2].alpha = 0.0
                                       
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        
                                                        self.circles[0].alpha = 0.0
                                                        self.circles[1].alpha = 1.0
                                                        self.circles[2].alpha = 0.0
                              
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        
                                                        self.circles[0].alpha = 0.0
                                                        self.circles[1].alpha = 0.0
                                                        self.circles[2].alpha = 1.0
                
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.circles[0].alpha = 0.0
                                                        self.circles[1].alpha = 0.0
                                                        self.circles[2].alpha = 0.0
                                                       })
                                },
                                completion: nil)
        
    }
    
    func addCircle() {
        let imgView1 = UIImageView()
        imgView1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imgView1.image = UIImage(systemName: "circle.fill")!
        self.circles.append(imgView1)
        
        let imgView2 = UIImageView()
        imgView2.image = UIImage(systemName: "circle.fill")!
        imgView2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.circles.append(imgView2)
        
        let imgView3 = UIImageView()
        imgView3.image = UIImage(systemName: "circle.fill")!
        imgView3.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.circles.append(imgView3)
    }
    
}

