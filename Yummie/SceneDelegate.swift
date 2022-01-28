//
//  SceneDelegate.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/01/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        var controller:UIViewController!
        
        if UserDefaults.standard.hasOnboarded  {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            controller = storyboard.instantiateViewController(identifier: "Controller") as! UINavigationController
        }else{
            controller = OnboardingViewController.instantiate()
            
        }
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
            
            
            
            
            
    }
    
   
}

