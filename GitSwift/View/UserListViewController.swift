//
//  UserListViewController.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Kingfisher

class UserListViewController: BaseViewController {
    
    let disposedBag = DisposeBag()
        
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height)
            make.center.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        assert(viewModel != nil)
        let listViewModel = viewModel as! UserListViewModel
        
        let input = UserListViewModel.Input(trigger: Driver.just(),
                                         selection: tableView.rx.itemSelected.asDriver())
        let output = listViewModel.transform(input: input)
        //Bind Posts to UITableView
        output.users.drive(tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { tv, item, cell in
                cell.textLabel?.text = item.name
                cell.imageView?.kf.setImage(with: URL(string: item.address))
            }.addDisposableTo(disposedBag)
        //Connect Create Post to UI
        output.selectedPost.drive().addDisposableTo(disposedBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
