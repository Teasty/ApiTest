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
    
    
    weak var viewController: ListViewDataLogic?
    
    var postId = ""
    var text = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DoneAction))
        let spase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spase,doneButton], animated: true)
        noteTextView.inputAccessoryView = toolBar
        
        noteTextView.becomeFirstResponder()
    }
    
    func config(viewModel: List.Models.ViewModel){
        if viewModel.creationDate == viewModel.lastEditDate {
            self.creationDate.text = "Дата создания: " + viewModel.creationDate
            self.editDate.text = "Дата последнего изменения: -"
        } else {
            self.creationDate.text = "Дата создания: " + viewModel.creationDate
            self.editDate.text = " " + viewModel.lastEditDate
            }

        self.postId = viewModel.id
        self.noteTextView.text = viewModel.noteText
        self.text = viewModel.noteText
        }
    
    @IBAction func goBack(_ sender: Any) {
        
        if text != noteTextView.text{
            viewController?.edit(id: postId, body: noteTextView.text)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func DoneAction(){
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

