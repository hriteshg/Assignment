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
        let attributed = NSMutableAttributedString(string: "Company: \(job.company.name)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
        attributed.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSRange(location: 0, length: 8))
        titleLabel.attributedText = attributed
        view.addSubview(titleLabel)
        
        
        let bannerImageView = UIImageView(image: UIImage(named: "Image"))
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerImageView)
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let des = NSMutableAttributedString(string: "Position Title: \(job.positionTitle)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
        des.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSRange(location: 0, length: 15))
        descriptionLabel.attributedText = des
        descriptionLabel.textColor = Styles.shared.primaryTextColor
        view.addSubview(descriptionLabel)
        
        let paymentLabel = UILabel()
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentLabel.textColor = Styles.shared.primaryTextColor
        paymentLabel.numberOfLines = 0
        paymentLabel.lineBreakMode = .byWordWrapping
        
        let paymentStr = NSMutableAttributedString(string: "Description: \(job.description)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        paymentStr.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 0, length: 11))
        let ss = NSMutableParagraphStyle()
        ss.lineBreakMode = .byWordWrapping
        paymentStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: ss, range: NSRange(location: 0, length: paymentStr.length))
        paymentLabel.attributedText = paymentStr
        
        paymentLabel.sizeToFit()
        view.addSubview(paymentLabel)
        
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .gray
        
        view.addSubview(dividerView)
        
        let shiftsLabel = UILabel()
        shiftsLabel.translatesAutoresizingMaskIntoConstraints = false
        shiftsLabel.textColor = Styles.shared.primaryTextColor
        let shiftStr = NSMutableAttributedString(string: "Industry: \(job.industry)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        shiftStr.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSRange(location: 0, length: 9))
        shiftsLabel.attributedText = shiftStr
        view.addSubview(shiftsLabel)
        
        let dividerView2 = UIView()
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.backgroundColor = .gray
        
        view.addSubview(dividerView2)
        
        let requirementsLabel = UILabel()
        requirementsLabel.translatesAutoresizingMaskIntoConstraints = false
        requirementsLabel.textColor = Styles.shared.primaryTextColor
        let reqStr = NSMutableAttributedString(string: "Location: \(job.location)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        reqStr.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 0, length: 8))
        requirementsLabel.attributedText = reqStr
        requirementsLabel.numberOfLines = 0
        
        view.addSubview(requirementsLabel)
        
        let dividerView3 = UIView()
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.backgroundColor = .gray
        
        view.addSubview(dividerView3)
        
        let applyButton = UIButton(type: .system)
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.setTitle("Apply for this Job", for: .normal)
        applyButton.backgroundColor = Styles.shared.primaryButtonColor
        applyButton.setTitleColor(UIColor.white, for: .normal)
        applyButton.layer.cornerRadius = 4
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
            paymentLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant:-20),
            
            shiftsLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant:10),
            shiftsLabel.leadingAnchor.constraint(equalTo: paymentLabel.leadingAnchor, constant:0),
            
            requirementsLabel.topAnchor.constraint(equalTo: shiftsLabel.bottomAnchor, constant:10),
            requirementsLabel.leadingAnchor.constraint(equalTo: shiftsLabel.leadingAnchor, constant:0),
            requirementsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0),
            
            applyButton.topAnchor.constraint(equalTo: requirementsLabel.bottomAnchor, constant:10),
            applyButton.leadingAnchor.constraint(equalTo: requirementsLabel.leadingAnchor, constant:0),
            applyButton.heightAnchor.constraint(equalToConstant: 44),
            applyButton.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
    
    @objc private func applyButtonTapped() {
        // Handle apply button tap
    }    
}
