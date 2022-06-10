//
//  MyGroupsViewController.swift
//  Facebook
//
//  Created by Дария Бебчик on 10.06.2022.
//

import UIKit

class MyGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var groups = [Group]()
    let customTableViewCellReuse = "customTableViewCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didPressToGroup(_:)), name: Notification.Name("PressToGroup"), object: nil)
    }
    
    @objc func didPressToGroup(_ notification: Notification){
        guard let group = notification.object as? Group else { return }
        
        if !groups.contains(where: { groupItem in
            groupItem.name == group.name
        }) {
            groups.append(group)
            tableView.reloadData()
        }
}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


extension MyGroupsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as! CustomTableViewCell
            
            cell.configure(groups[indexPath.item])
            return cell
        }
    
}

extension MyGroupsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
}
