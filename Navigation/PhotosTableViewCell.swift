//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Роман on 26.02.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        label.text = "Photos"
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var titleTabLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        label.text = "->"
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .systemBlue
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
   /*     self.authorLabel.text = nil
        self.imageImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil  */
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackViews)
        self.stackViews.addArrangedSubview(self.titleLabel)
        self.stackViews.addArrangedSubview(self.titleTabLabel)
        self.backView.addSubview(self.collectionView)
        self.setupConstraints()
        
        
    }
    
    private func setupConstraints() {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let topStackViewConstraint = self.stackViews.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leftStackViewConstraint = self.stackViews.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let rightStackViewConstraint = self.stackViews.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let heightStackViewConstraint = self.stackViews.heightAnchor.constraint(equalToConstant: 48)

        let topCollectionViewConstraint = self.collectionView.topAnchor.constraint(equalTo: self.stackViews.bottomAnchor)
        let leftCollectionViewConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let rightCollectionViewConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let bottomCollectionViewConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint,
            topStackViewConstraint, leftStackViewConstraint, rightStackViewConstraint,
            heightStackViewConstraint, topCollectionViewConstraint,
            leftCollectionViewConstraint, rightCollectionViewConstraint,
            bottomCollectionViewConstraint
        ])
    }
    
    
    
/*    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }   */

}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
}
