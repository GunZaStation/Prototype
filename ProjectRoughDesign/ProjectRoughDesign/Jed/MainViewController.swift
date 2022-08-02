import UIKit

final class MainViewController: UIViewController, UICollectionViewDelegate {
   
    private let modelManager = ModelManager()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: .zero, left: .zero, bottom: 15, right: .zero)
        layout.itemSize = CGSize(width: view.frame.width*0.85, height: 110)
        layout.headerReferenceSize = .init(width: view.frame.width*0.85, height: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCell.identifier
        )
        
        collectionView.register(
            CollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CollectionViewHeader.identifier
        )
        
        return collectionView
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "카테고리 생성", style: .plain, target: self, action: #selector(buttonPressed(_:)))
        return button
    }()
    
    @objc private func buttonPressed(_ sender: Any) {
        let addViewController = CategoryAddViewController()
        addViewController.modalPresentationStyle = .overCurrentContext
        present(addViewController, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground        
        navigationItem.rightBarButtonItem = rightButton

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelManager.sections[section].models.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return modelManager.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let model = modelManager.sections[indexPath.section].models[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.identifier, for: indexPath) as? CollectionViewHeader else {
            return UICollectionReusableView()
        }
        
        let title = modelManager.sections[indexPath.section].category
        headerView.configure(title: title)
        headerView.delegate = self
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width: CGFloat = view.frame.width*0.85
        let height: CGFloat = 20
        
        return CGSize(width: width, height: height)
    }
}

extension MainViewController: CollectionViewHeaderDelegate {
    func addButtonTapped() {
        let controller = UINavigationController(rootViewController: PurposeAddViewController())
        navigationController?.present(controller, animated: true)        
    }
}


