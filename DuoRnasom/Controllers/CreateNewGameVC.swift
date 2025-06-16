//
//  CreateNewGameVC.swift
//  DuoRnasom
//
//  Created by Asadullah Azimi on 6/15/25.
//
import UIKit

class CreateNewGameVC: UIViewController {
    
    // Text field for the prompt
    private let promptTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a fun prompt/question..."
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // Start Game Button
    private let startGameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Start Game"
        config.baseBackgroundColor = .systemGreen
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        config.contentInsets = .init(top: 12, leading: 24, bottom: 12, trailing: 24)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // Label to show the game ID
    private let gameIDLabel: UILabel = {
        let label = UILabel()
        label.text = ""  // Empty util the random game ID is generated
        label.font = .monospacedSystemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Prompt"
        view.backgroundColor = .systemBackground
        
        // Add subviews
        view.addSubview(promptTextField)
        view.addSubview(startGameButton)
        view.addSubview(gameIDLabel)
        
        // Layout With Auto Layout
        NSLayoutConstraint.activate([
            // Prompt field pinned to safe area top
            promptTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            promptTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Start Game Button Bellow Prompt
            startGameButton.topAnchor.constraint(equalTo: promptTextField.bottomAnchor, constant: 20),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Game ID Label Bellow Generate Button
            gameIDLabel.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 30),
            gameIDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Wire up button action
        startGameButton.addTarget(self, action: #selector(didTapStartGame), for: .touchUpInside)
    }
    
    // Mark: - Actions
    
    @objc private func didTapStartGame(){
        let prompt = promptTextField.text ?? ""
        guard !prompt.isEmpty else {
            // Show and alert if the prompt is missing
            let alert = UIAlertController(title: "Missing Prompt", message: "Please enter a prompt to start the game.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let gameID = generateRandomGameID()
        let waitingRoomVC = WaitingRoomVC(prompt: prompt, gameID: gameID)
        navigationController?.pushViewController(waitingRoomVC, animated: true)
    }
    
    // Makr: - Helpers
    
    private func generateRandomGameID(length: Int = 6) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var ID = ""
        
        for _ in 0..<length {
            if let randomChar = letters.randomElement(){
                ID.append(randomChar)
            }
        }
        
        return ID
    }
}
