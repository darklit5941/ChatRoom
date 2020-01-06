//
//  HomeViewController.swift
//  ChatRoom
//
//  Created by Hua David on 2020/1/5.
//  Copyright © 2020 darklit. All rights reserved.
//

import UIKit

struct frend {
    let frend_id: Int
    let name: String
    let nick_name: String
    let picture: String
    let description: String
}

struct homeList {
    let frends: [frend]
    let chats: [chat]
}

var homeLists =
    homeList(frends: [
        frend(frend_id: 1, name: "獅子座", nick_name: "獅獅", picture: "leo", description: "森林之王")
    ], chats: [
        chat(chat_id: 1, name: "風象星座討論", picture: "", last_message: "是不是都很瘋?", last_message_time: "12/04")
    ])

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MessageListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    //每個section裡的row個數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return homeLists.frends.count
        }else{
            return homeLists.chats.count
        }
    }
    
    //有幾個section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //section內容
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "好友"
        case 1:
            return "群組"
        default:
            return nil
        }
    }
    
    //row內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageListTableViewCell
        if indexPath.section == 0 {
            let data = homeLists.frends[indexPath.row]
            cell.avatarUIImageView.image = UIImage(named: self.checkImage(pictureName: data.picture))
            cell.nameLabel.text = data.name
            cell.statusLabel.text = data.description
            cell.DateLabel.text = ""
        }else{
            let data = homeLists.chats[indexPath.row]
            cell.avatarUIImageView.image = UIImage(named: self.checkImage(pictureName: data.picture))
            cell.nameLabel.text = data.name
            cell.statusLabel.text = data.last_message
            cell.DateLabel.text = data.last_message_time
        }
        
        return cell
    }
    
    func checkImage(pictureName: String) -> String {
        if pictureName.isEmpty {
            return "user-default"
        }else{
            return pictureName
        }
    }
}
