//
//  Recipe.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    
    var title : String?
    var content : String?
    
    init (title: String, content: String){
        self.title = title
        self.content = content 
    }
    
    override init() {
        super.init()
    }

}
