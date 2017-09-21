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

    @IBOutlet var label: UILabel?

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
                if (error != nil) {
                    self.set(result: "KiiSocialConnect.login failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiSocialConnect.login succeeded. " + user!.userID!)
                }
            })
        })
        alertC.addAction(UIAlertAction(title: "KiiUser.loginWithWebAuth", style: .default) {
            action in
            KiiUser.login(withWebAuth: KiiReservedProvider1.provider(), block: {
                    (user, error) in
                if (error != nil) {
                    self.set(result: "KiiUser.loginWithWebAuth failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiUser.loginWithWebAuth succeeded. " + user!.userID!)
                }
            })
        })
        alertC.addAction(UIAlertAction(title: "KiiUser.webAuthLoginNavigationController", style: .default) {
            action in
            let vc = KiiUser.webAuthLoginNavigationController(KiiReservedProvider1.provider(), block: {
                (user, error) in
                if (error != nil) {
                    self.set(result: "KiiUser.webAuthLoginNavigationController failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiUser.webAuthLoginNavigationController succeeded. " + user!.userID!)
                }
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
        alertV.addButton(withTitle: "KiiUser.webAuthLoginNavigationController")
        alertV.show()
    }

    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        switch (buttonIndex) {
        case 0:
            KiiSocialConnect.log(in: .Reserved1, options: nil, block: {
                (user, provider, error) in
                if (error != nil) {
                    self.set(result: "KiiSocialConnect.login failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiSocialConnect.login succeeded. " + user!.userID!)
                }
            })
            break;
        case 1:
            KiiUser.login(withWebAuth: KiiReservedProvider1.provider(), block: {
                (user, error) in
                if (error != nil) {
                    self.set(result: "KiiUser.loginWithWebAuth failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiUser.loginWithWebAuth succeeded. " + user!.userID!)
                }
            })
            break;
        case 2:
            let vc = KiiUser.webAuthLoginNavigationController(KiiReservedProvider1.provider(), block: {
                (user, error) in
                if (error != nil) {
                    self.set(result: "KiiUser.webAuthLoginNavigationController failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiUser.webAuthLoginNavigationController succeeded. " + user!.userID!)
                }
            })
            self.present(vc, animated: true, completion: nil)
            break;
        default:
            break;
        }
    }

    func set(result:String) {
        NSLog(result)
        label?.text = result
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ModalViewController

        controller.resultHandler = { result in
            self.set(result: result)
        }
    }
}

