//
//  ContactsTableViewCell.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 22.04.2022.
//

import UIKit

typealias ContactsTableViewCellConfigurator = TableCellConfigurator<ContactsTableViewCell, User>
class ContactsTableViewCell: UITableViewCell, ConfigurableCell {
    typealias DataType = User
    var viewModel = ViewModel()
    var isMyFriend = true
    private let profileImage : UIImageView = {
        let profileImage = UIImageView()
        profileImage.layer.cornerRadius = 24
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.masksToBounds = false
        profileImage.clipsToBounds = true
        return profileImage
    }()
    
    private let statusView : UIView = {
        let statusView = UIView()
        statusView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 10)
        statusView.layer.cornerRadius = 6
        statusView.layer.borderWidth = 2
        statusView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        statusView.layer.masksToBounds = false
        statusView.clipsToBounds = true
        return statusView
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .label
        return label
    }()
    
    private let followersLabel : UILabel = {
        let followersLabel = UILabel()
        followersLabel.font = UIFont.systemFont(ofSize: 13)
        followersLabel.textColor = .secondaryLabel
        return followersLabel
    }()
    
    private lazy var stackLabel : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, followersLabel])
        stack.spacing = 2
        stack.alignment = .leading
        stack.axis = .vertical
        return stack
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("ADD".locolized(), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 122/255, blue: 1, alpha: 1), for: .normal)
        button.imageEdgeInsets.left = -2
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        button.layer.borderColor = CGColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(profileImage, stackLabel, statusView, addButton)
        addButton.addTarget(nil, action: #selector(addButtonPressed), for: .touchUpInside)
        setupConstraints()
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: User) {
        isMyFriend = data.isMyFriend
        profileImage.image = data.profileImage
        userNameLabel.text = data.userName
        followersLabel.text = "\(data.numberOfFriends)"
        if data.isOnline {
            statusView.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
        } else {
            statusView.backgroundColor = .quaternaryLabel
        }
    }
    
    @objc private func addButtonPressed() {
        viewModel.addButtonPressed(isMyFriend: isMyFriend)
        isMyFriend = !isMyFriend
    }
    
    func bindViewModel() {
        viewModel.titleText.bind { titleText in
            DispatchQueue.main.async {
                self.addButton.setTitle(titleText, for: .normal)
            }
        }
        viewModel.titleColor.bind { titleColor in
            self.addButton.setTitleColor(titleColor, for: .normal)
        }
        viewModel.backgroundColor.bind { backgroundColor in
            self.addButton.backgroundColor = backgroundColor
        }
        viewModel.image.bind { image in
            self.addButton.setImage(image, for: .normal)
        }
        viewModel.borderColor.bind { borderColor in
            self.addButton.layer.borderColor = borderColor
        }
    }
    
    private func setupConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
            make.width.height.equalTo(48)
        }
        statusView.snp.makeConstraints { make in
            make.trailing.equalTo(profileImage).offset(2)
            make.bottom.equalTo(profileImage).offset(2)
            make.width.height.equalTo(14)
        }
        stackLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    

}
