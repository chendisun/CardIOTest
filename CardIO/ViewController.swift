//
//  ViewController.swift
//  CardIO
//
//  Created by dison on 15/11/2.
//  Copyright © 2015年 com.disonchen.www.cardio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate{
    @IBOutlet weak var result: UILabel!

    @IBAction func aaa(sender: UIButton) {
                let cardIOPVC = CardIOPaymentViewController(paymentDelegate: self)
                cardIOPVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet
                presentViewController(cardIOPVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startScan(sender: UIButton) {
        print("start")
//        let cardIOPVC = CardIOPaymentViewController(paymentDelegate: self)
//        cardIOPVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet
//        presentViewController(cardIOPVC, animated: true, completion: nil)
    }
    
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        result.text = "Cancel!!!"
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }

    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            result.text = info.cardNumber
        }
        
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

