//
//  InfoViewController.swift
//  Navigation
//
//  Created by Роман on 13.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        title = "Инфо"
        let button = UIButton(frame: CGRect(x: 130, y: 770, width: 150, height: 40))
        view.addSubview(button)
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(alertClicked), for: .touchUpInside)
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func alertClicked() {
        let alert = UIAlertController(title: "Заголовок", message: "Здесь должно быть сообщение", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
        print("Alert work")
    }

}
