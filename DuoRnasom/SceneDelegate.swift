//
//  SceneDelegate.swift
//  DuoRnasom
//
//  Created by Asadullah Azimi on 6/14/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions){
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        // Wraping VCs in a navigation controller
        let navController = UINavigationController(rootViewController: WelcomeVC())
        window.rootViewController = navController
        
        self.window = window
        window.makeKeyAndVisible()
    }

}

