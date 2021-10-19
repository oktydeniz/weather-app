//
//  DetailViewController.swift
//  weather app
//
//  Created by oktay on 19.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city  = String()
    @IBOutlet weak var cityWeather: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = city
        getTodayWeatherResult(c: city)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    func getTodayWeatherResult(c:String){
        //
        if let url =  URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(c)&appid=93406ea9dee5c000000000000008f"){
            let request = URLRequest(url:url)
            let task =  URLSession.shared.dataTask(with: request){(data,response,error) in
                
                if error == nil{
                    if let currentdata = data {
                        do{
                            let json = try JSONSerialization.jsonObject(with: currentdata, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:String]
                            
                            if let main = json["main"] as? NSDictionary{
                               if let temp = main["temp"] as? Double{
                                   let state = Int(temp - 273.15)
                                   DispatchQueue.main.sync {
                                       self.cityWeather.text = String(state)
                                   }
                                }
                                
                            }
                        }catch{
                            print("Some thing not right")
                        }
                    }
                }
            }
            task.resume()
            
        }
        
        
    }
    

}
