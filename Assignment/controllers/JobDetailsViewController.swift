import UIKit

class JobDetailsViewController: UIViewController {
    private let job: JobModel
    
    init(job: JobModel) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Styles.shared.primaryTextColor
        titleLabel.text = "Company: \(job.company.name)"
        view.addSubview(titleLabel)
        
        
        let bannerImageView = UIImageView(image: UIImage(named: "Image"))
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerImageView)
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Position Title: \(job.positionTitle)"
        descriptionLabel.textColor = Styles.shared.secondaryTextColor
        view.addSubview(descriptionLabel)
        
        let paymentLabel = UILabel()
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentLabel.textColor = Styles.shared.secondaryTextColor
        paymentLabel.text = "Description: \(job.description)"
        paymentLabel.numberOfLines = 0
        view.addSubview(paymentLabel)
        
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .gray
        
        view.addSubview(dividerView)
        
        let shiftsLabel = UILabel()
        shiftsLabel.translatesAutoresizingMaskIntoConstraints = false
        shiftsLabel.textColor = Styles.shared.secondaryTextColor
        shiftsLabel.text = "Industry: \(job.industry)"
        view.addSubview(shiftsLabel)
        
        let dividerView2 = UIView()
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.backgroundColor = .gray
        
        view.addSubview(dividerView2)
        
        let requirementsLabel = UILabel()
        requirementsLabel.translatesAutoresizingMaskIntoConstraints = false
        requirementsLabel.text = "Location: \(job.location)"
        requirementsLabel.textColor = Styles.shared.secondaryTextColor
        requirementsLabel.numberOfLines = 0
        
        view.addSubview(requirementsLabel)
        
        let dividerView3 = UIView()
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.backgroundColor = .gray
        
        view.addSubview(dividerView3)
        
        let applyButton = UIButton(type: .system)
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.setTitle("Apply for this Job", for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        
        view.addSubview(applyButton)
                
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant:0),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bannerImageView.heightAnchor.constraint(equalToConstant: 240),
            
            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant:10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:10),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant:0),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant:0),
            
            paymentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant:10),
            paymentLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant:0),
            paymentLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant:0),
            
            shiftsLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant:10),
            shiftsLabel.leadingAnchor.constraint(equalTo: paymentLabel.leadingAnchor, constant:0),
            
            requirementsLabel.topAnchor.constraint(equalTo: shiftsLabel.bottomAnchor, constant:10),
            requirementsLabel.leadingAnchor.constraint(equalTo: shiftsLabel.leadingAnchor, constant:0),
            requirementsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0),
            
            applyButton.topAnchor.constraint(equalTo: requirementsLabel.bottomAnchor, constant:10),
            applyButton.leadingAnchor.constraint(equalTo: requirementsLabel.leadingAnchor, constant:0),
        ])
    }
    
    @objc private func applyButtonTapped() {
        // Handle apply button tap
    }    
}
