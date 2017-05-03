//
//  ConversationsView.swift
//  Binder
//
//  Created by axellebot on 05/04/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import Firebase

class ConversationsView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    // MARK: Properties
    private var conversations: [Conversation] = []
    private lazy var conversationRef: FIRDatabaseReference = FIRDatabase.database().reference().child("conversations")
    private var conversationRefHandle: FIRDatabaseHandle?

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        observeConversations()
    }
    
    deinit {
        if let refHandle = conversationRefHandle {
            conversationRef.removeObserver(withHandle: refHandle)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        conversations.append(Conversation(id: "1"))
        conversations.append(Conversation(id: "2"))
        conversations.append(Conversation(id: "3"))
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.conversationCell, for: indexPath)!
        cell.textLabel?.text = conversations[indexPath.row].id
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let conversation = conversations[(indexPath as NSIndexPath).row]
            self.performSegue(withIdentifier: "ShowConversation", sender: conversation)
    }

    // MARK: Firebase related methods
    private func observeConversations() {
        // Use the observe method to listen for new
        // channels being written to the Firebase DB
        conversationRefHandle = conversationRef.observe(.childAdded, with: { (snapshot) -> Void in
            let id = snapshot.key
                self.conversations.append(Conversation(id: id))
                self.tableView.reloadData()
            }
        )
    }
}

