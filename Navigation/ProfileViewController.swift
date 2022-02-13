//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        title = "Профиль"
    }
}
