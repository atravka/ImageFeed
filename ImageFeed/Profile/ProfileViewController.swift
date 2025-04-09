//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Travka Andrey on 28.03.2025.
//

import UIKit

final class ProfileViewController: UIViewController {

    let userPicImageView = UIImageView()
    let userNameLabel = UILabel()
    let loginNameLabel = UILabel()
    let descriptionLabel = UILabel()
    let exitButton = UIButton()

    private func setUserPicImageView() {
        userPicImageView.translatesAutoresizingMaskIntoConstraints = false
        userPicImageView.image = UIImage(resource: .userpickPhoto)
        view.addSubview(userPicImageView)
        
        NSLayoutConstraint.activate([
            userPicImageView.widthAnchor.constraint(equalToConstant: 70),
            userPicImageView.heightAnchor.constraint(equalToConstant: 70),
            userPicImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userPicImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    private func setUserNameLabel() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Екатерина Новикова"
        userNameLabel.textColor = .ypWhiteIOS
        userNameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        view.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.heightAnchor.constraint(equalToConstant: 18),
            userNameLabel.topAnchor.constraint(equalTo: userPicImageView.bottomAnchor, constant: 8),
            userNameLabel.leadingAnchor.constraint(equalTo: userPicImageView.leadingAnchor)
        ])
    }
    
    private func setLoginNameLabel() {
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginNameLabel.text = "@ekaterina_nov"
        loginNameLabel.textColor = .ypGrayIOS
        loginNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.addSubview(loginNameLabel)
        
        NSLayoutConstraint.activate([
            loginNameLabel.heightAnchor.constraint(equalToConstant: 18),
            loginNameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            loginNameLabel.leadingAnchor.constraint(equalTo: userPicImageView.leadingAnchor)
        ])
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.textColor = .ypWhiteIOS
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 18),
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: userPicImageView.leadingAnchor)
        ])
    }
    
    private func setExitButton() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.clipsToBounds = true
        exitButton.contentMode = .scaleAspectFill
        exitButton.setBackgroundImage(.exitButton, for: .normal)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            exitButton.widthAnchor.constraint(equalToConstant: 44),
            exitButton.heightAnchor.constraint(equalToConstant: 44),
            exitButton.centerYAnchor.constraint(equalTo: userPicImageView.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        exitButton.addTarget(
            nil,
            action: #selector(self.didTapExitButton),
            for: .touchUpInside)
    }
    
    @objc
    private func didTapExitButton() {
        print("Did Tap Exit Button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypBlackIOS
        
        setUserPicImageView()
        
        setUserNameLabel()
        
        setLoginNameLabel()
        
        setDescriptionLabel()
        
        setExitButton()
        
    }
}
