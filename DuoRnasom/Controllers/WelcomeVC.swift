//
//  WelcomeVC.swift
//  DuoRnasom
//
//  Created by Asadullah Azimi on 6/15/25.
//
import UIKit

class WelcomeVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to DuoRansom"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let NewGameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "New Game"
        config.baseBackgroundColor = .systemGreen
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let JoinGameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Join Game"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "duoOwl")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(NewGameButton)
        view.addSubview(logoImageView)
        view.addSubview(JoinGameButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            NewGameButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            NewGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            JoinGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JoinGameButton.topAnchor.constraint(equalTo: NewGameButton.bottomAnchor, constant: 20)
        ])
        
        NewGameButton.addTarget(self, action: #selector(NewGameButtonTapped), for: .touchUpInside)
        JoinGameButton.addTarget(self, action: #selector(JoinGameButtonTapped), for: .touchUpInside)
    }
    
    @objc private func NewGameButtonTapped() {
        let createVC = CreateNewGameVC()
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    @objc private func JoinGameButtonTapped() {
        print ("Joinging an Existing Game!")
    }
}

