//
//  FeedViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var oneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Жесты и анимация", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.buttonOneClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var twoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вторая кнопка", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        title = "Лента"
        self.drawSelf()
    }
    
    private func drawSelf() {
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(oneButton)
        self.stackView.addArrangedSubview(twoButton)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
        
    @objc func buttonOneClicked() {
        let gesturesAndAnimationsViewController = GesturesAndAnimationsViewController()
        navigationController?.pushViewController(gesturesAndAnimationsViewController, animated: true)
    }
    
    @objc func buttonClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

struct Post {
    let title: String = "Мой пост"
}
