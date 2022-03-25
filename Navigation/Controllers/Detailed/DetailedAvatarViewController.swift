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
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var avatarImageCenterXConstraint: NSLayoutConstraint?
    private var avatarImageCenterYConstraint: NSLayoutConstraint?
    private var avatarImageHeightConstraint: NSLayoutConstraint?
    private var avatarImageWidthConstraint: NSLayoutConstraint?
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
    //    setupView()
        
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.setupView()
        } completion: { _ in
            self.detailedAvatar()
        }
    }
    
    private func setupView() {
        view.addSubview(alphaView)
        view.addSubview(closeButton)
        view.addSubview(detailedAvatarImage)
        view.backgroundColor = .clear
        
        avatarImageCenterXConstraint = detailedAvatarImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -1 * (screenWidth * 0.5 - 91))
        avatarImageCenterYConstraint = detailedAvatarImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -1 * (screenHeight * 0.5 - 166))
        avatarImageHeightConstraint = detailedAvatarImage.heightAnchor.constraint(equalToConstant: 150)
        avatarImageWidthConstraint = detailedAvatarImage.widthAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([
            self.avatarImageCenterXConstraint, self.avatarImageCenterYConstraint,
            self.avatarImageHeightConstraint, self.avatarImageWidthConstraint,
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ].compactMap({ $0 }))
    }
    
    private func detailedAvatar() {
        NSLayoutConstraint.deactivate([
            self.avatarImageCenterXConstraint, self.avatarImageCenterYConstraint,
            self.avatarImageHeightConstraint, self.avatarImageWidthConstraint,
        ].compactMap({ $0 }))
        
        avatarImageCenterXConstraint = detailedAvatarImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        avatarImageCenterYConstraint = detailedAvatarImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        avatarImageHeightConstraint = detailedAvatarImage.heightAnchor.constraint(equalToConstant: screenWidth)
        avatarImageWidthConstraint = detailedAvatarImage.widthAnchor.constraint(equalToConstant: screenWidth)
        detailedAvatarImage.layer.cornerRadius = 0
        view.layoutIfNeeded()
        NSLayoutConstraint.activate([
            self.avatarImageCenterXConstraint, self.avatarImageCenterYConstraint,
            self.avatarImageHeightConstraint, self.avatarImageWidthConstraint,
        ].compactMap({ $0 }))
    }
    
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

