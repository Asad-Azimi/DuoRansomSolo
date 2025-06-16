//
//  WaitingRoomVC.swift
//  DuoRnasom
//
//  Created by Asadullah Azimi on 6/16/25.
//

import UIKit

class WaitingRoomVC: UIViewController {
    
    private let prompt: String
    private let gameID: String
    
    init(prompt: String, gameID: String){
        self.prompt = prompt
        self.gameID = gameID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let gameIDLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedSystemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Waiting Rome..."
        view.backgroundColor = .systemBackground
        
        view.addSubview(gameIDLabel)
        view.addSubview(promptLabel)
        
        promptLabel.text = "Prompt: \(prompt)"
        gameIDLabel.text = "Game ID: \(gameID)"
        
        NSLayoutConstraint.activate([
            gameIDLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            gameIDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            promptLabel.topAnchor.constraint(equalTo: gameIDLabel.bottomAnchor, constant: 30),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
}
