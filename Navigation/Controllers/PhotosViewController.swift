//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Роман on 08.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       // imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.alpha = 0
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapSetStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var isExpanded = false
    private let screenWidth = UIScreen.main.bounds.width

    private var collectionDataSource : [CollectionViewModel] = [
        CollectionViewModel(image: "1.jpeg"),
        CollectionViewModel(image: "2.jpeg"),
        CollectionViewModel(image: "3.jpeg"),
        CollectionViewModel(image: "4.jpeg"),
        CollectionViewModel(image: "5.jpeg"),
        CollectionViewModel(image: "6.jpeg"),
        CollectionViewModel(image: "7.jpeg"),
        CollectionViewModel(image: "8.jpeg"),
        CollectionViewModel(image: "9.jpeg"),
        CollectionViewModel(image: "10.jpeg"),
        CollectionViewModel(image: "11.jpeg"),
        CollectionViewModel(image: "12.jpeg"),
        CollectionViewModel(image: "13.jpeg"),
        CollectionViewModel(image: "14.jpeg"),
        CollectionViewModel(image: "15.jpeg"),
        CollectionViewModel(image: "16.jpeg"),
        CollectionViewModel(image: "17.jpeg"),
        CollectionViewModel(image: "18.jpeg"),
        CollectionViewModel(image: "19.jpeg"),
        CollectionViewModel(image: "20.jpeg"),
        CollectionViewModel(image: "21.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        view.addSubview(collectionView)
        view.addSubview(alphaView)
        view.addSubview(photoView)
        photoView.addSubview(photoImageView)
        view.bringSubviewToFront(alphaView)
        view.addSubview(closeButton)
        view.bringSubviewToFront(photoView)
        self.photoView.alpha = 0
        self.alphaView.alpha = 0
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoView.heightAnchor.constraint(equalToConstant: screenWidth),
            photoView.widthAnchor.constraint(equalToConstant: screenWidth),
            photoImageView.topAnchor.constraint(equalTo: photoView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor),
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            alphaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ].compactMap({ $0 }))
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc private func didTapSetStatusButton() {
        UIView.animate(withDuration: 0.5) {
            self.photoView.alpha = 0
            self.alphaView.alpha = 0
            self.closeButton.alpha = 0
        } completion: { _ in
            self.closeButton.isHidden = false
            self.isExpanded = false
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let viewController = DetailedPhotoViewController()
        viewController.selectedImage = collectionDataSource[indexPath.row].image
        present(viewController, animated: true)
   /*     self.isExpanded.toggle()
        self.photoImageView.image = UIImage(named: String(indexPath.row + 1) + ".jpeg")
        UIView.animate(withDuration: 0.5) {
            self.photoView.alpha = 1
            self.alphaView.alpha = 0.7
            self.view.layoutIfNeeded()
        } completion: { _ in
        }
        if self.isExpanded {
            self.alphaView.isHidden = false
            self.closeButton.isHidden = false
        }
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        } completion: { _ in
            self.closeButton.isHidden = false
        }   */
    }
}

