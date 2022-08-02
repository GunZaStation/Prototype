//
//  Cell.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/20.
//

import SnapKit

final class Cell: UICollectionViewCell {
    static let identifier = String(describing: Cell.self)

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerCurve = .continuous
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    private func setupUI() {
        addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(10)
            make.bottom.trailing.equalTo(self).inset(10)
        }
    }
}
