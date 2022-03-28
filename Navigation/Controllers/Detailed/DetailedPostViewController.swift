//
//  DetailedPostViewController.swift
//  Navigation
//
//  Created by Роман on 23.03.2022.
//

import UIKit

class DetailedPostViewController: UIViewController {
    
    var likedDelegate: TapLikedDelegate?
    
//    var tempCountLiked: Int?
        
    var selectedDataAuthor, selectedDataDescription, selectedDataImage: String?
    var selectedDataLikes, selectedDataViews: Int?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

     lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let likes = selectedDataLikes {
            label.text = "Likes: " + String(likes)
        }
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .black
        
     //   let tap = UITapGestureRecognizer(target: self, action: #selector(tapLiked))
     //    label.addGestureRecognizer(tap)

        label.isUserInteractionEnabled = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let views = selectedDataViews {
            label.text = "Views: " + String(views)
        }
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupGesture()
    }
    
    func likeLabelCount() -> Int? {
        guard let tempCountLiked = Int(self.likesLabel.text!.dropFirst(7)) else { return nil}
        print(tempCountLiked)
        return tempCountLiked
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Запись"
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackViewPost)
        stackViewPost.addArrangedSubview(authorLabel)
        stackViewPost.addArrangedSubview(imageImageView)
        stackViewPost.addArrangedSubview(descriptionLabel)
        stackViewPost.addArrangedSubview(stackViewLikesViews)
        stackViewLikesViews.addArrangedSubview(likesLabel)
        stackViewLikesViews.addArrangedSubview(viewsLabel)
        
    //    scrollView.isUserInteractionEnabled = false
    //    contentView.isUserInteractionEnabled = false
        view.bringSubviewToFront(stackViewLikesViews)

        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
       
            stackViewPost.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackViewPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackViewPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            stackViewPost.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6)
        ])
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.tapLiked(_ :)))
        self.likesLabel.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    @objc func tapLiked(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
       
        likedDelegate?.tapLikedLabel()
        print("200394")
        guard let newCount = Int(self.likesLabel.text!.dropFirst(7)) else { return }
        self.likesLabel.text = "Likes: " + String(newCount + 1)
        likesLabel.layoutIfNeeded()
        
    }
}
