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
    @IBOutlet weak var getStartedStackView: UIStackView!
    @IBOutlet weak var getStartedTitle: UILabel!
    @IBOutlet weak var getStartedSubtitle: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stackView.alpha = 0.0
        fullNameTextField.isHidden = true
        mailTextField.isHidden = true
        passwordTextField.isHidden = true
        registerButton.isHidden = true
        
        mainBackground.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        animationView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        titleLabel.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        
        let animation = Animation.named("movie")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
        
        addRoundShadow(view: getStartedViewBox)
        addRoundShadow(view: getStartedButton)
        addRoundShadow(view: registerButton)
        
        getStartedButton.addTarget(self, action: #selector(getStartedClicked), for: .touchUpInside)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.stackView.alpha = 1.0
        }
    }
    
    @objc func getStartedClicked(_ sender: UIButton) {
        self.fullNameTextField.isHidden = false
        self.mailTextField.isHidden = false
        self.passwordTextField.isHidden = false
        self.registerButton.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.animationView.isHidden = true
            self.getStartedSubtitle.removeFromSuperview()
            self.getStartedButton.removeFromSuperview()
            self.getStartedViewBox.center = self.mainBackground.center
            self.getStartedViewBox.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            self.getStartedStackView.distribution = .fillEqually
            self.getStartedStackView.spacing = 33
            
            
            
            
            
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

