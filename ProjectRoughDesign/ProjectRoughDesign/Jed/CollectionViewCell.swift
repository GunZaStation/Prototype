import UIKit


final class CollectionViewCell: UICollectionViewCell {
    
    static var identifier: String { .init(describing: self) }
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private let customProgressView: CustomProgressView = {
        let view = CustomProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributes()
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Model) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subtitle
        customProgressView.progress = CGFloat(model.progress) / CGFloat(model.target)
    }
    
    private func setAttributes() {
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    private func addViews() {
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        contentView.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])

        contentView.addSubview(customProgressView)
        NSLayoutConstraint.activate([
            customProgressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customProgressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customProgressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            customProgressView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}


final class CustomProgressView: UIView {
    
    private let carrotIcon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "carrot")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let rabbitIcon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "rabbit")
        imageView.image = image
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let targetView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private var progressViewWidthConstraint: NSLayoutConstraint?
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var progress: CGFloat? {
        didSet {
            progressViewWidthConstraint?.constant = progress ?? 0.1
            progressView.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributes()
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func addViews() {
        
        addSubview(targetView)
        NSLayoutConstraint.activate([
            targetView.centerYAnchor.constraint(equalTo: centerYAnchor),
            targetView.leadingAnchor.constraint(equalTo: leadingAnchor),
            targetView.trailingAnchor.constraint(equalTo: trailingAnchor),
            targetView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        targetView.addSubview(progressView)
        progressViewWidthConstraint = progressView.widthAnchor.constraint(equalTo: targetView.widthAnchor, multiplier: 0.47)
        progressViewWidthConstraint?.isActive = true
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: targetView.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: targetView.leadingAnchor),
            progressView.bottomAnchor.constraint(equalTo: targetView.bottomAnchor)
        ])
        
        addSubview(carrotIcon)
        NSLayoutConstraint.activate([
            carrotIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            carrotIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            carrotIcon.widthAnchor.constraint(equalToConstant: 25),
            carrotIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(rabbitIcon)
        NSLayoutConstraint.activate([
            rabbitIcon.trailingAnchor.constraint(equalTo: progressView.trailingAnchor),
            rabbitIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            rabbitIcon.widthAnchor.constraint(equalToConstant: 35),
            rabbitIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
