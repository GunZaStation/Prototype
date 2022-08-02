import UIKit

final class InsertField: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 9
        return textField
    }()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var placeholder: String = "" {
        didSet {
            textField.placeholder = " \(placeholder)"
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
//        clipsToBounds = true
//        layer.borderColor = UIColor.systemGray4.cgColor
//        layer.borderWidth = 1.0
//        layer.cornerRadius = 10
    }
    
    private func addViews() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
        ])
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            textField.heightAnchor.constraint(equalTo: heightAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
