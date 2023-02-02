//
//  ViewController.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 23.01.2023.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset =
            UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }

}

extension ImagesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)

        guard let imageCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }

        configCell(for: imageCell, with: indexPath)
        return imageCell
    }

    private func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        if indexPath.row >= photosName.count { return }
        let photoName = photosName[indexPath.row]
        guard let photo = UIImage(named: photoName) else { return }
        guard let like = ((indexPath.row % 2 == 0)
                          ? UIImage(named: "NoLike")
                          : UIImage(named: "Like")) else { return }
        cell.cellImage.image = photo
        cell.cellImage.layer.cornerRadius = 16
        cell.cellImage.layer.masksToBounds = true
        cell.dateLabel.text = dateFormatter.string(from: Date())
        cell.likeButton.imageView?.image = like
    }

}

extension ImagesListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }

}

