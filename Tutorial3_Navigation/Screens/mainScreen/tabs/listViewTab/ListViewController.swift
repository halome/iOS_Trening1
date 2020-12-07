//
//  SecondTabViewController.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit
import SnapKit

struct Cells {
    static let tableRow = "tableRow"
    static let tableCell = "tableCell"
}

enum SecondTabState {
    case none, loading, ready
}

class ListViewController: UIViewController {
    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    
    var users: [[User]] = []{
        didSet {
            uiTableView.reloadData()
        }
    }
    
    var currentState: SecondTabState = .none {
        didSet {
            updateLayout()
        }
    }
    
    let loader: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    let uiTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
        prepareUsers()
    }
    
    func prepareLayout() {
        view.backgroundColor = .white
        title = "List"
    }
    
    func updateLayout() {
        switch currentState {
            case .loading:
                view.addSubview(loader)
                loader.tintColor = .red
                loader.startAnimating()
                loader.snp.makeConstraints { (make) in
                    make.center.equalToSuperview()
                }
                uiTableView.removeFromSuperview()
                break
            case .ready:
                loader.removeFromSuperview()
                configureTable()
                break
            default:
                break
        }
    }
    
    func configureTable() {
        prepareTableLayout()
        setTableDelegates()
        
    }
    
    func prepareTableLayout() {
        view.addSubview(uiTableView)
        uiTableView.estimatedRowHeight = 2;
        uiTableView.rowHeight = 200
        uiTableView.pin()
    }
    
    func setTableDelegates() {
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.register(ListViewCategoryRow.self, forCellReuseIdentifier: Cells.tableRow)
    }
    
    func prepareUsers() -> Void {
        currentState = .loading
        UsersService().fetchAndParseUsers { (newUsers) in
            self.users = [newUsers, newUsers, newUsers, newUsers, newUsers] as [[User]]
            self.currentState = .ready
        }
    }
}

extension ListViewController : UITableViewDelegate, ListViewCellActionsDelegate {
    func rowItemSelected(row: Int, item: Int) {
        let user: User = users[row][item]
        navigationController?.pushViewController(DetailsViewController(user: user), animated: true)
    }
}

extension ListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: Cells.tableRow) as! ListViewCategoryRow
        row.delegate = self
        let rowUsers: [User] = users[indexPath.section]

        row.set(row: indexPath.section, users: rowUsers)

        return row
    }
}
