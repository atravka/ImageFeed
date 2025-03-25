//
//  ViewController.swift
//  ImageFeed
//
//  Created by Travka Andrey on 20.03.2025.
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
        // Do any additional setup after loading the view.

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
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
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
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
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowNumber = indexPath.row
        let imageName = photosName[rowNumber]
        guard let image: UIImage = UIImage(named: imageName) else {
            return 20 // вернём немного высоты, чтобы видны были ячейки и что-то пошло не так
        }
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let imageViewWidth = tableView.bounds.width - 32 // 16+16 left+right indent
        let scale = imageViewWidth / imageWidth
        let cellHeight = imageHeight * scale + 4 + 4 // 4+4 top+bottom indent
        
        return cellHeight
    }
}
