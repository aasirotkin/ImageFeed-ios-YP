//
//  ProfileConstants.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 26.02.2023.
//

import UIKit

enum ProfileConstants {

    enum ProfileImage {
        static let imageName = "DefaultProfileIcon"
    }

    enum QuitButton {
        static let imageName = "QuitIcon"
        static let textColorName = "YP Red (iOS)"
    }

    enum NameLabel {
        static let defaultName = "User"
        static let fontSize: CGFloat = 23
        static let fontWeight = UIFont.Weight.bold
        static let textColorName = "YP White (iOS)"
    }

    enum NicknameLabel {
        static let defaultName = "User nickname"
        static let fontSize: CGFloat = 13
        static let textColorName = "YP White (iOS)"
    }

    enum AboutLabel {
        static let defaultName = "About user"
        static let fontSize: CGFloat = 13
        static let textColorName = "YP White (iOS)"
        static let numberOfLines = 0
    }

}
