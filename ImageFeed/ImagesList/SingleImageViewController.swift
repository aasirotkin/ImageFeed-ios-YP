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
            rescaleImageInScrollView(image: image)
            centerImageInScrollView(image: image)
        }
    }

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var scrollView: UIScrollView!

    @IBAction private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapShareButton(_ sender: Any) {
        guard let image = image else { return }
        let share = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        present(share, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        rescaleImageInScrollView(image: image)
        centerImageInScrollView(image: image)
    }

    private func adjustImage() {
        guard let image = imageView.image else { return }
        rescaleImageInScrollView(image: image)
        centerImageInScrollView(image: image)
    }

    private func rescaleImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, max(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
    }

    private func centerImageInScrollView(image: UIImage) {
        let newContentSize = scrollView.contentSize
        let visibleRectSize = scrollView.bounds.size
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }

}

extension SingleImageViewController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }

}
