//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 06.02.2023.
//

import UIKit

final class ProfileViewController : UIViewController {

    private var profileImageView: UIImageView?
    private var quitButton: UIButton?
    private var nameLabel: UILabel?
    private var nickNameLabel: UILabel?
    private var aboutLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        initProfileImage()
        initQuitButton()
        initNameLabel()
        initNickNameLabel()
        initAboutLabel()
    }

    private func initProfileImage() {
        guard let image = UIImage(
            named: ProfileConstants.ProfileImage.imageName) else { return }
        profileImageView = UIImageView(image: image)
        guard let profileImageView = profileImageView else { return }
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: ProfileConstraints.Common.leading)
                .isActive = true
        profileImageView.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: ProfileConstraints.ProfileImage.top)
                .isActive = true
        profileImageView.widthAnchor.constraint(
            equalToConstant: ProfileConstraints.ProfileImage.width)
                .isActive = true
        profileImageView.heightAnchor.constraint(
            equalToConstant: ProfileConstraints.ProfileImage.height)
                .isActive = true
    }

    private func initQuitButton() {
        guard let image = UIImage(
            named: ProfileConstants.QuitButton.imageName) else { return }
        guard let profileImageView = profileImageView else { return }
        quitButton = UIButton.systemButton(
            with: image,
            target: self,
            action: nil)
        guard let quitButton = quitButton else { return }
        quitButton.tintColor = UIColor(
            named: ProfileConstants.QuitButton.textColorName)
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quitButton)
        quitButton.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: ProfileConstraints.QuitButton.trailing)
                .isActive = true
        quitButton.centerYAnchor.constraint(
            equalTo: profileImageView.centerYAnchor)
                .isActive = true
        quitButton.widthAnchor.constraint(
            equalToConstant: ProfileConstraints.QuitButton.width)
                .isActive = true
        quitButton.heightAnchor.constraint(
            equalToConstant: ProfileConstraints.QuitButton.height)
                .isActive = true
    }

    private func initNameLabel() {
        guard let profileImageView = profileImageView else { return }
        nameLabel = UILabel()
        guard let nameLabel = nameLabel else { return }
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.text = ProfileConstants.NameLabel.defaultName
        nameLabel.font = UIFont.systemFont(
            ofSize: ProfileConstants.NameLabel.fontSize,
            weight: ProfileConstants.NameLabel.fontWeight)
        nameLabel.textColor = UIColor(
            named: ProfileConstants.NameLabel.textColorName)
        nameLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: ProfileConstraints.Common.leading)
                .isActive = true
        nameLabel.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: ProfileConstraints.Common.trailing)
                .isActive = true
        nameLabel.topAnchor.constraint(
            equalTo: profileImageView.bottomAnchor,
            constant: ProfileConstraints.NameLabel.top)
                .isActive = true
    }

    private func initNickNameLabel() {
        guard let nameLabel = nameLabel else { return }
        nickNameLabel = UILabel()
        guard let nickNameLabel = nickNameLabel else { return }
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nickNameLabel)
        nickNameLabel.text = ProfileConstants.NicknameLabel.defaultName
        nickNameLabel.font = UIFont.systemFont(
            ofSize: ProfileConstants.NicknameLabel.fontSize)
        nickNameLabel.textColor = UIColor(
            named: ProfileConstants.NicknameLabel.textColorName)
        nickNameLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: ProfileConstraints.Common.leading)
                .isActive = true
        nickNameLabel.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: ProfileConstraints.Common.trailing)
                .isActive = true
        nickNameLabel.topAnchor.constraint(
            equalTo: nameLabel.bottomAnchor,
            constant: ProfileConstraints.NicknameLabel.top)
                .isActive = true
    }

    private func initAboutLabel() {
        guard let nickNameLabel = nickNameLabel else { return }
        aboutLabel = UILabel()
        guard let aboutLabel = aboutLabel else { return }
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        aboutLabel.text = ProfileConstants.AboutLabel.defaultName
        aboutLabel.font = UIFont.systemFont(
            ofSize: ProfileConstants.AboutLabel.fontSize)
        aboutLabel.textColor = UIColor(
            named: ProfileConstants.AboutLabel.textColorName)
        aboutLabel.numberOfLines = ProfileConstants.AboutLabel.numberOfLines
        aboutLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: ProfileConstraints.Common.leading)
                .isActive = true
        aboutLabel.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: ProfileConstraints.Common.trailing)
                .isActive = true
        aboutLabel.topAnchor.constraint(
            equalTo: nickNameLabel.bottomAnchor,
            constant: ProfileConstraints.AboutLabel.top)
                .isActive = true
    }

}
