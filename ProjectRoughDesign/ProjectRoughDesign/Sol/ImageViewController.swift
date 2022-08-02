//
//  ImageViewController.swift
//  ProjectRoughDesign
//
//  Created by 김한솔 on 2022/07/20.
//

import SnapKit

final class ImageViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var colorPickerButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "mainColor2")
        var title = AttributedString("글씨 색깔 변경")
        title.font = .systemFont(ofSize: 17, weight: .semibold)
        configuration.attributedTitle = title
        configuration.image = UIImage(systemName: "paintpalette", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .semibold))
        configuration.imagePadding = .init(5)
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showColorPicker(_:)), for: .touchUpInside)
        return button
    }()

    private let stylePickerButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "mainColor2")
        var title = AttributedString("글씨 스타일 변경")
        title.font = .systemFont(ofSize: 17, weight: .semibold)
        configuration.attributedTitle = title
        configuration.image = UIImage(systemName: "scribble", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .semibold))
        configuration.imagePadding = .init(5)
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)

        imageView.image = image
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupUI() {
        view.backgroundColor = UIColor(named: "mainColor1")
        view.addSubview(imageView)
        view.addSubview(colorPickerButton)
        view.addSubview(stylePickerButton)

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(
                systemName: "chevron.backward",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)),
            style: .plain,
            target: self,
            action: #selector(asd)
        )
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(named: "mainColor2")
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        imageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view)
        }

        colorPickerButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(100)
            make.leading.equalTo(view).offset(15)
            make.trailing.equalTo(view).inset(15)
            make.height.equalTo(50)
        }

        stylePickerButton.snp.makeConstraints { make in
            make.top.equalTo(colorPickerButton.snp.bottom).offset(30)
            make.leading.trailing.height.equalTo(colorPickerButton)
        }
    }

    @objc
    private func asd() {
        dismiss(animated: true)
    }

    @objc
    private func showColorPicker(_ sender: Any) {
        let pickerView = UIColorPickerViewController()
        pickerView.view.backgroundColor = UIColor(named: "mainColor1")
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(pickerView, animated: true)
        }
    }
}
