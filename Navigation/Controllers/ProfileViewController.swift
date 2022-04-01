//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController, TapLikedDelegate {
      
    private let profileHeaderView = ProfileHeaderView()
    private let detailedAvatarView: DetailedAvatarView = {
        let avatarView = DetailedAvatarView()
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
        
    var liked: Bool = false
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
   //     tableView.rowHeight = UITableView.automaticDimension
   //     tableView.estimatedRowHeight = 44
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
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.addDataSource()
        self.setupGesture()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   //     tableView.reloadData()
    }
    
    func tapLikedLabel() {
        liked.toggle()
        self.tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Профиль"
        navigationItem.backButtonTitle = ""
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        view.addSubview(detailedAvatarView)
  //      navigationController?.navigationBar.alpha = 0.9
  //      navigationController?.tabBarController?.tabBar.alpha = 0.9
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            detailedAvatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailedAvatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedAvatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailedAvatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailedAvatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addDataSource() {
        dataSource.append(.init(author: "Аркадий Цареградцев", description: "Тот случай, когда фан-арт полностью вышел из под контроля! ", image: "post1", id: "001", likes: 5, views: 5))
        dataSource.append(.init(author: "Займись собой", description: "Мы выросли на их примере, а это не может не радовать", image: "post2", id: "002", likes: 25, views: 50))
        dataSource.append(.init(author: "Kay May", description: "S13 в родном окрасе", image: "post3", id: "003", likes: 10, views: 15))
        dataSource.append(.init(author: "Sport Factor", description: "Тренировки тренировками, а сон по расписанию", image: "post4", id: "004", likes: 52, views: 60))
        dataSource.append(.init(author: "Toyo Tires Russia", description: "Ландин Уильямс получил водительские права больше десяти лет назад, во времена, когда начала выходить серия фильмов «Форсаж». Помимо этого культового кинофильма Ландин «подсел» на не менее культовый японский мультсериал о дрифте Initial D", image: "post5", id: "005", likes: 30, views: 40))
    }
    
    private func setupGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
   //     let viewController = DetailedAvatarViewController()
   //     present(viewController, animated: true)
        UIView.animate(withDuration: 0.5) {
            self.detailedAvatarView.alpha = 1
        }
 //       presentDetailedAvatarViewController()
    }
    
    func presentDetailedAvatarViewController() {
        let secondViewController = DetailedAvatarViewController()
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
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
            cell.likedDelegate = self
                        
            if liked {
                dataSource[indexPath.row - 1].likes += 1
                liked.toggle()
            }
                        
            let article = dataSource[indexPath.row - 1]
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
            viewController.selectedId = dataSource[indexPath.row - 1].id
            dataSource[indexPath.row - 1].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row != 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {
                (contextualAction, view, boolValue) in
                dataSource.remove(at: indexPath.row - 1)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            return swipeActions
        }
        else { return nil }
    }
}

extension ProfileViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AvatarTransitionAnimator(presentationImageView: profileHeaderView.avatarImageView, isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AvatarTransitionAnimator(presentationImageView: profileHeaderView.avatarImageView, isPresenting: false)
    }
}
