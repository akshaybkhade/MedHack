//
//  ViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: FLAnimatedImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
         //imageToText()
        
        view1.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        view2.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        view3.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        view4.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        
        do{
        let path1 : String = Bundle.main.path(forResource: "log", ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        let gifData = try Data(contentsOf: url)
        let imageData3 = FLAnimatedImage(animatedGIFData: gifData)
        imageView.animatedImage = imageData3
        }catch
        {
            
        }
    }
    
    func imageToText()
    {
        let image = UIImage.init(named: "wakeupcat.jpg")!
        let data1 = image.pngData()
        
        let mode = "Printed"
        let filter = "mode=\(mode)"
        
        var urlString = "https://westus.api.cognitive.microsoft.com/vision/v2.0/recognizeText";
        urlString = "\(urlString)?\(filter)"
        
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 30
        
        request.addValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        request.addValue("0e3ecc64876d4ecda3cd99ec08ab29e7", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
       // request.httpBody  = data1
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    @IBAction func alertnativeMedicinAction(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorisationViewController  = mainStoryboard.instantiateViewController(withIdentifier: "MedicineAlternativeViewController") as! MedicineAlternativeViewController
        self.navigationController?.pushViewController(authorisationViewController, animated: true)
    }
    
    @IBAction func synptomCheckerAction(_ sender: Any) {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorisationViewController  = mainStoryboard.instantiateViewController(withIdentifier: "SymptomCheckerInputViewController") as! SymptomCheckerInputViewController
        self.navigationController?.pushViewController(authorisationViewController, animated: true)
    }
    
    @IBAction func medicineReminderAction(_ sender: Any) {
        return;
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorisationViewController  = mainStoryboard.instantiateViewController(withIdentifier: "SymptomCheckerInputViewController") as! SymptomCheckerInputViewController
        self.navigationController?.pushViewController(authorisationViewController, animated: true)
    }
    
    @IBAction func findDoctorMedicinAction(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorisationViewController  = mainStoryboard.instantiateViewController(withIdentifier: "NearestDoctorViewController") as! NearestDoctorViewController
        self.navigationController?.pushViewController(authorisationViewController, animated: true)
    }
}

