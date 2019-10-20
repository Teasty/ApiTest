//
//  Detail.swift
//  ApiTest
//
//  Created by Андрей Лихачев on 20.10.2019.
//  Copyright © 2019 Андрей Лихачев. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var editDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func config(response: List.Models.Response){
        if response.creationDate == response.lastEditDate {
            self.creationDate.text = self.creationDate.text! + " " + dateFromStamp(unixtimeInterval: response.creationDate)
            self.editDate.text = self.editDate.text! + " -"
        } else {
            self.creationDate.text = self.creationDate.text! + " " + dateFromStamp(unixtimeInterval: response.creationDate)
            self.editDate.text = self.editDate.text! + " " + dateFromStamp(unixtimeInterval: response.lastEditDate)
            }

            
        self.noteTextView.text = response.noteText
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
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
        
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

