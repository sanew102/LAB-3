//
//  AddNewFriendViewController.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 19.04.2022.
//

import UIKit

class AddNewFriendViewController: UIViewController {
    private let items: [CellConfigurator] = [
        FromContactsTableViewCellConfigurator(item: Cell(text: "From Contacts ", image: "book")),
        ByUserNameTableViewCellConfigurator(item: Cell(text: "By Username", image: "signature")),
        ByPhoneNumberCellConfigurator(item: Cell(text: "By Phone Number", image: "phone.connection"))
    ]
    private let contacts: [CellConfigurator] = [
        ContactsTableViewCellConfigurator(item: User.users[0]),
        ContactsTableViewCellConfigurator(item: User.users[0]),
        ContactsTableViewCellConfigurator(item: User.users[0])
    ]
    
    let myTableView : UITableView = {
        let tebleView = UITableView()
        return tebleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        configureView()
        setupNavigationItem()
        setupConstrainst()
        setupStatusBarColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.estimatedRowHeight = 100
        myTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Add New Friend".locolized()
        UINavigationBar.appearance().backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
    }
    
    private func setupStatusBarColor() {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = .secondarySystemBackground
             UIApplication.shared.keyWindow?.addSubview(statusBar)
        } else {
            UIApplication.shared.statusBarView?.backgroundColor = .secondarySystemBackground
        }
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubviews(myTableView)
        myTableView.separatorStyle = .none
    }
    
    private func setupConstrainst() {
        myTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
}

extension AddNewFriendViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        }
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: CellConfigurator
        if indexPath.section == 0{
            item = items[indexPath.row]
        } else {
            item = contacts[indexPath.row]
        }
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Add New contacts".locolized()
        }
        return "You Might Know Them".locolized()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 0, y: -6, width: 320, height: 28)
        myLabel.font = UIFont.boldSystemFont(ofSize: 22)
        myLabel.textColor = UIColor().tableViewColor
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        let headerView = UIView()
        headerView.addSubview(myLabel)
        return headerView
    }
}
