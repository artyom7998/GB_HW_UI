//
//  GraphicsViewController.swift
//  GB_UserUI_ClientVK
//
//  Created by Артем Зарудный on 13.12.2020.
//

import UIKit

class GraphicsViewController: UIViewController {
    
    @IBInspectable var borderWidth: CGFloat = 4.0
    let myNewView = NewView(frame: CGRect(x: 30.0, y: 30.0, width: 100.0, height: 100.0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(myNewView)
        myNewView.backgroundColor = .white
        myNewView.layer.borderWidth = 4.0
        myNewView.layer.borderColor = UIColor.black.cgColor
        myNewView.layer.cornerRadius = 10.0
        myNewView.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class NewView: UIView {
    
        @IBInspectable var somePoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        @IBInspectable var radius: CGFloat = 10 {
            didSet {
                setNeedsDisplay()
            }
        }
        
        override func draw(_ rect: CGRect) {
                super.draw(rect)
                guard let context = UIGraphicsGetCurrentContext() else { return }

                context.setFillColor(UIColor.red.cgColor)
                context.fillEllipse(in: CGRect(x: rect.midX - radius,
                                               y: rect.midY - radius,
                                               width: radius * 2,
                                               height: radius * 2))
                
            }
        
    }
