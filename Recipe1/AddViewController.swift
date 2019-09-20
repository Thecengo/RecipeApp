///Users/cengizyilmaz/Desktop/Ios Project/Recipe1/Recipe1/DetailViewController.swift
//  AddViewController.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didCompleteTask = Notification.Name("didCompleteTask")
    static let completedLengthyDownload = Notification.Name("completedLengthyDownload")
}

class AddViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var recipeContent: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonClick(_ sender: Any) {
        recipeContent.resignFirstResponder()
    }
    
    @IBAction func titleDoneButtonClick(_ sender: Any) {
        titleText.resignFirstResponder()
    }
    
    @objc func onDidReceiveData (_ notification: Notification){
        handleDoneButtonState()
    }
    
    func handleDoneButtonState(){
        if recipeContent.text != "" {
            doneButton.isEnabled = true
        }
        else{
            doneButton.isEnabled = false
        }
        
        if titleText.text != "" && recipeContent.text != ""{
            addButton.isEnabled = true
            addButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        else {
            addButton.isEnabled = false
            addButton.setTitleColor(UIColor.yellow, for: UIControl.State.normal)
            
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

}
