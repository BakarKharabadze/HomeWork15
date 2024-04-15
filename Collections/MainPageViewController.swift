//
//  MainPageViewController.swift
//  Collections
//
//  Created by Bakar Kharabadze on 4/14/24.
//

import UIKit

class MainPageViewController: UIViewController {
    
    //MARK: Properties
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let addButton = UIButton()
    private let backgroundImage = UIImageView()
    private let buttonLabelColor = UIColor(hexString: "#FFFFFF")
    
    var models = [
        Model(title: "Beka ras gverchi?", description: "ახლა გავხსენი დავალება ეს რააარიიი", icon: "icon 1"),
        Model(title: "რამე სიმღერა მირჩიეთ ", description: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა", icon: "icon 2"),
        Model(title: "ფიგმამ თქვენც დაგტანჯათ?", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას", icon: "icon 3"),
        Model(title: "მეტი ბედინა გვინდა", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი", icon: "icon 4")
    ]
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    //MARK: Setup
    private func setup() {
        setupBackgroundImageView()
        setupCollectionView()
        setupAddButton()
    }
    
    private func setupBackgroundImageView() {
        view.addSubview(backgroundImage)
        
        backgroundImage.image = UIImage(named: "Image")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    private func setupCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.itemSize = CGSize(width: 156, height: 192)

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionViewFlowLayout
        collectionView.backgroundColor = .clear.withAlphaComponent(0)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        collectionView.register(NewCardViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42).isActive = true
        addButton.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        addButton.setTitleColor(buttonLabelColor, for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.layer.cornerRadius = 25
        addButton.titleLabel?.font = UIFont(name: "FiraGO-MediumItalic", size: 14)
        addButton.addTarget(self, action: #selector(presentNewCardViewController), for: .touchUpInside)
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewCardViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    @objc private func presentNewCardViewController() {
        let vc = NewCardViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension MainPageViewController: NewCardAddDelegate {
    func add(card: Model) {
        models.append(card)
    }
}


