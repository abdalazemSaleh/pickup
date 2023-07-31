//
//  MessagesTableViewCell.swift
//  pickup
//
//  Created by magdi sherif on 17/07/2023.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageType: UILabel!
    @IBOutlet weak var messageSenderTitle: UILabel!
    @IBOutlet weak var messageSenderNumber: UILabel!
    @IBOutlet weak var messageSenderName: UILabel!
    @IBOutlet weak var messageImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageImageView.layer.cornerRadius = messageImageView.frame.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(model: Message) {
        messageType.text = model.messageType
        messageSenderName.text = model.name
        messageSenderTitle.text = model.title
        messageImageView.image = model.image
        messageSenderNumber.text = "\(model.number)"
    }
    
}

