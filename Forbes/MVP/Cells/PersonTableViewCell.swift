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
        }
        enum Strings {
            static let fioLabelPrefix = "Fio: "
            
        }
    }
    
    var avatarImageView = UIImageView()
    var fullName = UILabel()
    var company = UILabel()
    var profession = UILabel()
    var mainStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = Constant.AvatarImage.cornerRadius
    }
    
    func setupUI() {
        
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderColor = UIColor.blue.cgColor
        avatarImageView.layer.borderWidth = 2
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(10)
            make.height.equalTo(avatarImageView.snp.width)
            make.height.equalTo(50)
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
        if person.company.isEmpty {
            company.isHidden = true
        } else {
            company.isHidden = false
            company.text = "Company: " + person.company
        }
        
        profession.text = "Profession: " + person.post
        
        avatarImageView.sd_setImage(with: URL(string: person.photo),placeholderImage: UIImage(named: "placeholder"))
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        
        
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}

