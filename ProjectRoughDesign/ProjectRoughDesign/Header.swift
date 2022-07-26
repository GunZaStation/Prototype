//
//  Header.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/20.
//

import SnapKit
import UIKit

final class Header: UICollectionReusableView {
    static let identifier = String(describing: Header.self)

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.cornerCurve = .continuous
        label.layer.cornerRadius = 10
        label.backgroundColor = UIColor(named: "mainColor2")
        return label
    }()

    private let rabbitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "carrot")
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

    func configure(text: String) {
        dateLabel.text = text
    }

    private func setupUI() {
        addSubview(dateLabel)
        addSubview(rabbitImageView)

        dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).inset(10)
        }

        rabbitImageView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
            make.trailing.equalTo(self).inset(15)
            make.width.equalTo(40)
        }
    }
}
