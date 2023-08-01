import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.textColor = Styles.shared.primaryTextColor
        usernameTextField.layer.borderColor = Styles.shared.secondaryTextColor?.cgColor
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 4
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter username",
            attributes: [NSAttributedString.Key.foregroundColor: Styles.shared.secondaryTextColor!]
        )
        
        passwordTextField.textColor = Styles.shared.primaryTextColor
        passwordTextField.layer.borderColor = Styles.shared.secondaryTextColor?.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter password",
            attributes: [NSAttributedString.Key.foregroundColor: Styles.shared.secondaryTextColor!]
        )
        
        loginButton.backgroundColor = Styles.shared.primaryButtonColor
        loginButton.layer.cornerRadius = 4
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showErrorAlert(message: "Invalid username")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showErrorAlert(message: "Invalid password")
            return
        }
        authenticateUser(with: username, password: password)
    }
    
    private func authenticateUser(with username: String, password: String) {
        let login = LoginRequestModel(user: username, password: password)
        LoginService().login(username: username, password: password, completion: { r, s -> Void in
            if let response = r {
                SessionManager.shared.saveSession(sessionToken: response)
                self.showHomeScreen()
            } else {
                self.showErrorAlert(message: s ?? "Something went wrong!")
            }
        })
        
    }
    
    private func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabbarControllerID") as! HomeViewController
        let sceneDelegate = UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = vc
    }
}

