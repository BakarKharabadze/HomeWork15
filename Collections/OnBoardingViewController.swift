//
//  ViewController.swift
//  Collections
//
//  Created by Bakar Kharabadze on 4/14/24.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    //MARK: Properties
    private let onboardingImage = UIImageView()
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnboardingImage()
        setupLabel()
        setupButton()
    }
    
    //MARK: Setup
    private func setupOnboardingImage() {
        view.addSubview(onboardingImage)
        
        onboardingImage.image = UIImage(named: "Image 1")
        onboardingImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        onboardingImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        onboardingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        onboardingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        onboardingImage.contentMode = .scaleAspectFill
    }
    
    private func setupLabel() {
        view.addSubview(label)
        
        label.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -238).isActive = true
        label.widthAnchor.constraint(equalToConstant: 264).isActive = true
        label.numberOfLines = 0
    }
    
    private func setupButton() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 124).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        button.setTitle("დაწყება", for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO-HeavyItalic", size: 14)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(presentMainPage), for: .touchUpInside)
    }
    
    @objc private func presentMainPage() {
        navigationController?.pushViewController(MainPageViewController(), animated: false)
    }
}

