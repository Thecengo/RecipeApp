//
//  DetailViewController.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var preRecipe : String?
    @IBOutlet weak var recipeContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = preRecipe
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
