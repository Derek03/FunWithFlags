//
//  ViewController.swift
//  FunWithFlags
//
//  Created by Derek Larson on 2016-11-18.
//  Copyright © 2016 Derek Larson. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var countrySelector: UIPickerView!
    @IBOutlet weak var flagImages: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    private var countryArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://restcountries.eu/rest/v1/all").responseJSON { response in
            if let JSON = response.result.value {
                for country in JSON as! [Dictionary<String, AnyObject>] {
                    self.countryArray.append(country["name"] as! String)
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

