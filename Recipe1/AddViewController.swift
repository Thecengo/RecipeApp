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

class AddViewController: UIViewController, UIDocumentPickerDelegate{

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var recipeContent: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func iCloudDocsClick(_ sender: Any) {
        let documentPicker : UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.txt"], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt url: URL) {
        if controller.documentPickerMode == UIDocumentPickerMode.import {
            let content = openFile(path: url.path, utf8: String.Encoding.utf8)
            recipeContent.text = content
        }
    }
    
    func openFile(path: String, utf8: String.Encoding = String.Encoding.utf8) -> String? {
        var isDir : ObjCBool = false
        let filemanager = FileManager.default
        do {
            return try filemanager.fileExists(atPath: path, isDirectory:&isDir) ? String(contentsOfFile: path, encoding: utf8) : nil
        } catch{
            print("error is \(error.localizedDescription)")
        }
        return nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonClick(_ sender: Any) {
        activityIndicator.startAnimating()
    
        RecipeManager.addRecipe(title: titleText.text!, content: recipeContent.text)
        titleText.text = ""
        recipeContent.text = ""
        
        activityIndicator.stopAnimating()
      
        NSUserDefaultManager.synchronize()
        
        iCloudManager.sendToCloud()
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
