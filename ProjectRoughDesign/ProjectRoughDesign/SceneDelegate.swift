//
//  SceneDelegate.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = makeTabBarController()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func makeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let first = MainViewController()
        let firstTabBarItem = TabBarItems(first)
        first.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: firstTabBarItem.imageName)?.resized(to: CGSize(width: 45, height: 45)),
            tag: firstTabBarItem.rawValue
        )
        first.tabBarItem.imageInsets = UIEdgeInsets(top: 22, left: 0, bottom: -22, right: 0)

        let second = TrophyViewController()
        let secondTabBarItem = TabBarItems(second)
        second.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: secondTabBarItem.imageName)?.resized(to: CGSize(width: 45, height: 45)),
            tag: secondTabBarItem.rawValue
        )
        second.tabBarItem.imageInsets = UIEdgeInsets(top: 22, left: 0, bottom: -22, right: 0)

        let third = AlbumViewController()
        let thirdTabBarItem = TabBarItems(third)
        third.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: thirdTabBarItem.imageName)?.resized(to: CGSize(width: 45, height: 45)),
            tag: thirdTabBarItem.rawValue
        )
        third.tabBarItem.imageInsets = UIEdgeInsets(top: 22, left: 0, bottom: -22, right: 0)
        
        

        tabBarController.viewControllers = [first, second, third]
        tabBarController.tabBar.tintColor = UIColor(named: "mainColor2")
        //        tabBarController.tabBar.barTintColor = .white
        let appearance = UITabBarAppearance()
        //        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "mainColor1")
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance
        
        tabBarController.tabBar.selectionIndicatorImage = UIImage.imageWithColor(
            color: UIColor(named: "mainColor4"),
            size: CGSize(width: 60,
                         height: 60)
        )
        
        return tabBarController
    }
}

enum TabBarItems: Int {
    case mainViewController = 0
    case albumViewController = 1
    case earnedCardViewController = 2
    case none = 3
    
    var imageName: String {
        switch self {
        case .mainViewController:
            return "mainTabIcon"
        case .albumViewController:
            return "albumTabIcon"
        case .earnedCardViewController:
            return "earnedCardTabIcon"
        case .none:
            return ""
        }
    }
    
    init(_ viewController: UIViewController) {
        let map = [
            ObjectIdentifier(MainViewController.self):
                TabBarItems.mainViewController,
            ObjectIdentifier(AlbumViewController.self): TabBarItems.albumViewController,
            ObjectIdentifier(TrophyViewController.self): TabBarItems.earnedCardViewController
        ]
        self = map[ObjectIdentifier(type(of:viewController))] ?? .none
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    static func imageWithColor(color: UIColor?, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        (color ?? .white).setFill()
        UIBezierPath(ovalIn: rect).fill()
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
