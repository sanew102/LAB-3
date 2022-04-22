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
    
    private let contacts: [CellConfigurator] = [ContactsTableViewCellConfigurator(item: User.users[0]),
                                                ContactsTableViewCellConfigurator(item: User.users[0]),
                                                ContactsTableViewCellConfigurator(item: User.users[0])
                                                ]
    
    let addNewContactsLabel : UILabel = {
        let label = UILabel()
        label.text = "Add New Contacts".locolized()
        label.textColor = UIColor().tableViewColor
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    
    let addNewContactTableView : UITableView = {
        let tebleView = UITableView()
        return tebleView
    }()
    
    let youMightKnowThem : UILabel = {
        let label = UILabel()
        label.text = "You Might Know Them".locolized()
        label.textColor = UIColor().tableViewColor
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.largeContentTitle = "Undeme"
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewContactTableView.dataSource = self
        contactsTableView.dataSource = self
        configureView()
        setupNavigationItem()
        setupConstrainst()
        setupStatusBarColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNewContactTableView.estimatedRowHeight = 100
        addNewContactTableView.rowHeight = UITableView.automaticDimension
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
        view.addSubviews(addNewContactsLabel, addNewContactTableView, youMightKnowThem, contactsTableView)
        addNewContactTableView.separatorStyle = .none
        contactsTableView.separatorStyle = .none
    }
    
    private func setupConstrainst() {
        addNewContactsLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15.67)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(16)
        }
        addNewContactTableView.snp.makeConstraints { make in
            make.top.equalTo(addNewContactsLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(116)
        }
        youMightKnowThem.snp.makeConstraints { make in
            make.top.equalTo(addNewContactTableView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(28)
        }
        contactsTableView.snp.makeConstraints { make in
            make.top.equalTo(youMightKnowThem.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
}

extension AddNewFriendViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == addNewContactTableView {
            let item = items[indexPath.row]
            tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            return cell
        }
        if tableView == contactsTableView {
            let item = contacts[indexPath.row]
            tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            return cell
        }
        return UITableViewCell()
        
    }
}
