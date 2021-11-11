//
//  Image_Manager.swift
//  Assignment3-Miit
//
//  Created by user202387 on 11/8/21.
//

import Foundation

class ImageManager {
    
    private var listofimage = [ImageList]()
    
    func addNewImage(ni: ImageList) {
        listofimage.append(ni)
    }
    
    func getAllImages() -> [ImageList]{
        return listofimage
    }
    
}

