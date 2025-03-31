//
//  ViewController.swift
//  ImageFeed
//
//  Created by Travka Andrey on 20.03.2025.
//

import UIKit

final class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private let showSingleImageSegueIdentifier = "ShowSingleImage"
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showSingleImageSegueIdentifier {
            guard
                let viewController = segue.destination as? SingleImageViewController,
                let indexPath = sender as? IndexPath
            else {
                assertionFailure("Invalid segue destination")
                return
            }
            
            let image = UIImage(named: photosName[indexPath.row])
         //   _ = viewController.view
         //   viewController.imageView.image = image
            viewController.image = image
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)

        guard let imageListCell = cell as? ImagesListCell else {
            print("Error in let imageListCell")
            return UITableViewCell()
        }

        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
}

extension ImagesListViewController {
    private func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        let rowNumber = indexPath.row
        let imageName = photosName[rowNumber]
        guard let image: UIImage = UIImage(named: imageName) else {
            return
        }
        cell.imageCell.image = image
        cell.dataLabel.text = dateFormatter.string(for: Date())
        
        if rowNumber % 2 == 0 {
            cell.likeButton.setImage(UIImage(resource: .likeOn), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(resource: .likeOff), for: .normal)
        }
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showSingleImageSegueIdentifier, sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        enum UIConstants {
            static let rightIndent = 16.0
            static let leftIndent = 16.0
            static let topIndent = 4.0
            static let bottomIndent = 4.0
        }
        
        let rowNumber = indexPath.row
        let imageName = photosName[rowNumber]
        guard let image: UIImage = UIImage(named: imageName) else {
            return 20 // вернём немного высоты, чтобы видны были ячейки и что-то пошло не так
        }
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let imageViewWidth = tableView.bounds.width - (UIConstants.rightIndent + UIConstants.leftIndent)
        let scale = imageViewWidth / imageWidth
        let cellHeight = imageHeight * scale + (UIConstants.bottomIndent + UIConstants.topIndent)
        
        return cellHeight
    }
}
