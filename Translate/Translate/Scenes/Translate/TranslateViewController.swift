//
//  TranslateViewController.swift
//  Translate
//
//  Created by 이준혁 on 2023/01/06.
//

import SnapKit
import UIKit

final class TranslateViewController: UIViewController {
    
    private var sourceLanguage: Language = .ko
    private var targetLanguage: Language = .en
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(sourceLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(
            self,
            action: #selector(didTapSourceLanguageButton),
            for: .touchUpInside)
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(targetLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(
            self,
            action: #selector(didTapTargetLanguageButton),
            for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        [sourceLanguageButton, targetLanguageButton].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = UIColor.mainTintColor
        label.text = "Hello"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapCopyButton() {
        UIPasteboard.general.string = resultLabel.text
    }
    
    private lazy var sourceLabelBaseButton: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGestureLabelBaseButton))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
                                             
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.text = "텍스트 입력"
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        setupViews()
    }
}

extension TranslateViewController: SourceTextViewControllerDelegate {
    func didEnterText(_ sourceText: String) {
//        if sourceText == "" { return }
        if sourceText.isEmpty { return }
        
        sourceLabel.text = sourceText
        sourceLabel.textColor = .label
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}

private extension TranslateViewController {
    func setupViews() {
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            bookmarkButton,
            copyButton,
            sourceLabelBaseButton,
            sourceLabel
        ].forEach { view.addSubview($0) }
        
//        let defaultSpacing: CGFloat = 16.0
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(defaultSpacing)
            $0.trailing.equalToSuperview().inset(defaultSpacing)
            $0.height.equalTo(50.0)
        }
        
        resultBaseView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSpacing)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bookmarkButton.snp.bottom).offset(defaultSpacing)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(resultBaseView.snp.top).inset(24.0)
            $0.leading.equalTo(resultBaseView.snp.leading).inset(24.0)
            $0.trailing.equalTo(resultBaseView.snp.trailing).inset(24.0)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.leading.equalTo(resultLabel.snp.leading)
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.width.height.equalTo(40.0)
        }
        
        copyButton.snp.makeConstraints {
            $0.leading.equalTo(bookmarkButton.snp.trailing).inset(8.0)
            $0.top.equalTo(bookmarkButton.snp.top)
            $0.width.height.equalTo(40.0)
        }
        
        sourceLabelBaseButton.snp.makeConstraints {
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultSpacing)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
//            $0.bottom.equalToSuperview().inset(tabBarController?.tabBar.frame.height ?? 0.0)
        }
        
        sourceLabel.snp.makeConstraints {
            $0.top.equalTo(sourceLabelBaseButton.snp.top).inset(24.0)
            $0.leading.equalTo(sourceLabelBaseButton.snp.leading).inset(24.0)
            $0.trailing.equalTo(sourceLabelBaseButton.snp.trailing).inset(24.0)
        }
    }
    
    @objc func didTapGestureLabelBaseButton() {
        let viewController = SourceTextViewController(delegate: self)
        present(viewController, animated: true)
    }
    
    @objc func didTapSourceLanguageButton() {
        didTapLanguageButton(type: .source)
    }
    
    @objc func didTapTargetLanguageButton() {
        didTapLanguageButton(type: .target)
    }
    
    func didTapLanguageButton(type: Type) {
        let alertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet)
        Language.allCases.forEach { language in
            let action = UIAlertAction(
                title: language.title,
                style: .default) { [weak self] _ in
                    switch type {
                    case .source:
                        self?.targetLanguage = language
                        self?.sourceLanguageButton.setTitle(language.title, for: .normal)
                    case .target:
                        self?.targetLanguage = language
                        self?.targetLanguageButton.setTitle(language.title, for: .normal)
                    }
                }
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc func didTapBookmarkButton() {
        guard
            let sourceText = sourceLabel.text,
            let translatedText = resultLabel.text,
            bookmarkButton.imageView?.image == UIImage(systemName: "bookmark")
        else { return }
        
        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        
        let currentBookmarks: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(
            sourceLanguage: sourceLanguage,
            translatedLanguage: targetLanguage,
            sourceText: sourceText,
            translatedText: translatedText)
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmarks
        
        print(UserDefaults.standard.bookmarks)
    }
}
