//
//  ViewController.swift
//  imageDownloading
//
//  Created by elaheh on 2017-08-15.
//  Copyright © 2017 elaheh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // url of our image
        let url = URL(string : "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/300px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg")
        
        //launch a session, create a session that open yhis url
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print("Error")
            }else{
                //where we want save an image
                var documentsDirectory : String?
                
                var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                
                if paths.count>0{
                    documentsDirectory = paths[0]
                    
                    //it is variable that we can refer to my image when i want
                    let savePath = documentsDirectory! + "/mona.jpg"
                    
                    FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                    
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(named: savePath)
                    }
                }
                
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

