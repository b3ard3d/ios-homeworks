//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Роман on 08.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = arrow
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private lazy var photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    private lazy var firstImageView: UIImageView = {
        let image = UIImage(named: "1.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
       
    private lazy var secondImageView: UIImageView = {
        let image = UIImage(named: "2.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let image = UIImage(named: "3.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    
    private lazy var fourImageView: UIImageView = {
        let image = UIImage(named: "4.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        contentView.addSubview(backView)
        backView.addSubview(collectionLabel)
        backView.addSubview(arrowImageView)
        backView.addSubview(photosStackView)
        photosStackView.addArrangedSubview(firstImageView)
        photosStackView.addArrangedSubview(secondImageView)
        photosStackView.addArrangedSubview(thirdImageView)
        photosStackView.addArrangedSubview(fourImageView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12.0),
            collectionLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12.0),
            arrowImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12.0),
            arrowImageView.centerYAnchor.constraint(equalTo: collectionLabel.centerYAnchor),
            arrowImageView.heightAnchor.constraint(equalTo: collectionLabel.heightAnchor),
            arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor, multiplier: 1.0),
            photosStackView.topAnchor.constraint(equalTo: collectionLabel.bottomAnchor, constant: 12.0),
            photosStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12.0),
            photosStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12.0),
            photosStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12.0),
            firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor, multiplier: 1.0)
        ])
    }
}
