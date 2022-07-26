//
//  TrophyViewController.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/24.
//

import UIKit

final class TrophyViewController: UIViewController {
    private let trophyCollectionView: UICollectionView = {
        let screenSize = UIScreen.main.bounds.size
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: screenSize.width - 20, height: screenSize.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TrophyCell.self, forCellWithReuseIdentifier: TrophyCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    private let data = [
        TrophyData(image: #imageLiteral(resourceName: "goldTrophy"), title: "매일 달리기하기 달성", progresses: 100),
        TrophyData(image: #imageLiteral(resourceName: "silverTrophy"), title: "아침 일찍 일어나기 달성", progresses: 80),
        TrophyData(image: #imageLiteral(resourceName: "bronzeTrophy"), title: "비타민 챙겨먹기 달성", progresses: 50)
    ]

    init() {
        super.init(nibName: nil, bundle: nil)
        trophyCollectionView.dataSource = self

        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.addSubview(trophyCollectionView)
        view.backgroundColor = UIColor(named: "mainColor1")

        trophyCollectionView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalTo(view)
            make.leading.equalTo(view).offset(10)
//            make.trailing.equalTo(view).inset(10)
        }
    }
}

extension TrophyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrophyCell.identifier, for: indexPath) as! TrophyCell

        cell.configure(with: data[indexPath.item])
        return cell
    }
}

struct TrophyData {
    let image: UIImage
    let title: String
    let progresses: CGFloat
}
