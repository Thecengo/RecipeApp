//
//  ViewController.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let array = ["item1","item2","item3"]
    
    @IBOutlet var mainTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "customcell") as! CustomTableViewCell
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        }
        else {
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        
        //cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = array[indexPath.item]
        cell.recipe = cell.textLabel?.text!
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailviewsegue"{
            let cell = sender as! CustomTableViewCell
            let detailViewSegue = segue.destination as! DetailViewController
            detailViewSegue.preRecipe = cell.recipe
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0.5
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.rowHeight = 70
        self.mainTableView.backgroundView = UIImageView(image:UIImage(named:"background"))
    }


}

