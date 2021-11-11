//
//  ViewController.swift
//  Assignment3-Miit
//
//  Created by user202387 on 11/8/21.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      AddingImageProtocol {

    var imagelist: ImageManager = ImageManager()
    
    @IBOutlet weak var image_picker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var aVC = segue.destination as! addNewImageViewController
        aVC.delegate = self
    }
    
    func controllerDidFinishWithNewImage(ii: ImageList) {
        imagelist.addNewImage(ni: ii)
        image_picker.reloadAllComponents()
        let imageurl = URL(string: imagelist.getAllImages()[0].image_url)
        imageView.loadImage(url: imageurl!)
    }
    
    func controllerDidCancel() {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imagelist.getAllImages().count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imagelist.getAllImages()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let imageurl = URL(string: imagelist.getAllImages()[row].image_url)
        imageView.loadImage(url: imageurl!)
    }
}
extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
