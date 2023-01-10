//
//  BookmarkCollectionViewCell.swift
//  Translate
//
//  Created by 이준혁 on 2023/01/09.
//

import SnapKit
import UIKit

final class BookmarkCollectionViewCell: UICollectionViewCell {
    static let identifier = "BookmarkCollectionViewCell"
    
    private var sourceBookmarkTextStackView = BookmarkTextStackView(
        language: .ko,
        text: "안녕하세요.",
        type: .source)
    
    private var targetBookmarkTextStackView = BookmarkTextStackView(
        language: .en,
        text: "Hello.",
        type: .target)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = defaultSpacing
        
        stackView.layoutMargins = UIEdgeInsets(
            top: defaultSpacing,
            left: defaultSpacing,
            bottom: defaultSpacing,
            right: defaultSpacing)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        [sourceBookmarkTextStackView, targetBookmarkTextStackView].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    func setup() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12.0
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32.0)
        }
    }
}
