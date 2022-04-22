//
//  ByUserNameTableViewCell.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 20.04.2022.
//

import UIKit

typealias ByUserNameTableViewCellConfigurator = TableCellConfigurator<ByUserNameTableViewCell, Cell>

class ByUserNameTableViewCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = Cell
   
    private let titleImage : UIImageView = {
        let image = UIImageView()
        image.tintColor = .secondaryLabel
        return image
    }()
    
    private let title : UILabel = {
        let label = UILabel()
        label.textColor = UIColor().textLabelColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleImage, title])
        stack.spacing = 10
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stack)
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Cell) {
        titleImage.image = UIImage(systemName: data.image)
        title.text = data.text
    }
    
    private func setupConstraints() {
        titleImage.snp.makeConstraints { make in
            make.width.height.equalTo(17)
            make.centerY.equalToSuperview()
        }
        stack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(11)
            make.bottom.equalToSuperview().offset(-11)
        }
    }
}
