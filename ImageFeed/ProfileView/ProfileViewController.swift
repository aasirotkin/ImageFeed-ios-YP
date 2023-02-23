//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 06.02.2023.
//

import UIKit

private class Constraints {

    static let leading: CGFloat = 16
    static let trailing: CGFloat = 16
    static let profileImageTop: CGFloat = 76
    static let profileImageWidth: CGFloat = 70
    static let profileImageHeight: CGFloat = 70
    static let quitButtonTrailing: CGFloat = -26
    static let nameLabelTop: CGFloat = 8
    static let nickNameTop: CGFloat = 8
    static let aboutTextViewTop: CGFloat = 8

}

class ProfileViewController : UIViewController {

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
        guard let image = UIImage(named: "DefaultProfileIcon") else { return }
        profileImageView = UIImageView(image: image)
        guard let profileImageView = profileImageView else { return }
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constraints.leading)
                .isActive = true
        profileImageView.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: Constraints.profileImageTop)
                .isActive = true
        profileImageView.widthAnchor.constraint(
            equalToConstant: Constraints.profileImageWidth)
                .isActive = true
        profileImageView.heightAnchor.constraint(
            equalToConstant: Constraints.profileImageHeight)
                .isActive = true
    }

    private func initQuitButton() {
        guard let image = UIImage(named: "QuitIcon") else { return }
        guard let profileImageView = profileImageView else { return }
        quitButton = UIButton.systemButton(
            with: image,
            target: self,
            action: nil)
        guard let quitButton = quitButton else { return }
        quitButton.tintColor = UIColor(named: "YP Red (iOS)")
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quitButton)
        quitButton.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: Constraints.quitButtonTrailing)
                .isActive = true
        quitButton.centerYAnchor.constraint(
            equalTo: profileImageView.centerYAnchor)
                .isActive = true
    }

    private func initNameLabel() {
        guard let profileImageView = profileImageView else { return }
        nameLabel = UILabel()
        guard let nameLabel = nameLabel else { return }
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.text = "User name"
        nameLabel.font = UIFont.systemFont(ofSize: 23)
        nameLabel.textColor = UIColor(named: "YP White (iOS)")
        nameLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constraints.leading)
                .isActive = true
        nameLabel.topAnchor.constraint(
            equalTo: profileImageView.bottomAnchor,
            constant: Constraints.nameLabelTop)
                .isActive = true
    }

    private func initNickNameLabel() {
        guard let nameLabel = nameLabel else { return }
        nickNameLabel = UILabel()
        guard let nickNameLabel = nickNameLabel else { return }
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nickNameLabel)
        nickNameLabel.text = "User nickname"
        nickNameLabel.font = UIFont.systemFont(ofSize: 13)
        nickNameLabel.textColor = UIColor(named: "YP White (iOS)")
        nickNameLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constraints.leading)
                .isActive = true
        nickNameLabel.topAnchor.constraint(
            equalTo: nameLabel.bottomAnchor,
            constant: Constraints.nameLabelTop)
                .isActive = true
    }

    private func initAboutLabel() {
        guard let nickNameLabel = nickNameLabel else { return }
        aboutLabel = UILabel()
        guard let aboutLabel = aboutLabel else { return }
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        aboutLabel.text = "About user"
        aboutLabel.font = UIFont.systemFont(ofSize: 13)
        aboutLabel.textColor = UIColor(named: "YP White (iOS)")
        aboutLabel.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: Constraints.leading)
                .isActive = true
        aboutLabel.topAnchor.constraint(
            equalTo: nickNameLabel.bottomAnchor,
            constant: Constraints.nameLabelTop)
                .isActive = true
    }

}
