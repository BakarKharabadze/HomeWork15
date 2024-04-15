//
//  NewCardViewCell.swift
//  Collections
//
//  Created by Bakar Kharabadze on 4/14/24.
//

import UIKit

class NewCardViewCell: UICollectionViewCell {
    
    //MARK: Properties
    private let mainStackView = UIStackView()
    private let iconImage = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let cellBackGroundColor = UIColor(hexString: "#262A34")
    private let descriptionLabelColor = UIColor(hexString: "#5E6272")
    
    //MARK: life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainStackView()
        setupIconImage()
        setuptitleLabel()
        setupDescriptionLabel()
        
        mainStackView.setCustomSpacing(12, after: iconImage)
        mainStackView.setCustomSpacing(5, after: titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    private func setupMainStackView() {
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.alignment = .leading
        mainStackView.layoutMargins = UIEdgeInsets(top: 33, left: 24, bottom: 15, right: 24)
        
        mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundColor = cellBackGroundColor
        layer.cornerRadius = 10
    }
    
    private func setupIconImage() {
        mainStackView.addArrangedSubview(iconImage)
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    private func setuptitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 116).isActive = true
        titleLabel.numberOfLines = 0
        
        mainStackView.addArrangedSubview(titleLabel)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.widthAnchor.constraint(equalToConstant: 116).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = descriptionLabelColor
        
        mainStackView.addArrangedSubview(descriptionLabel)
    }
    
    func configure(with model: Model ) {
        titleLabel.text = model.title
        iconImage.image = UIImage(named: model.icon)
        descriptionLabel.text = model.description
    }
}
