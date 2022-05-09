//
//  PaPagoViewController.swift
//  My5 Weeks
//
//  Created by bro on 2022/05/09.
//

import UIKit

import Alamofire
import SwiftyJSON

class PaPagoViewController: UIViewController {

    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var tartgetTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    @IBAction func translateButtonClicked(_ sender: UIButton) {
        postTranslateText(text: sourceTextView.text)
    }
    
    func postTranslateText(text: String?) {
        
        
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "XZYepFe6MOuORvgRH1Vx",
            "X-Naver-Client-Secret" : "fvD4rXIzfn"
        ]
        
        
        let parameters = [
            "source": "ko",
            "target": "en",
            "text": text
        ]
        
        
        AF.request(url, method: .post, parameters: parameters, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let resultText = json["message"]["result"]["translatedText"].stringValue
                
                self.tartgetTextView.text = resultText

                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
