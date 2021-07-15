//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by 김종권 on 2021/07/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var myCollectionView: MyCollectionView!
    private let dataSource = CollectionViewData.data

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()

        registerCollectionView()

        setupCollectionViewDelegate()

    }

    /// CollectionView 초기화
    private func configure() {

        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 7.0)
        collectionViewLayer.minimumLineSpacing = 5
        collectionViewLayer.minimumInteritemSpacing = 1

        /// MyCollectionView()로 단순히 초기화하면 에러가 나므로 MyCollectionView(frame:collectionViewLayout:) 초기화 사용
        /// 만약 collectionViewLayer에 UICollectionViewLayout() 그대로 넣으면 `cellForItemAt`가 불리지 않으므로 주의
        myCollectionView = MyCollectionView(frame: .zero, collectionViewLayout: collectionViewLayer)
        myCollectionView.backgroundColor = .lightGray
        view.addSubview(myCollectionView)

        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.left.right.bottom.equalToSuperview().inset(40)
        }
    }

    private func registerCollectionView() {
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
    }

    private func setupCollectionViewDelegate() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    /// sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

    /// numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    /// cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.dataLabel.text = dataSource[indexPath.item]
        return cell
    }
}
