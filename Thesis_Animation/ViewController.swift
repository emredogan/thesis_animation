//
//  ViewController.swift
//  Thesis_Animation
//
//  Created by Emre Dogan on 28/04/2022.
//

import UIKit
import Lottie

class ViewController: UIViewController, UITextFieldDelegate, CAAnimationDelegate {
    
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
    
    
    func setBackgroundColor() {
        mainBackground.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        animationView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        
        titleLabel.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
    }
    
    func setInitialView() {
        self.stackView.alpha = 0.0
        fullNameTextField.isHidden = true
        mailTextField.isHidden = true
        passwordTextField.isHidden = true
        registerButton.isHidden = true
        
        addRoundShadow(view: getStartedViewBox)
        addRoundShadow(view: getStartedButton)
        addRoundShadow(view: registerButton)
    }
    
    func playAnimation() {
        let animation = Animation.named("movie")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.delegate = self
        mailTextField.delegate = self
        passwordTextField.delegate = self
        
        setInitialView()
        setBackgroundColor()
        playAnimation()
        
        getStartedButton.addTarget(self, action: #selector(getStartedClicked), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerClicked), for: .touchUpInside)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.stackView.alpha = 1.0
        }
    }
    
    @objc func registerClicked(_ sender: UIButton) {
        print("REGISTER PRESSED")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        //collectionViewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(collectionViewController, animated: true)
                
        
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height, width: textField.frame.width, height: CGFloat(1))
        bottomLine.backgroundColor = UIColor.systemBlue.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.sublayers = nil
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.addSublayer(bottomLine)
        
    }

}

