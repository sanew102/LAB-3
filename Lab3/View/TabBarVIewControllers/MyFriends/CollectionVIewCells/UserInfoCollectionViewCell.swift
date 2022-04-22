//
//  UserInfoCollectionViewCell.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 19.04.2022.
//

import UIKit
struct Statics {
    static let fullNameFont = UIFont(name: "Helvetica", size: 16)
    static let professionFont = UIFont(name: "Helvetica", size: 12)
    static let professionColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
    static let onlineColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
    static let offlineColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.18)
}

class UserInfoCollectionViewCell: UICollectionViewCell {
    
    let profileImageView : UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = User.users[0].profileImage
        profileImageView.layer.cornerRadius = 50
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.masksToBounds = false
        profileImageView.clipsToBounds = true
        return profileImageView
    }()
    
    private let fullName : UILabel = {
        let fullName = UILabel()
        fullName.font = Statics.fullNameFont
        fullName.textAlignment = .center
        fullName.numberOfLines = 0
        fullName.textColor = .label
        return fullName
    }()
    
    private let isOnlineView : UIView = {
        let view = UIView()
        view.backgroundColor = .quaternaryLabel
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [isOnlineView, fullName])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    let profession : UILabel = {
        let profession = UILabel()
        profession.text = User.users[0].profession
        profession.font = Statics.professionFont
        profession.textColor = .secondaryLabel
        return profession
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    fileprivate func setupCell() {
        backgroundColor = .systemBackground
        contentView.addSubviews(profileImageView, stackView, profession)
        layer.cornerRadius = 20
        layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.12)
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
    }
    
    func setProps(fullName: String, isOnline: Bool, profession: String, image: UIImage) {
        self.fullName.text = fullName
        self.profession.text = profession
        self.profileImageView.image = image
        if isOnline {
            isOnlineView.backgroundColor = Statics.onlineColor
        }
    }
    
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.height.width.equalTo(100)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(19)
            make.leading.equalToSuperview().offset(18.5)
            make.trailing.equalToSuperview().offset(-18.5)
        }
        isOnlineView.snp.makeConstraints { make in
            make.width.height.equalTo(10)
        }
        profession.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

