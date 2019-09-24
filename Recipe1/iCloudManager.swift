//
//  iCloudManager.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 23.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class iCloudManager: NSObject {
    
    class func getFromCloud(){
        do{
        let iCloudStore = NSUbiquitousKeyValueStore.default
        let fromCloud = iCloudStore.object(forKey: "recipearray") as! Data
            RecipeManager.recipes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(fromCloud) as! [Recipe]
        } catch{
            print("error \(error.localizedDescription)")
        }
       
        
        
    }
    
    class func sendToCloud(){
        do {
            let myData = try NSKeyedArchiver.archivedData(withRootObject: RecipeManager.recipes, requiringSecureCoding: false)
            let iCloudStore = NSUbiquitousKeyValueStore.default
            iCloudStore.set(myData, forKey: "recipearray")
            iCloudStore.synchronize()
        } catch  {
            print("error is \(error.localizedDescription)")
        }
        
    }

}
