//
//  FlagController.swift
//  FunWithFlags
//
//  Created by Derek Larson on 2016-11-21.
//  Copyright © 2016 Derek Larson. All rights reserved.
//

import UIKit

class FlagController: UIViewController {
    
    var recievedImage: UIImage? = nil
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagView.image = recievedImage
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
