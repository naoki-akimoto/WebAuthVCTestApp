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

    @IBAction func loginKiiSocialConnectClicked(_sendor: Any) {
        //dismiss(animated: true, completion: {
            KiiSocialConnect.log(in: .OpenIDConnectSimple, options: nil, block: {
                (user, provider, error) in
            })
        //})
    }

    @IBAction func loginKiiUserClicked(_sendor: Any) {
        //dismiss(animated: true, completion: {
            KiiUser.login(withWebAuth: KiiOpenIDConnectProvider.provider(), block: {
                (user, error) in
                var msg: String
                if (error != nil) {
                    msg = "KiiUser.login failed: " + error!.localizedDescription
                } else {
                    msg = "KiiUser.login succeeded: " + user!.userID!
                }
                if let handler = self.resultHandler {
                    handler(msg)
                }
            })
        //})
    }

    @IBAction func loginNewOneClicked(_sendor: Any) {
        let vc = KiiUser.webAuthLoginNavigationController(KiiOpenIDConnectProvider.provider(), block: {
            (user, error) in
            var msg: String
            if (error != nil) {
                msg = "KiiUser.webAuthLoginNavigationController failed: " + error!.localizedDescription
            } else {
                msg = "KiiUser.webAuthLoginNavigationController succeeded: " + user!.userID!
            }
            if let handler = self.resultHandler {
                handler(msg)
            }
        })
        //self.addChildViewController(vc)
        self.present(vc, animated: true, completion: {
        })
    }
}
