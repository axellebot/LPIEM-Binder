//
//  ConversationsView.swift
//  Binder
//
//  Created by axellebot on 05/04/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

class ConversationsView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    // MARK: Properties
    private var conversations: [Conversation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        conversations.append(Conversation(id: "1", label: "Conv1"))
        conversations.append(Conversation(id: "2", label: "Conv2"))
        conversations.append(Conversation(id: "3", label: "Conv3"))
        self.tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 2
        
                return conversations.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.conversationCell, for: indexPath)!
        cell.textLabel?.text = conversations[indexPath.row].label
        return cell
    }

}

