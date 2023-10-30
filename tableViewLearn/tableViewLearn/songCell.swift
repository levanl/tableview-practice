//
//  songCell.swift
//  tableViewLearn
//
//  Created by Levan Loladze on 30.10.23.
//

import UIKit

class songCell: UITableViewCell {

    var songImage = UIImageView()
    var songTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(songImage)
        addSubview(songTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        songImage.layer.cornerRadius = 10
    }
    
    func set(song: Song) {
        songImage.image = song.image
        songTitleLabel.text = song.title
    }
    
    func configureTitleLabel() {
        songTitleLabel.numberOfLines = 0
        songTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setImageConstraints() {
        
        songImage.translatesAutoresizingMaskIntoConstraints = false
        songImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        songImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        songImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        songImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setTitleConstraints() {
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        songTitleLabel.leadingAnchor.constraint(equalTo: songImage.trailingAnchor, constant: 20).isActive = true
        songTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        songTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
