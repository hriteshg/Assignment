import UIKit
import Alamofire

class ProfileViewController: UIViewController, BottomSheetDelegate{
    
    var bottomSheetView: BottomSheetView?
    
    func updateDetailsButtonTapped(applicationTitle: String, applicationSubtitle: String) {
        print("updateDetailsButtonTapped")
    }
    private var tableView: UITableView!
    private var data: [(image: UIImage, title: String)] = [(UIImage(named: "profile")!, "Change Profile Name"),
                                                           (UIImage(named: "password")!, "Change Password"),
                                                           (UIImage(named: "address")!, "My Address"),
                                                           (UIImage(named: "logout")!, "Logout")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableviewCell.self, forCellReuseIdentifier: "ProfileTableviewCell")
        
        view.addSubview(tableView)
        getProfile()
    }
    
    private func getProfile() {
        print("getProfile")
    }
    
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableviewCell", for: indexPath) as! ProfileTableviewCell
        let cellData = data[indexPath.row]
        cell.configure(with: cellData.image, title: cellData.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .yellow
        SessionManager.shared.clearSession()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let sceneDelegate = UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = vc
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func showBottomSheet() {
        bottomSheetView = BottomSheetView()
        bottomSheetView!.delegate = self
        bottomSheetView!.frame = CGRect(x: 0, y: self.view.frame.height - 240, width: self.view.frame.width, height: 240)
        self.view.addSubview(bottomSheetView!)
    }
    
    func dismissBottomSheet() {
        guard let bottomSheetView = bottomSheetView else {
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height, width: bottomSheetView.frame.width, height: bottomSheetView.frame.height)
        }) { _ in
            bottomSheetView.removeFromSuperview()
            self.bottomSheetView = nil
        }
    }
}

protocol BottomSheetDelegate: AnyObject {
    func updateDetailsButtonTapped(applicationTitle: String, applicationSubtitle: String)
}

class BottomSheetView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Hello"
        label.backgroundColor = .red
        return label
    }()
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var updateDetailsButton: UIButton!
    
    weak var delegate: BottomSheetDelegate?
    
    // Implement actions and other methods as needed
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView () {
        print("Hellosetupview")
        self.backgroundColor = .gray
        self.addSubview(titleLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @IBAction func updateDetailsButtonTapped(_ sender: UIButton) {
        delegate?.updateDetailsButtonTapped(applicationTitle: textField1.text ?? "", applicationSubtitle: textField2.text ?? "")
    }
}
