//
//  HomeViewController.swift
//  ChatRoom
//
//  Created by Hua David on 2020/1/5.
//  Copyright © 2020 darklit. All rights reserved.
//

import UIKit
import Kingfisher

struct frend {
    let frend_id: Int
    let name: String
    let nick_name: String
    let picture: String
    let description: String
}

struct me {
    let id: Int
    let name: String
    let nick_name: String
    let picture: String
    let description: String
}

struct homeList {
    let myinfo: me
    let frends: [frend]
    let chats: [chat]
}

var homeLists =
    homeList(
    myinfo: me(id: 1, name: "水瓶座", nick_name: "水水", picture: "aquarius", description: "水瓶的脾氣都很古怪"),
    frends: [
        frend(frend_id: 1, name: "獅子座", nick_name: "獅獅", picture: "leo", description: "森林之王"),
        frend(frend_id: 2, name: "雙魚座", nick_name: "魚魚", picture: "pisces", description: "我要有水才能活"),
        frend(frend_id: 3, name: "金牛座", nick_name: "牛牛", picture: "taurus", description: "很快就長大了"),
        frend(frend_id: 4, name: "摩羯座", nick_name: "饃饃", picture: "capricorn", description: "不知道要打什麼了"),
        frend(frend_id: 5, name: "射手座", nick_name: "射手", picture: "sagittarius", description: "射到就知道")
    ],
    chats: [
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
        if section == 1 {
            return homeLists.frends.count
        }else if section == 2 {
            return homeLists.chats.count
        }else{
            return 1
        }
    }
    
    //有幾個section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //section內容
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "好友"
        case 2:
            return "群組"
        default:
            return nil
        }
    }
    
    //row內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageListTableViewCell
        if indexPath.section == 1 {
            let data = homeLists.frends[indexPath.row]
            cell.avatarUIImageView.image = UIImage(named: self.checkImage(pictureName: data.picture))
            cell.nameLabel.text = data.name
            cell.numLabel.text = String(data.frend_id)
            cell.statusLabel.text = data.description
            cell.dateLabel.text = ""
        } else if indexPath.section == 2 {
            let data = homeLists.chats[indexPath.row]
            cell.avatarUIImageView.image = UIImage(named: self.checkImage(pictureName: data.picture))
            cell.nameLabel.text = data.name
            cell.numLabel.text = String(data.chat_id)
            cell.statusLabel.text = data.last_message
            cell.dateLabel.text = data.last_message_time
        } else {
            let data = homeLists.myinfo
            let url = URL(string: "https://hbimg.huabanimg.com/c1ff5a4f99383bc50af8d03cd47db21971e5930d3d323-8JyAmf_fw658")
            cell.avatarUIImageView.kf.setImage(with: url)
            cell.nameLabel.text = data.name
            cell.numLabel.text = data.nick_name
            cell.statusLabel.text = data.description
            cell.dateLabel.text = "自己"
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
