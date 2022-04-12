//
//  PersonTableViewCell.swift
//  Forbes
//
//  Created by Мурад on 02.03.2022.
//

import UIKit
import SnapKit

class PersonTableViewCell: UITableViewCell {
    
    private enum Constant {

        enum AvatarImage {
            static let cornerRadius: CGFloat = 25
            static let borderWidth: CGFloat = 2
            static let insets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
            static let height: CGFloat = 50
        }

        enum Strings {
            static let fioLabelPrefix = "Fio: "
        }
    }
    
    private let avatarImageView = UIImageView()
    private let fullName = UILabel()
    private let company = UILabel()
    private let profession = UILabel()
    private let mainStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = Constant.AvatarImage.cornerRadius
    }
    
    private func setupUI() {
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderColor = UIColor.blue.cgColor
        avatarImageView.layer.borderWidth = Constant.AvatarImage.borderWidth
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(Constant.AvatarImage.insets)
            make.height.equalTo(avatarImageView.snp.width)
            make.height.equalTo(Constant.AvatarImage.height)
        }

        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 5
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(20)
            make.top.trailing.bottom.equalToSuperview().inset(10)
        }
        
        mainStackView.addArrangedSubview(fullName)
        mainStackView.addArrangedSubview(company)
        company.numberOfLines = .zero

        mainStackView.addArrangedSubview(profession)
        profession.numberOfLines = .zero
    }
    
    func configure(person: Person) {
        fullName.text = Constant.Strings.fioLabelPrefix + person.fio

        company.isHidden = person.company.isEmpty
        company.text = "Company: " + person.company

        profession.text = "Profession: " + person.post
        
        avatarImageView.sd_setImage(with: URL(string: person.photo), placeholderImage: UIImage(named: "placeholder"))
    }
}
