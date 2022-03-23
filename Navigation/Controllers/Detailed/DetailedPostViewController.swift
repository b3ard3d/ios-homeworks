//
//  DetailedPostViewController.swift
//  Navigation
//
//  Created by Роман on 23.03.2022.
//

import UIKit

class DetailedPostViewController: UIViewController {
    
    var selectedDataAuthor, selectedDataDescription, selectedDataImage: String?
    var selectedDataLikes, selectedDataViews: Int?
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.7
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        if let text = selectedDataAuthor {
            label.text = text
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageImageView: UIImageView = {
        let imageView = UIImageView()
        if let image = selectedDataImage {
            imageView.image = UIImage(named: image)
        }
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .white
        if let text = selectedDataDescription {
            label.text = text
        }
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let likes = selectedDataLikes {
            label.text = "Likes: " + String(likes)
        }
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let views = selectedDataViews {
            label.text = "Views: " + String(views)
        }
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapSetButton), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(alphaView)
        view.addSubview(closeButton)
        view.addSubview(authorLabel)
        view.addSubview(imageImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(stackViewLikesViews)
        stackViewLikesViews.addArrangedSubview(likesLabel)
        stackViewLikesViews.addArrangedSubview(viewsLabel)
        view.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            imageImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            imageImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            imageImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: imageImageView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: imageImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            stackViewLikesViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            stackViewLikesViews.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackViewLikesViews.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
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
    
    @objc private func didTapSetButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
