//
//  BookmarkListViewController.swift
//  Translate
//
//  Created by 이준혁 on 2023/01/09.
//

import SnapKit
import UIKit

final class BookmarkListViewController: UIViewController {
    private var bookmark: [Bookmark] = []
    
    private lazy var collectionView: UICollectionView = {
        
//        let defaultInset: CGFloat = 16.0
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(
            width: view.frame.width - (defaultSpacing * 2),
            height: 100.0)
        flowLayout.sectionInset = UIEdgeInsets(
            top: defaultSpacing,
            left: defaultSpacing,
            bottom: defaultSpacing,
            right: defaultSpacing)
        flowLayout.minimumLineSpacing = defaultSpacing
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(
            BookmarkCollectionViewCell.self,
            forCellWithReuseIdentifier: BookmarkCollectionViewCell.identifier)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        navigationItem.title = "즐겨찾기"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bookmark = UserDefaults.standard.bookmarks
    }
}

extension BookmarkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.bookmark.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookmarkCollectionViewCell.identifier,
            for: indexPath) as? BookmarkCollectionViewCell
        
        cell?.setup()
        
        return cell ?? UICollectionViewCell()
    }
}

private extension BookmarkListViewController {
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
