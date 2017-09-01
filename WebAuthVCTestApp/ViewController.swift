//
//  ViewController.swift
//  WebAuthVCTestApp
//
//  Created on 2017/08/30.
//
//

import UIKit
import KiiSDK

class ViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        self.isModalInPopover = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openDialogWithAlertControllerClicked(_sendor: Any) {
        let alertC = UIAlertController(title: "test webview api", message: "select api", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "KiiSocialConnect.login", style: .default) {
            action in
            KiiSocialConnect.log(in: .Reserved1, options: nil, block: {
                (user, provider, error) in
            })
        })
        alertC.addAction(UIAlertAction(title: "KiiUser.loginWithWebAuth", style: .default) {
            action in
            KiiUser.login(withWebAuth: KiiReservedProvider1.provider(), block: {
                    (user, error) in
            })
        })
        alertC.addAction(UIAlertAction(title: "new one", style: .default) {
            action in
            let vc = KiiUser.login(withWebAuthViewController: KiiReservedProvider1.provider(), block: {
                (user, error) in
            })
            //self.addChildViewController(vc)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.isModalInPopover = true
            self.present(vc, animated: true, completion: nil)
        })
        alertC.modalTransitionStyle = .crossDissolve
        alertC.modalPresentationStyle = .overCurrentContext
        alertC.isModalInPopover = true
        self.present(alertC, animated: true, completion: nil)
    }

    @IBAction func openDialogWithAlertViewClicked(_sendor: Any) {
        let alertV = UIAlertView(title: "test webview api", message: "select api", delegate: self, cancelButtonTitle: nil)
        alertV.addButton(withTitle: "KiiSocialConnect.login")
        alertV.addButton(withTitle: "KiiUser.loginWithWebAuth")
        alertV.addButton(withTitle: "new one")
        alertV.show()
    }

    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        switch (buttonIndex) {
        case 0:
            KiiSocialConnect.log(in: .Reserved1, options: nil, block: {
                (user, provider, error) in
            })
            break;
        case 1:
            KiiUser.login(withWebAuth: KiiReservedProvider1.provider(), block: {
                (user, error) in
            })
            break;
        case 2:
            let vc = KiiUser.login(withWebAuthViewController: KiiReservedProvider1.provider(), block: {
                (user, error) in
            })
            //self.addChildViewController(vc)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.isModalInPopover = true
            self.present(vc, animated: true, completion: nil)
            break;
        default:
            break;
        }
    }
}

