//
//  ProfileView.swift
//  Navigation
//
//  Created by Роман on 08.02.2022.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    private func setupView() {
        let view = self.loadViewFromXib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        self.nameLabel.text = "Роман"
        self.birthDateLabel.text = "25.06.1988"
        self.cityLabel.text = "Ишимбай"
        self.infoTextView.text = "В детстве был благовоспитанным мальчиком, связался с пиратами, пошел учиться кодить, и покатился… Характер мягкий. Не женат."
    }
    
    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?.first as? UIView else { return UIView() }
        return view
    }
    
}
