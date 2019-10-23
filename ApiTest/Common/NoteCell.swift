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
    
    func config(viewModel: List.Models.ViewModel){
        if viewModel.creationDate == viewModel.lastEditDate {
            self.creationDateLabel.text = "Дата создания: " + viewModel.creationDate
            self.editDateLabel.text = "Дата последнего изменения: -"
        } else {
            self.creationDateLabel.text = "Дата создания: " + viewModel.creationDate
            self.editDateLabel.text = "Дата последнего изменения: " +  viewModel.lastEditDate
        }
        
        self.noteTextLabel.text = viewModel.noteText.truncate(length: 200)
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
