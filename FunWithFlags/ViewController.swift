//
//  ViewController.swift
//  FunWithFlags
//
//  Created by Derek Larson on 2016-11-18.
//  Copyright © 2016 Derek Larson. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDelegate/*, UIPickerViewDataSource*/ {

    @IBOutlet weak var countrySelector: UIPickerView!
    @IBOutlet weak var flagImages: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    private var countryArray: [String] = []
    private var countryArray2 = ["test", "test2"]
    private var rowSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //countrySelector.dataSource = self
        Alamofire.request("https://restcountries.eu/rest/v1/all").responseJSON { response in
            if let JSON = response.result.value {
                for country in JSON as! [Dictionary<String, AnyObject>] {
                    self.countryArray.append(country["name"] as! String)
                }
                print(self.countryArray)
                print(self.countryArray.count)
                print(self.countryArray[1])
            }
        }
        
        countrySelector.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(countryArray.count)
        return countryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row
    }

}

