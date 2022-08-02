import UIKit

final class PurposeAddViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12.5
        return stackView
    }()
    
    private let titleField: InsertField = {
        let insertField = InsertField()
        insertField.translatesAutoresizingMaskIntoConstraints = false
        insertField.title = "제목"
        insertField.placeholder = "문자열 입력"
        return insertField
    }()
    
    private let descriptionField:InsertField = {
        let insertField = InsertField()
        insertField.translatesAutoresizingMaskIntoConstraints = false
        insertField.title = "설명"
        insertField.placeholder = "문자열 입력"
        return insertField
    }()
    
    private let periodField:InsertField = {
        let insertField = InsertField()
        insertField.translatesAutoresizingMaskIntoConstraints = false
        insertField.title = "목표 기간"
        insertField.placeholder = "문자열 입력"
        return insertField
    }()
    
    private let timeField:InsertField = {
        let insertField = InsertField()
        insertField.translatesAutoresizingMaskIntoConstraints = false
        insertField.title = "인증 시간"
        insertField.placeholder = "문자열 입력"
        return insertField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.close()
        }), for: .touchDown)
        return button
    }()
    
    private lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(buttonPressed(_:)))
        return button
    }()
    
    @objc private func buttonPressed(_ sender: Any) {
        close()
    }
    
    override func viewDidLoad() {
        
        addViews()
        setAttributes()
    }
    
    private func close() {
        dismiss(animated: true)
    }
    
    private func addViews() {
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        stackView.addArrangedSubview(titleField)
        stackView.addArrangedSubview(descriptionField)
        stackView.addArrangedSubview(periodField)
        stackView.addArrangedSubview(timeField)
        
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            saveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func setAttributes() {
        
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "새로운 목표 만들기"
    }
}
