//
//  TrophyCell.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/24.
//

import SnapKit
import UIKit

final class TrophyCell: UICollectionViewCell {
    static let identifier = String(describing: TrophyCell.self)

    private let trophyView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.layer.cornerCurve = .continuous
        stackView.backgroundColor = UIColor(named: "mainColor2")
        return stackView
    }()

    private let trophyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.setEdgeInset(top: 5, bottom: 5, left: 10, right: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.cornerCurve = .continuous
        label.layer.cornerRadius = 10
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.backgroundColor = UIColor(named: "mainColor2")
        return label
    }()
    
    private let progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.cornerCurve = .continuous
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = UIColor(named: "mainColor2")
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()

    private let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()

    private let progressBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()

    private let doneProgressBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "mainColor3")
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        return view
    }()

    private let undoneProgressBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "mainColor4")
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        trophyView.layer.cornerRadius = trophyView.frame.width/2
    }

    func configure(with trophyData: TrophyData) {
        titleLabel.text = trophyData.title
        trophyImageView.image = trophyData.image
        progressLabel.text = "  \(trophyData.progresses) %"

        doneProgressBarView.snp.makeConstraints { make in
            make.width.equalTo(progressBarStackView.snp.width).multipliedBy(trophyData.progresses/100)
        }

        undoneProgressBarView.snp.makeConstraints { make in
            make.width.equalTo(progressBarStackView.snp.width).multipliedBy((100 - trophyData.progresses) / 100)
        }

        if trophyData.progresses == 100 {
            doneProgressBarView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner)
        }
    }

    private func setupUI() {
        addSubview(trophyView)
        addSubview(titleLabel)
        addSubview(progressStackView)
        trophyView.addArrangedSubview(trophyImageView)
        progressStackView.addArrangedSubview(progressLabel)
        progressStackView.addArrangedSubview(progressBarStackView)
        progressBarStackView.addArrangedSubview(doneProgressBarView)
        progressBarStackView.addArrangedSubview(undoneProgressBarView)
        let screenSize = UIScreen.main.bounds.size

        trophyView.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self).inset(15)
            make.bottom.equalTo(-screenSize.height/2)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(trophyView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(trophyView)
        }

        progressStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(trophyView)
        }

        progressLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
//            make.leading.equalTo(progressStackView).offset(10)
        }

        progressBarStackView.snp.makeConstraints { make in
            make.height.equalTo(20)
//            make.trailing.equalTo(progressStackView).inset(10)
        }
    }
}

final class PaddingLabel: UILabel {
    private var topInset: CGFloat = 0.0
    private var bottomInset: CGFloat = 0.0
    private var leftInset: CGFloat = 0.0
    private var rightInset: CGFloat = 0.0

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)

        return super.drawText(in: rect.inset(by: insets))
    }

    func setEdgeInset(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        topInset = top
        bottomInset = bottom
        leftInset = left
        rightInset = right
    }
}
