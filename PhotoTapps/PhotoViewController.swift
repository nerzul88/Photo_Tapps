//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Александр Касьянов on 10.11.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage?

    @IBOutlet weak var photoImageView: UIImageView!
    
    //реализация функционала "поделиться"
    @IBAction func shareAction(_ sender: Any) {
        //получаем контроллер для возможности "поделиться" и передаём туда изображение
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        //отслеживаем действие
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Sucsess!")
            }            
        }
        //отображаем контроллер
        present(shareController, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = image
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
