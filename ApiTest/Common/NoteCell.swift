//
//  NoteCell.swift
//  ApiTest
//
//  Created by Андрей Лихачев on 20.10.2019.
//  Copyright © 2019 Андрей Лихачев. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var editDateLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(response: List.Models.Response){
        if response.creationDate == response.lastEditDate {
            self.creationDateLabel.text = self.creationDateLabel.text! + " " + dateFromStamp(unixtimeInterval: response.creationDate)
            self.editDateLabel.text = self.editDateLabel.text! + " -"
        } else {
            self.creationDateLabel.text = self.creationDateLabel.text! + " " + dateFromStamp(unixtimeInterval: response.creationDate)
            self.editDateLabel.text = self.editDateLabel.text! + " " + dateFromStamp(unixtimeInterval: response.lastEditDate)
        }
        
        self.noteTextLabel.text = response.noteText.truncate(length: 200)
    }
    
    func dateFromStamp(unixtimeInterval: Double)->String{
        
        let date = Date(timeIntervalSince1970: unixtimeInterval)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
}
extension String{
    func truncate(length: Int, trailing: String = "…") -> String {
        if self.count > length {
            return String(self.prefix(length)) + trailing
        } else {
            return self
        }
    }
}
