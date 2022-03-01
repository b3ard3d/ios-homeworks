//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Роман on 27.02.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
  //      self.addDataSource()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Photos"
    }
    
    private func setupView() {
        
        
        self.view.addSubview(self.collectionView)
        
        let topCollectionViewConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leftCollectionViewConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightCollectionViewConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomCollectionViewConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topCollectionViewConstraint, leftCollectionViewConstraint,
            rightCollectionViewConstraint, bottomCollectionViewConstraint
        ].compactMap({ $0 }))
    }
}
    
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
}
