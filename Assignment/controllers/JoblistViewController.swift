import UIKit
import Alamofire

class JoblistViewController: UIViewController {
    
    private var tableView: UITableView!
    private var jobs: [JobModel] = []
    private var page = 0
    private var total: Int? = nil
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Jobs"
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "JobCell")
        view.addSubview(tableView)
        
        refreshControl.addTarget(self, action: #selector(loadData1), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        loadData(isRefreshing: false)
    }
    
    @objc private func loadData1() {
        loadData(isRefreshing: true)
    }
    
    @objc private func loadData(isRefreshing: Bool) {
        if !isRefreshing, let total = total, jobs.count >= total {
            return
        }

        let newPage = isRefreshing ? 1 : page + 1
        self.refreshControl.beginRefreshing()
        JobsService().fetchJobs(page: newPage) { (jobsModel, err) in
            if err != nil {
              return
            }
            guard let jobsModel = jobsModel else {
                    return
            }
            DispatchQueue.main.async { [weak self] in
                if newPage == 1 {
                    self?.jobs = jobsModel.jobs
                } else {
                    self?.jobs = (self?.jobs ?? []) + jobsModel.jobs
                }
                self?.total = jobsModel.total
                self?.page = newPage
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension JoblistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
        let job = jobs[indexPath.row]
        cell.configure(with: job)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let job = jobs[indexPath.row]
        let jobDetailsViewController = JobDetailsViewController(job: job)
        navigationController?.pushViewController(jobDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == jobs.count - 1 {
            loadData(isRefreshing: false)
        }
    }
    
}
