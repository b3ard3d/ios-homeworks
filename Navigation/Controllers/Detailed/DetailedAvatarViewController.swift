//
//  DetailedAvatarViewController.swift
//  Navigation
//
//  Created by Роман on 24.03.2022.
//

import UIKit

class DetailedAvatarViewController: UIViewController {
        
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.9
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var detailedAvatarImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let screenWidth = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(alphaView)
        view.addSubview(closeButton)
        view.addSubview(detailedAvatarImage)
        view.backgroundColor = .clear
        
        NSLayoutConstraint.activate([

           detailedAvatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailedAvatarImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailedAvatarImage.heightAnchor.constraint(equalToConstant: screenWidth),
            detailedAvatarImage.widthAnchor.constraint(equalToConstant: screenWidth),
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

