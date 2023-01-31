//
//  ViewController.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 23.01.2023.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ImagesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)

        guard let imageCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }

        configCell(for: imageCell)
        return imageCell
    }

    private func configCell(for cell: ImagesListCell) {
    }

}

extension ImagesListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
    }

}

