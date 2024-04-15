//
//  NewCardViewController.swift
//  Collections
//
//  Created by Bakar Kharabadze on 4/14/24.
//

import UIKit

protocol NewCardAddDelegate: AnyObject {
    func add(card: Model)
}

class NewCardViewController: UIViewController {
    
    //MARK: Properties
    private let mainStackView = UIStackView()
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let titleTextField = UITextField()
    private let descriptionLabel = UILabel()
    private let descriptionTextField = UITextField()
    private let selectIconLabel = UILabel()
    private let iconStackView = UIStackView()
    private let firstIcon = UIButton()
    private let secondIcon = UIButton()
    private let thirdIcon = UIButton()
    private let forthIcon = UIButton()
    private let addCardButton = UIButton()
    private var selectedIcon: String?
    private let errorLabel = UILabel()
    private let placeholderColor = UIColor(hexString: "#636363")
    weak var delegate: NewCardAddDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Setup
    private func setup() {
        setupBackGroundImage()
        setupMainStackView()
        setupTitleLabel()
        setupTitleTextField()
        setupDescriptionLabel()
        setupDescriptionTextField()
        setupSelectIconLabel()
        setupIconStackView()
        setupErrorLabel()
        setupFirstIcon()
        setupSecondIcon()
        setupThirdIcon()
        setupForthIcon()
        setupAddCardButton()
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 48, left: 32, bottom: 0, right: 32)
        mainStackView.spacing = 10
        mainStackView.setCustomSpacing(11, after: titleTextField)
        mainStackView.setCustomSpacing(40, after: descriptionTextField)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupBackGroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "Image")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        mainStackView.addArrangedSubview(titleLabel)
        
        titleLabel.text = "სათაური"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitleTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: პანიკა, დახმარება მჭირდება",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        titleTextField.leftView = paddingView
        titleTextField.leftViewMode = .always
        titleTextField.layer.borderWidth = 1.5
        titleTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        titleTextField.layer.cornerRadius = 10
        titleTextField.textColor = .white
        titleTextField.font = UIFont.systemFont(ofSize: 12)
        
        mainStackView.addArrangedSubview(titleTextField)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "აღწერა"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupDescriptionTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        descriptionTextField.leftView = paddingView
        descriptionTextField.leftViewMode = .always
        descriptionTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        descriptionTextField.layer.borderWidth = 1.5
        descriptionTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        descriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextField.layer.cornerRadius = 10
        descriptionTextField.textColor = .white
        descriptionTextField.font = UIFont.systemFont(ofSize: 12)
        
        mainStackView.addArrangedSubview(descriptionTextField)
    }
    
    private func setupSelectIconLabel() {
        selectIconLabel.text = "აირჩიეთ აიქონი"
        selectIconLabel.font = UIFont.systemFont(ofSize: 14)
        selectIconLabel.textColor = .white
        
        mainStackView.addArrangedSubview(selectIconLabel)
    }
    
    private func setupIconStackView() {
        mainStackView.addArrangedSubview(iconStackView)
        
        iconStackView.spacing = 28
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.isLayoutMarginsRelativeArrangement = true
        iconStackView.layoutMargins = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
    }
    
    private func setupFirstIcon() {
        let image = UIImage(named: "icon 1")
        firstIcon.setImage(image, for: .normal)
        firstIcon.translatesAutoresizingMaskIntoConstraints = false
        firstIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        firstIcon.contentMode = .scaleAspectFit
        
        let action = UIAction { [weak self] _ in
            self?.selectedIcon = "icon 1"
            self?.buttonDidTap(self?.firstIcon ?? UIButton())
        }
        firstIcon.addAction(action, for: .touchUpInside)
        iconStackView.addArrangedSubview(firstIcon)
    }
    
    private func setupSecondIcon() {
        let image = UIImage(named: "icon 2")
        secondIcon.setImage(image, for: .normal)
        secondIcon.translatesAutoresizingMaskIntoConstraints = false
        secondIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        secondIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let action = UIAction { [weak self] _ in
            self?.selectedIcon = "icon 2"
            self?.buttonDidTap(self?.secondIcon ?? UIButton())
        }
        secondIcon.addAction(action, for: .touchUpInside)
        iconStackView.addArrangedSubview(secondIcon)
        
    }
    
    private func setupThirdIcon() {
        let image = UIImage(named: "icon 3")
        thirdIcon.setImage(image, for: .normal)
        thirdIcon.translatesAutoresizingMaskIntoConstraints = false
        thirdIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thirdIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let action = UIAction { [weak self] _ in
            self?.selectedIcon = "icon 3"
            self?.buttonDidTap(self?.thirdIcon ?? UIButton())
        }
        thirdIcon.addAction(action, for: .touchUpInside)
        iconStackView.addArrangedSubview(thirdIcon)
        
    }
    
    private func setupForthIcon() {
        let image = UIImage(named: "icon 4")
        forthIcon.setImage(image, for: .normal)
        forthIcon.translatesAutoresizingMaskIntoConstraints = false
        forthIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        forthIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let action = UIAction { [weak self] _ in
            self?.selectedIcon = "icon 4"
            self?.buttonDidTap(self?.forthIcon ?? UIButton())
        }
        forthIcon.addAction(action, for: .touchUpInside)
        iconStackView.addArrangedSubview(forthIcon)
    }
    
    private func setupErrorLabel() {
        mainStackView.addArrangedSubview(errorLabel)
        
        errorLabel.text = "სწორად შეავსე, გიყურებ!"
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
    }
    
    private func setupAddCardButton() {
        view.addSubview(addCardButton)
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        addCardButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        addCardButton.widthAnchor.constraint(equalToConstant: 132).isActive = true
        addCardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        addCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122).isActive = true
        addCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 122).isActive = true
        addCardButton.setTitleColor(.white, for: .normal)
        addCardButton.backgroundColor = .systemGreen
        addCardButton.layer.cornerRadius = 25
        addCardButton.setTitle("დამატება", for: .normal)
        addCardButton.titleLabel?.font = UIFont(name: "FiraGO-HeavyItalic", size: 14)
        
        let action = UIAction { [weak self] _ in
            guard let self,
                  let title = titleTextField.text,
                  let description = descriptionTextField.text,
                  let selectedIcon else {
                self?.errorLabel.isHidden = false
                return
            }
            let newCard = Model(title: title, description: description, icon: selectedIcon)
            delegate?.add(card: newCard)
            navigationController?.popViewController(animated: false)
        }
        addCardButton.addAction(action, for: .touchUpInside)
    }
    
    private func buttonDidTap(_ button: UIButton) {
        firstIcon.backgroundColor = .clear
        firstIcon.layer.borderColor = UIColor.black.cgColor
        firstIcon.layer.borderWidth = 0
        firstIcon.layer.cornerRadius = 5
        
        secondIcon.backgroundColor = .clear
        secondIcon.layer.borderColor = UIColor.black.cgColor
        secondIcon.layer.borderWidth = 0
        secondIcon.layer.cornerRadius = 5
        
        thirdIcon.backgroundColor = .clear
        thirdIcon.layer.borderColor = UIColor.white.cgColor
        thirdIcon.layer.borderWidth = 0
        thirdIcon.layer.cornerRadius = 5
        
        forthIcon.backgroundColor = .clear
        forthIcon.layer.borderColor = UIColor.white.cgColor
        forthIcon.layer.borderWidth = 0
        forthIcon.layer.cornerRadius = 5
        
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
    }
}




