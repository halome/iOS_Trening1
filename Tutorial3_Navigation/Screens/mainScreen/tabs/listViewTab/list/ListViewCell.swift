//
//  TableCell.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 01/12/2020.
//

import UIKit
import SnapKit

class ListViewCell: UICollectionViewCell {
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    let image: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "Godfather.jpg")
        imageView.contentMode = .center
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label:UILabel = UILabel()
        
        return label;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        setupLayout()
    }
    
    public func set(user: User) {
        print("TableCell user = \(user)")
        
        nameLabel.text = user.name
    }
    
    private func setupLayout() {
        contentView.addSubview(stackView)
        stackView.pin()

        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
