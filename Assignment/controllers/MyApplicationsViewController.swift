import UIKit

class MyApplicationsViewController: UIViewController {
    private var tableView: UITableView!
    private var applications: [Applications] = [
        Applications(title: "Job 1", description: "Job 1 Description"),
        Applications(title: "Job 2", description: "Job 2 Description")]
    override func viewDidLoad() {
        super.viewDidLoad()

//        fetchApplications()
        // Fetch the list of applications for the authenticated user
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyApplicationTableViewCell.self, forCellReuseIdentifier: "MyApplicationTableViewCell")
        view.addSubview(tableView)
        
    }

    func fetchApplications() {
        // Replace this with your logic to fetch applications for the authenticated user
        // For example, you might use an API call or access a local database
        // After fetching the applications, update the 'applications' array and reload the table view
        //applications = YourDataManager.shared.getApplicationsForCurrentUser() // Example method, replace with your own
        tableView.reloadData()
    }
}

extension MyApplicationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }
    func
    tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Adjust the cell height as per your requirement
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyApplicationTableViewCell", for: indexPath) as! MyApplicationTableViewCell
        let applications = applications[indexPath.row]
        cell.configure(with: applications)
        return cell
    }
}

class ApplicationCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    // Add other UI elements for displaying application details
}
