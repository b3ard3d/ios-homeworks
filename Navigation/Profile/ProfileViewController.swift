//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .systemGray6
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.backgroundColor = .clear
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    /*    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
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
    }()     */
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Новая кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var heightConstraint: NSLayoutConstraint?
    
    private var dataSource: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.addDataSource()
        
   //     self.tableView.rowHeight = UITableView.automaticDimension;
    //    self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
        
    //    self.tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: (0, 0))
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
  //      self.view.addSubview(self.photosLabel)
  //      self.view.addSubview(self.collectionView)
        self.view.addSubview(self.tableView)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 245)
        let bottomNewButtonConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingNewButtonConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingNewButtonConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightNewButtonConstraint = self.newButton.heightAnchor.constraint(equalToConstant: 50)
       
        /*      let topPhotosLabel = self.photosLabel.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 12)
        let leftPhotosLabel = self.photosLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12)
        let rightPhotosLabel = self.photosLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let heightPhotosLabel = self.photosLabel.heightAnchor.constraint(equalToConstant: 24)
        
        let topCollectionView = self.collectionView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12)
        let leftCollectionView = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12)
        let rightCollectionView = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12)
        let heightCollectionView = self.collectionView.heightAnchor.constraint(equalToConstant: 100)
        
        let topTableView = self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor)       */
        
        let topTableView = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 12)
        let leftTableView = self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightTableView = self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let bottomTableView = self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        self.newButton.isHidden = true
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, self.heightConstraint,
            bottomNewButtonConstraint, leadingNewButtonConstraint,
            trailingNewButtonConstraint, heightNewButtonConstraint,
            topTableView, leftTableView, rightTableView, bottomTableView,
        ].compactMap({ $0 }))
    }
    
    private func addDataSource() {
        self.dataSource.append(.init(author: "Аркадий Цареградцев", description: "Тот случай, когда фан-арт полностью вышел из под контроля! ", image: "post1", likes: 5, views: 5))
        self.dataSource.append(.init(author: "Займись собой", description: "Мы выросли на их примере, а это не может не радовать", image: "post2", likes: 25, views: 50))
        self.dataSource.append(.init(author: "Kay May", description: "S13 в родном окрасе", image: "post3", likes: 10, views: 15))
        self.dataSource.append(.init(author: "Sport Factor", description: "Тренировки тренировками, а сон по расписанию", image: "post4", likes: 52, views: 60))
    }
    
    private func sizeForItemAt() {
   
    }
    
   
}
    
extension ProfileViewController: ProfileHeaderViewProtocol {
    
    func didTapShowStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 300 : 245
        UIView.animate(withDuration: 0.3, delay: 0.1) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    //    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            let article = self.dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        image: article.image,
                                                        description: article.description,
                                                        likes: article.likes,
                                                        views: article.views)
            cell.setup(with: viewModel)
            return cell
        }
    }
    
    
}

/*
 
 
 

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
 //    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
     if indexPath.row == 0 {
         
     }
     
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
         let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
         return cell
     }
     let article = self.dataSource[indexPath.row]
     let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                 image: article.image,
                                                 description: article.description,
                                                 likes: article.likes,
                                                 views: article.views)
     cell.setup(with: viewModel)
     return cell
 }
}
 
 
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
}       */
