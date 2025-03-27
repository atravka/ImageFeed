//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Travka Andrey on 25.03.2025.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"


    @IBOutlet weak var imageCell: UIImageView!

    @IBOutlet weak var dataLabel: UILabel!

    @IBOutlet weak var likeButton: UIButton!

}
