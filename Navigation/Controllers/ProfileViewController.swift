//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
  
    private let profileHeaderView = ProfileHeaderView()
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
        
    private var dataSource: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.addDataSource()
        self.setupGesture()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addDataSource() {
        self.dataSource.append(.init(author: "Аркадий Цареградцев", description: "Тот случай, когда фан-арт полностью вышел из под контроля! ", image: "post1", likes: 5, views: 5))
        self.dataSource.append(.init(author: "Займись собой", description: "Мы выросли на их примере, а это не может не радовать", image: "post2", likes: 25, views: 50))
        self.dataSource.append(.init(author: "Kay May", description: "S13 в родном окрасе", image: "post3", likes: 10, views: 15))
        self.dataSource.append(.init(author: "Sport Factor", description: "Тренировки тренировками, а сон по расписанию", image: "post4", likes: 52, views: 60))
    }
    
    private func setupGesture() {
        
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        profileHeaderView.statusLabel.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
       
        print("111111111")
        
        profileHeaderView.avatarImageView.layer.borderColor = UIColor.black.cgColor
        profileHeaderView.avatarImageView.image = UIImage(named: "logo")
   //     profileHeaderView.backgroundColor = .systemBlue
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            cell.selectionStyle = .none
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let viewController = DetailedPostViewController()
            viewController.selectedDataImage = dataSource[indexPath.row - 1].image
            viewController.selectedDataLikes = dataSource[indexPath.row - 1].likes
            viewController.selectedDataViews = dataSource[indexPath.row - 1].views + 1
            viewController.selectedDataAuthor = dataSource[indexPath.row - 1].author
            viewController.selectedDataDescription = dataSource[indexPath.row - 1].description
            dataSource[indexPath.row - 1].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
            present(viewController, animated: true)

            
      //      present(viewController, animated: true)
      /*      guard let heightCellConstraint = tableView.cellForRow(at: indexPath)?.heightAnchor
            else {return}
            NSLayoutConstraint.activate([
                postView.heightAnchor.constraint(equalTo: heightCellConstraint)
            ])
            
            
            

            
            self.authorLabel.text = dataSource[indexPath.row - 1].author
            self.imageImageView.image = UIImage(named: dataSource[indexPath.row - 1].image)
            self.descriptionLabel.text = dataSource[indexPath.row - 1].description
            self.likesLabel.text = "Likes: " + String(dataSource[indexPath.row - 1].likes)
            self.viewsLabel.text = "Views: " + String(dataSource[indexPath.row - 1].views + 1)
            
            dataSource[indexPath.row - 1].views += 1
            
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            
            UIView.animate(withDuration: 0.5) {
                self.postView.alpha = 1
                self.alphaView.alpha = 0.7
                self.closeButton.alpha = 1
            } completion: { _ in
            }       */
        }
    }
    
/*    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let place = dataSource[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
               configuration.performsFirstActionWithFullSwipe = true
        tableView.reloadData()
        return configuration
        
        
    }       */
    
/*    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let place = dataSource[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {
            (contextualAction, view, boolValue) in
                
            self.dataSource.removeAll(where:{ $0 == place })
           //     self.dataSource.remove(at: indexPath.row)
         //       StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
      //  tableView.reloadData()
        
        return swipeActions
        
    }           */
    
    
}
