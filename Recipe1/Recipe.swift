//
//  Recipe.swift
//  Recipe1
//
//  Created by Cengiz Yılmaz on 19.09.2019.
//  Copyright © 2019 Cengiz Yılmaz. All rights reserved.
//

import UIKit

class Recipe: NSObject,NSCoding {
 
    
    var title : String?
    var content : String?
    
    init (title: String, content: String){
        self.title = title
        self.content = content 
    }
    
    override init() {
        super.init()
    }
    func encode(with coder: NSCoder) {
        if let titleEncoded = title {
            coder.encode(titleEncoded, forKey: "title")
        }
        if let contentEncoded = content {
            coder.encode(contentEncoded, forKey: "content")
        }
     }
     
     required init?(coder: NSCoder) {
         if let titleDecoded = coder.decodeObject(forKey: "title") as? String{
             title = titleDecoded
         }
        if let contentDecoded = coder.decodeObject(forKey: "content") as? String{
            content = contentDecoded
        }
     }
     

}
