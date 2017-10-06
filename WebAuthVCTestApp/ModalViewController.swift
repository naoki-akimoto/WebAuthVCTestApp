//
//  ModalViewController.swift
//  WebAuthVCTestApp
//
//  Created on 2017/09/04.
//
//

import UIKit
import KiiSDK

class ModalViewController: UIViewController {
    var resultHandler : ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            if touch.view!.tag == 1 {
                dismiss(animated: true, completion: nil)
            }
        }
    }

    @IBAction func loginClicked(_sendor: Any) {
        KiiSocialConnect.log(in: AppDelegate.targetProvider, options: nil, block: {
            (user, provider, error) in
            var msg: String
            if (error != nil) {
                msg = "KiiSocialConnect.login failed: " + error!.localizedDescription
            } else {
                msg = "KiiSocialConnect.login succeeded: " + user!.userID!
            }
            if let handler = self.resultHandler {
                handler(msg)
            }
        })
    }

    @IBAction func loginNCClicked(_sendor: Any) {
        let nc = KiiSocialConnect.log(inNavigationController: AppDelegate.targetProvider, block: {
            (user, provider, error) in
            var msg: String
            if (error != nil) {
                msg = "KiiSocialConnect.loginNavigationController failed: " + error!.localizedDescription
            } else {
                msg = "KiiSocialConnect.loginNavigationController succeeded: " + user!.userID!
            }
            if let handler = self.resultHandler {
                handler(msg)
            }
        })
        self.present(nc, animated: true, completion: {
        })
    }
}
