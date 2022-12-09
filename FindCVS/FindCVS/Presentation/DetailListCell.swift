//
//  DetailListCell.swift
//  FindCVS
//
//  Created by 이준혁 on 2022/12/09.
//

import UIKit
import SnapKit

class DetailListCell: UITableViewCell {
    let placeNameLabel = UILabel()
    let addressLabel = UILabel()
    let distanceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailListCell {
    
    func setData(_ data: DetailListCellData) {
        self.placeNameLabel.text = data.placeName
        self.addressLabel.text = data.address
        self.distanceLabel.text = data.distance
    }
    
    private func attribute() {
        backgroundColor = .white
        placeNameLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        addressLabel.textColor = .gray
        
        distanceLabel.font = .systemFont(ofSize: 12.0, weight: .light)
        distanceLabel.textColor = .darkGray
    }
    
    private func layout() {
        [placeNameLabel, addressLabel, distanceLabel]
            .forEach{ contentView.addSubview($0) }
        
        placeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12.0)
            $0.leading.equalToSuperview().offset(10.0)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(placeNameLabel.snp.bottom).offset(3.0)
            $0.leading.equalTo(placeNameLabel)
            $0.bottom.equalToSuperview().inset(12.0)
        }
        
        distanceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20.0)
        }
    }
}
