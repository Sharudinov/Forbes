//
//  DetaleViewController.swift
//  Forbes
//
//  Created by Мурад on 06.03.2022.
//

import SnapKit
import SDWebImage

class DetaleViewController: UIViewController {

    private let avatarImageView = UIImageView()
    private let fullName = UILabel()
    private let company = UILabel()
    private let profession = UILabel()
    private let topView = UIView()
    private let inst = UIImageView()
    private let vk = UIImageView()
    private let whatsUp = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = (UIColor .systemIndigo)

        navigationItem.title = "Info"
        view.backgroundColor = .lightGray

        setupUI()
    }

    private func setupUI() {
        view.addSubview(topView)
        topView.backgroundColor = .systemIndigo
        topView.snp.makeConstraints { make  in
            make.top.leading.trailing.equalTo(view)
            make.height.equalTo(topView.snp.width)
        }
        
        avatarImageView.backgroundColor = .gray
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 8
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.backgroundColor = .white
        topView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(140)
        }
        
        let instImage = UIImage(named: "inst")
        inst.image = instImage
        inst.snp.makeConstraints {make in
            make.height.width.equalTo(50)
        }
        
        
        let vkImage = UIImage(named: "vk-com-logo")
        vk.image = vkImage
        vk.snp.makeConstraints{ make in
            make.height.width.equalTo(50)
        }
        
        let whatImage = UIImage(named: "whats")
        whatsUp.image = whatImage
        whatsUp.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            
        }
        let wrappedSocialMediaView = UIView()
        wrappedSocialMediaView.backgroundColor = .systemBackground
        wrappedSocialMediaView.layer.cornerRadius = 25
        view.addSubview(wrappedSocialMediaView)
        wrappedSocialMediaView.snp.makeConstraints {make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            
        }
        
        let socialMediaStackView = UIStackView(arrangedSubviews: [inst,vk,whatsUp])
        socialMediaStackView.distribution = .equalCentering
        socialMediaStackView.alignment = .center
        socialMediaStackView.spacing = 20
        wrappedSocialMediaView.addSubview(socialMediaStackView)
        socialMediaStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(20)
        }

        let labelStackView = UIStackView(arrangedSubviews: [fullName,company,profession])
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.spacing = 5
        
        
        let mainStackView = UIStackView(arrangedSubviews: [avatarImageView, labelStackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 20
        topView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().inset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }
        
        
        fullName.font = UIFont.systemFont(ofSize: 14 , weight: .medium)
        fullName.textColor = .white
        fullName.numberOfLines = 0
        
        company.font = UIFont.systemFont(ofSize: 12 , weight: .thin)
        company.textColor = .white
        company.numberOfLines = 0
        
        profession.font = UIFont.systemFont(ofSize: 12 , weight: .thin)
        profession.textColor = .white
        profession.numberOfLines = 0
    }

    // Лучше метод конфигурации не в самом начале, так как это вспомогательный метод. В начале только методы жизненного цикла
    func configure(person: Person) {
        fullName.text = "Fio: " + person.fio

        company.isHidden = person.company.isEmpty
        company.text = "Company: " + person.company

        profession.text = "Profession: " + person.post

        avatarImageView.sd_setImage(with: URL(string: person.photo),placeholderImage: UIImage(named: "placeholder"))
    }
}
