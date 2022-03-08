//
//  PostViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemGray3
        let myPost = Post()
        let titleLabel = UILabel()
        titleLabel.text = myPost.title
        title = titleLabel.text
        navigationItem.backButtonTitle = "Назад"
        let infoImage = UIImage(named: "info")
        let infoButton = UIBarButtonItem(image: infoImage, style: .plain, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = infoButton
    }
        
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }

}
