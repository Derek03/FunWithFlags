//
//  ViewController.swift
//  FunWithFlags
//
//  Created by Derek Larson on 2016-11-18.
//  Copyright © 2016 Derek Larson. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var countrySelector: UIPickerView!
    private var countryArray: [String] = []
    private var abbreviation: [String] = []
    private var rowSelected = 0
    private var flag: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://restcountries.eu/rest/v1/all").responseJSON { response in
            if let JSON = response.result.value {
                for country in JSON as! [Dictionary<String, AnyObject>] {
                    self.countryArray.append(country["name"] as! String)
                    self.abbreviation.append(country["alpha2Code"] as! String)
                }
                print(self.countryArray)
                print(self.countryArray.count)
                print(self.abbreviation)
                print(self.abbreviation.count)
                self.countrySelector.reloadAllComponents()
            }
        }
        
        countrySelector.delegate = self
        countrySelector.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func getFlag(_ code: String) {
        let URL = "http://www.geognos.com/api/en/countries/flag/"+code+".png"
        print(URL)
        Alamofire.request(URL).responseImage { response in
            if let PNG = response.result.value {
                self.flag = PNG
            }
        }
    }
    
    @IBAction func flagButtonPress(_ sender: AnyObject) {
        getFlag(abbreviation[rowSelected])
        let vc = FlagController()
        vc.flagImage.image =
    }
}

