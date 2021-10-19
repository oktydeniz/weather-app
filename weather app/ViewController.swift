//
//  ViewController.swift
//  weather app
//
//  Created by oktay on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityArea: UITextField!
    @IBOutlet weak var showWeather: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        showWeather.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func showWeatherAction(_ sender: Any) {
        let city = cityArea.text ?? ""
        
        if city.isEmpty {
            let alert = UIAlertController(title: "Warning", message: "Sehir adini giriniz", preferredStyle: .alert)
            let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
            alert.addAction(cancelBtn)
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            vc.city = city
            self.show(vc,sender:nil)
        }
    }
    
}

