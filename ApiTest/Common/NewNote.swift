//
//  NewNote.swift
//  ApiTest
//
//  Created by Андрей Лихачев on 20.10.2019.
//  Copyright © 2019 Андрей Лихачев. All rights reserved.
//

import UIKit

class NewNote: UIViewController {
    @IBOutlet weak var notetextView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DoneAction))
        let spase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spase,doneButton], animated: true)
        notetextView.inputAccessoryView = toolBar
        
        notetextView.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func DoneAction(){
        self.view.endEditing(true)
    }
    @IBAction func cansel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dene(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
