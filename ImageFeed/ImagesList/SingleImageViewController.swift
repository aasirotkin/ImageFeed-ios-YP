//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Александр Сироткин on 07.02.2023.
//

import UIKit

class SingleImageViewController : UIViewController {

    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var scrollView: UIScrollView!

    @IBAction private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

}
