//
//  MyFriendsViewController.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 18.04.2022.
//

import UIKit
import SnapKit

class MyFriendsViewController: UIViewController {
    
    private var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setupView()
        setupContraints()
        setupCellsLayout()
        setupNavigationItem()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setupNavigationItem() {
        navigationItem.title = "My Friends".locolized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search)
        let backItem = UIBarButtonItem()
        backItem.title = "Back".locolized()
        navigationItem.backBarButtonItem = backItem
    }
    
    @objc func addButtonPressed() {
        let vc = AddNewFriendViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func setupView() {
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(UserInfoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupCellsLayout() {
        let viewWidth = (view.frame.size.width / 2) - 20
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: viewWidth , height: viewWidth  )
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        collectionView.collectionViewLayout = layout
    }
    
    private func setupContraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
}

extension MyFriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        User.users.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserInfoCollectionViewCell
        cell.setProps(fullName: User.users[indexPath.row].fullName , isOnline: User.users[indexPath.row].isOnline, profession: User.users[indexPath.row].profession, image: User.users[indexPath.row].profileImage)
        return cell
    }
}
