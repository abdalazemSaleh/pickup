//
//  MessagesVC.swift
//  pickup
//
//  Created by magdi sherif on 13/07/2023.
//

import UIKit

class MessagesVC: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var messagesTableView: UITableView!
    
    
    //MARK: - vars
    var messages: [Message] = [
        
        Message(name: "Mohamed Ahmed", title: "مندوب طلب رقم", number: 25363, messageType: "محادثه مفتوحه", image: UIImage(named: "message1")!),
        Message(name: "Mohamed Ahmed", title: "مندوب طلب رقم", number: 25363, messageType: "محادثه منتهيه", image: UIImage(named: "message2")!),
        Message(name: "Mohamed Ahmed", title: "مندوب طلب رقم", number: 25363, messageType: "محادثه منتهيه", image: UIImage(named: "message3")!),
        Message(name: "Mohamed Ahmed", title: "مندوب طلب رقم", number: 25363, messageType: "محادثه منتهيه", image: UIImage(named: "message4")!)
    ]
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()

    }
    
    //MARK: - Functions
    private func configureTableView() {
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.register(UINib(nibName: "MessagesTableViewCell", bundle: nil), forCellReuseIdentifier: "MessagesTableViewCell")
    }
    


}


extension MessagesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesTableViewCell") as! MessagesTableViewCell
        cell.configureCell(model: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        messages.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletAction = UIContextualAction(style: .destructive, title: "delete") { action, view, handler in
            self.messages.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            handler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deletAction])
    }
    
    
}


