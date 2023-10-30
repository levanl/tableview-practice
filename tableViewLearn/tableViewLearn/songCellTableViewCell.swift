//
//  songCellTableViewCell.swift
//  tableViewLearn
//
//  Created by Levan Loladze on 30.10.23.
//

import UIKit

final class songCellTableViewCell: UITableViewCell {

    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Song) {
        nameLabel.text = model.name
    }
    
    
    func setupLabel() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
