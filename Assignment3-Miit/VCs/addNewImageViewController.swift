//
//  addNewImageViewController.swift
//  Assignment3-Miit
//
//  Created by user202387 on 11/8/21.
//

import UIKit

protocol AddingImageProtocol {
    func controllerDidFinishWithNewImage(ii: ImageList)
    
    func controllerDidCancel()
}
class addNewImageViewController: UIViewController {
    
    var delegate: AddingImageProtocol?

    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func add_clicked(_ sender: UIButton) {
        if let name = imageName.text {
            if let url = imageURL.text {
                if !name.isEmpty && !url.isEmpty {
                    let newImage = ImageList(n: name, u: url)
                    delegate?.controllerDidFinishWithNewImage(ii: newImage)
                    dismiss(animated: true, completion: nil)
                    Thread.sleep(forTimeInterval: 1)
                }
            }
        }
    }
    
    @IBAction func cancel_clicked(_ sender: UIButton) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
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
