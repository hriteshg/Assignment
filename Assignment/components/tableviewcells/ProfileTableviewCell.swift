import UIKit

class ProfileTableviewCell: UITableViewCell {
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Customize the cell appearance
        backgroundColor = .white
        
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            cellImageView.widthAnchor.constraint(equalToConstant: 40),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage, title: String) {
        // Configure the cell with the provided image and title
        cellImageView.image = image
        titleLabel.text = title
    }
}
