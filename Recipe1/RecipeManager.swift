//
//  RecipeManager.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    
    static var recipes = [Recipe]()
    
    class func addRecipe(title: String, content: String){
        var r = Recipe(title: title, content: content)
        recipes.append(r)
    }
    
    class func deleteRecipe(id: Int){
        recipes.remove(at: id)
        
    }
    
    class func getRecipe (id: Int) -> Recipe {
        if recipes.count > 0{
            return recipes[id]
        }
        
            return Recipe()
        
    }

}
