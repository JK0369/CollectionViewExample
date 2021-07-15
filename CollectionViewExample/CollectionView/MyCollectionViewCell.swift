//
//  MyCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by 김종권 on 2021/07/15.
//

import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {

    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }

    var dataLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }

    private func configure() {
        dataLabel = UILabel()
        dataLabel.font = UIFont.systemFont(ofSize: 32)
        dataLabel.textColor = .label
        dataLabel.textAlignment = .center

        contentView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
