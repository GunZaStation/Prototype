//
//  CellViewController.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/20.
//

import SnapKit

final class CellViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var data = [UIImage?]()
    var contentHeight: CGFloat {
        return imageCollectionView.contentSize.height
    }

    private let imageCollectionView: UICollectionView = {
        let screenSize = UIScreen.main.bounds.size
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: screenSize.width - 100, height: screenSize.width - 100)
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateImages(_ images: [UIImage?]) {
        self.data = images
    }

    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.imageCollectionView.reloadData()
        }
    }

    private func setupUI() {
        view.addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell

        let item = data[indexPath.item]
        cell.imageView.image = item
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageViewController = ImageViewController(image: data[indexPath.item]!)
        let navigation = UINavigationController(rootViewController: imageViewController)

        present(navigation, animated: true)
    }
}
