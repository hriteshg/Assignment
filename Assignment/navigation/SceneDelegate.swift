import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if SessionManager.shared.getSessionToken() != nil {
            let mainTabBarController = storyboard.instantiateViewController(identifier: "TabbarControllerID")
            window?.rootViewController = mainTabBarController
        } else {
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            window?.rootViewController = loginNavController
        }
    }
}

