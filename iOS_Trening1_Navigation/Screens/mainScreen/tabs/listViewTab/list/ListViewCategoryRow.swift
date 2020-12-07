//
//  CategoryRow.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 06/12/2020.
//

import UIKit
import SnapKit

class ListViewCategoryRow : UITableViewCell {
    weak var delegate: ListViewCellActionsDelegate?
    var row: Int = 0
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0

        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
    
    var users: [User] = []
    
    public func set(row: Int, users: [User]) -> Void {
        self.users = users
        self.row = row
        collectionView.reloadData()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ListViewCell.self, forCellWithReuseIdentifier: Cells.tableCell)
        contentView.addSubview(collectionView)
        collectionView.pin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewCategoryRow : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.rowItemSelected(row: row, item: indexPath.item)
    }
}

extension ListViewCategoryRow : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.tableCell, for: indexPath) as! ListViewCell
        let user: User = users[indexPath.row]
        cell.set(user: user)

        return cell
    }
}

extension ListViewCategoryRow : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }

}
