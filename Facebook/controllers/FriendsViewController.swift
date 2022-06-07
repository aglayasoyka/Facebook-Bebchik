//
//  FriendsViewController.swift
//  Facebook
//
//  Created by Дария Бебчик on 07.06.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    let customTableViewCelReuseIdentifier = "customTableViewCelReuseIdentifier"
    
    @IBOutlet var myFriendsTableView: UITableView?
    
    func fillData() -> [Friend] {
        let friend1 = Friend(name: "Good Boy", avatar: "Male-Avatar.png")
        let friend2 = Friend(name: "Good Girl", avatar: "Female-Avatar")
        let friend3 = Friend(name: "No Name",avatar: "no-avatar")
    
        var friendsArray = [Friend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        return friendsArray
    }
    
    
    
    var myFriends = [Friend]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFriends = fillData()
        myFriendsTableView?.delegate = self
        myFriendsTableView?.dataSource = self
        myFriendsTableView?.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCelReuseIdentifier)
        
    }


}

extension FriendsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return myFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCelReuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let friend = myFriends[indexPath.row]
        
        cell.configure(image:UIImage(named: friend.avatar!), name: friend.name)
    
        return cell
    }
    
}

extension FriendsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
}

