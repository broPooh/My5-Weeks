//
//  ViewController.swift
//  My5 Weeks
//
//  Created by bro on 2022/05/07.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCurrentWeather()
    }


    func getCurrentWeather() {
        
        
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=9980ef6473d22c2ad12a3def35fb099d"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

