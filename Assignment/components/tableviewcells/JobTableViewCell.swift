import UIKit

class JobTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Styles.shared.primaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Styles.shared.mediumFontSize)
        label.textColor = Styles.shared.secondaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private let paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Styles.shared.mediumFontSize)
        label.textColor = Styles.shared.secondaryTextColor
        return label
    }()
    
    private let shiftDatesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Styles.shared.mediumFontSize)
        label.textColor = Styles.shared.secondaryTextColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(paymentLabel)
        contentView.addSubview(shiftDatesLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            paymentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            paymentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            paymentLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            paymentLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            shiftDatesLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 8),
            shiftDatesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            shiftDatesLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            shiftDatesLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with job: JobModel) {
        titleLabel.text = job.company.name
        descriptionLabel.text = job.description
        paymentLabel.text = "Payment: \(job.salaryRange.max)"
    }
}
