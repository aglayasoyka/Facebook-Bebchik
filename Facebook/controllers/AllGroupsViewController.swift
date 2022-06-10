//
//  AllGroupsViewController.swift
//  Facebook
//
//  Created by Дария Бебчик on 09.06.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    
    @IBOutlet weak var allGroupsTableBiew: UITableView!
    
    func fillData() -> [Group] {
        let group1 = Group(name: "Cute Cat", avatar: "Cats" )
        let group2 = Group(name: "Cute Dog", avatar: "dog")
        let group3 = Group(name: "Cute Horse", avatar: "horse")
    
        var groupsArray = [Group]()
        groupsArray.append(group1)
        groupsArray.append(group2)
        groupsArray.append(group3)
        return groupsArray
    }
    
    var groups = [Group]()

    
    let customTableViewCellReuse = "customTableViewCellReuse"
    override func viewDidLoad() {
        
        
        groups = fillData()
        super.viewDidLoad()
        allGroupsTableBiew.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        
        allGroupsTableBiew?.delegate = self
        allGroupsTableBiew?.dataSource = self
        
        
    }
}

extension AllGroupsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = allGroupsTableBiew.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as! CustomTableViewCell
            
            cell.configure(groups[indexPath.item])
            return cell
        }
    
}

extension AllGroupsViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let group = groups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("PressToGroup"), object: group)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
}
