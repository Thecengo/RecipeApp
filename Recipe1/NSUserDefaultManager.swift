//
//  NSUserDefaultManager.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 23.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class NSUserDefaultManager: NSObject {
    
    static let userDefaults = UserDefaults.standard
    
    class func synchronize() {
        do {
            let myData = try NSKeyedArchiver.archivedData(withRootObject: RecipeManager.recipes, requiringSecureCoding: false)
            UserDefaults.standard.set(myData, forKey: "recipearray")
            UserDefaults.standard.synchronize()
        } catch {
            
            print("error is \(error.localizedDescription)")

        }
        
    }
    
    class func initializee() {
        
        do {
             if let recipesRaw = UserDefaults.standard.data(forKey: "recipearray") {
                if let recipes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(recipesRaw) as? [Recipe] {
                         RecipeManager.recipes = recipes
                     }
                 }
        } catch {
            print("error is \(error.localizedDescription)")
        }
     
    }

}
