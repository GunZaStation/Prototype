//
//  BigCell.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/20.
//

import SnapKit

final class BigCell: UICollectionViewCell {
    static let identifier = String(describing: BigCell.self)

    private let cellViewController = CellViewController()

    private var data = [UIImage?]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true

        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ images: [UIImage?]) {
        data = images
        cellViewController.updateImages(images)
        cellViewController.reloadCollectionView()
    }

    private func setupUI() {
        addSubview(cellViewController.view)

        cellViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
