//
//  ViewController.swift
//  Thesis_Animation
//
//  Created by Emre Dogan on 28/04/2022.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet var mainBackground: UIView!
    @IBOutlet weak var titleLabel: UIView!
    @IBOutlet weak var getStartedViewBox: UIView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stackView.alpha = 0.0
        mainBackground.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        animationView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        titleLabel.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
    
        let animation = Animation.named("movie")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
        
        addRoundShadow(view: getStartedViewBox)
        addRoundShadow(view: getStartedButton)
        
        getStartedButton.addTarget(self, action: #selector(getStartedClicked), for: .touchUpInside)



    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
                self.stackView.alpha = 1.0
            }
    }
    
    @objc func getStartedClicked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.animationView.isHidden = true
            
            while let subview = self.getStartedViewBox.subviews.last {
                subview.removeFromSuperview()
            }
            self.getStartedViewBox.center = self.mainBackground.center
            self.getStartedViewBox.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        })
    }
    
    func addRoundShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 10
    }
    
    
    


}

