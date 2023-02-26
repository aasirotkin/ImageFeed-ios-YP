//
//  ProfileConstraints.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 26.02.2023.
//

import UIKit

enum ProfileConstraints {

    enum Common {
        static let leading: CGFloat = 16
        static let trailing: CGFloat = 16
    }

    enum ProfileImage {
        static let top: CGFloat = 76
        static let width: CGFloat = 70
        static let height: CGFloat = 70
    }

    enum QuitButton {
        static let trailing: CGFloat = -26
        static let width: CGFloat = 44
        static let height: CGFloat = 44
    }

    enum NameLabel {
        static let top: CGFloat = 8
    }

    enum NicknameLabel {
        static let top: CGFloat = 8
    }

    enum AboutLabel {
        static let top: CGFloat = 8
    }
}
