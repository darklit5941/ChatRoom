//
//  ViewController.swift
//  ChatRoom
//
//  Created by Hua David on 2019/12/26.
//  Copyright © 2019 darklit. All rights reserved.
//

import UIKit

struct chat{
    let chat_id: Int
    let name: String
    let picture: String
    let last_message: String
    let last_message_time: String
}

var chats = [
    chat(chat_id: 1, name: "水瓶座", picture: "aquarius", last_message: "今天不打射手了", last_message_time: "12/01"),
    chat(chat_id: 2, name: "雙魚座", picture: "pisces", last_message: "ㄎㄎ我要喝水", last_message_time: "01/23"),
    chat(chat_id: 3, name: "牡羊座", picture: "aries", last_message: "不想上班", last_message_time: "03/11"),
    chat(chat_id: 4, name: "金牛座", picture: "taurus", last_message: "我絕對不是小氣, 我只是有原則", last_message_time: "昨天"),
    chat(chat_id: 5, name: "雙子座", picture: "gemini", last_message: "你真的認識我嗎", last_message_time: "11/02"),
    chat(chat_id: 6, name: "巨蟹座", picture: "cancer", last_message: "我要回家了 掰掰", last_message_time: "去年"),
    chat(chat_id: 7, name: "獅子座", picture: "leo", last_message: "是在哈囉?", last_message_time: "前年"),
    chat(chat_id: 8, name: "處女座", picture: "virgo", last_message: "逃不過我的法眼", last_message_time: "2天前"),
    chat(chat_id: 9, name: "天秤座", picture: "libra", last_message: "這樣不公平", last_message_time: "11/11"),
    chat(chat_id: 10, name: "天蠍座", picture: "scorpio", last_message: "給我記住", last_message_time: "12/12"),
    chat(chat_id: 11, name: "射手座", picture: "sagittarius", last_message: "想出去玩", last_message_time: "03/04"),
    chat(chat_id: 12, name: "摩羯座", picture: "capricorn", last_message: "好的 沒關係 我接受", last_message_time: "05/19")
]

class MessageListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MessageListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension MessageListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageListTableViewCell
        let data = chats[indexPath.row]
        cell.avatarUIImageView.image = UIImage(named: data.picture)
        cell.nameLabel.text = data.name
        cell.statusLabel.text = data.last_message
        cell.DateLabel.text = data.last_message_time
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
}
