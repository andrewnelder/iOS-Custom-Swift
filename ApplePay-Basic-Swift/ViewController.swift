//
//  ViewController.swift
//  ApplePay-Basic-Swift
//
//  Created by Andrew Nelder on 10/7/16.
//  Copyright © 2016 Andrew Nelder. All rights reserved.
//

import UIKit
import Stripe

class ViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var mm: UITextField!
    @IBOutlet weak var yy: UITextField!
    @IBOutlet weak var cvv: UITextField!
    
    @IBOutlet var chargeId: UILabel!
    
    @IBAction func createTokenAndCharge(_ sender: AnyObject) {
        let cardParams = STPCardParams()
        cardParams.number = self.number.text!
        cardParams.expMonth = UInt(self.mm.text!)!
        cardParams.expYear = UInt(self.yy.text!)!
        cardParams.cvc = self.cvv.text!
        STPAPIClient.shared().createToken(withCard: cardParams) { (token, error) in
            if let error = error {
                // show the error to the user
            } else if let token = token {
                self.chargeId.text = token.tokenId
                self.submitTokenToBackend(token: token) {
                    // do nothing
                }
            }
        }
    }
    
    func submitTokenToBackend(token: STPToken, completion: dispatch_block_t) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

