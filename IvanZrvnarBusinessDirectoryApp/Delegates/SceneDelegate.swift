//
//  SceneDelegate.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var coreDataStack = CoreDataStack(modelName: "BusinessCD")
    var savedContactList = [Business]()

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        // passing the core data stack to the other VC's 
        guard let rootVC = window?.rootViewController as? UITabBarController,
              let firstTabNav = rootVC.viewControllers?[0] as? UINavigationController,
              let secondTabNav = rootVC.viewControllers?[1] as? UINavigationController,
              let mainVC = firstTabNav.viewControllers[0] as? ViewController,
              let secondVC = secondTabNav.viewControllers[0] as? ContactViewController else {return}
        mainVC.coreDataStack = coreDataStack
        mainVC.businesses = savedContactList
        secondVC.coreDataStack = coreDataStack
//        secondVC.contactList = savedContactList
        
        
        
        
        UNUserNotificationCenter.current().delegate = self

        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge,.banner])
    }

}
