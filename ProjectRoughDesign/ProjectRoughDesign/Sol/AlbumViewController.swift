//
//  ViewController.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/19.
//

import UIKit
import SnapKit

final class AlbumViewController: UIViewController {
    private let pictureCollectionView: UICollectionView = {
        let screenSize = UIScreen.main.bounds.size
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenSize.width, height: screenSize.width)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: screenSize.width, height: 50)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BigCell.self, forCellWithReuseIdentifier: BigCell.identifier)
        collectionView.register(
            Header.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Header.identifier
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private let data: [[UIImage?]] = [
        [ #imageLiteral(resourceName: "addString3"), #imageLiteral(resourceName: "addString4"), #imageLiteral(resourceName: "addString2") ],
        [ #imageLiteral(resourceName: "addString1") ],
        [ #imageLiteral(resourceName: "addString0") ]
    ]

    private let headerData: [String] = [
        "  2022년 7월 18일",
        "  2022년 3월 21일",
        "  2022년 3월 22일"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "mainColor1")
        pictureCollectionView.dataSource = self
        setupUI()
    }

    private func setupUI() {
        view.addSubview(pictureCollectionView)

        pictureCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }

}

extension AlbumViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCell.identifier, for: indexPath) as! BigCell
        cell.configure(data[indexPath.section])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header else { return UICollectionReusableView() }
            header.configure(text: "  2022년 3월 21일")
            return header
        }
        return UICollectionReusableView()
    }
}
