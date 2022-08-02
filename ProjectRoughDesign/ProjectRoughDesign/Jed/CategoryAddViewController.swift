import UIKit

class CategoryAddViewController: UIViewController {
    
    private let formView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " 카테고리 입력"
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.dismiss(animated: false)
        }), for: .touchDown)
        
        button.setTitle("\t닫기\t", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.dismiss(animated: false)
        }), for: .touchDown)
        
        button.setTitle("\t저장\t", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        
        view.addSubview(formView)
        NSLayoutConstraint.activate([
            formView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            formView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            formView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            formView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.18)
        ])
        
        formView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: -20),
            closeButton.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -35)
        ])
        
        formView.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: -20),
            saveButton.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 35)
        ])
        
        formView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 35),
            textField.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -35),
            textField.heightAnchor.constraint(equalTo: formView.heightAnchor, multiplier: 0.25),
            textField.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -22)
        ])
    }
}
