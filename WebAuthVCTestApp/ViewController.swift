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
        self.label!.accessibilityIdentifier = "Result-Label"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openDialogWithAlertControllerClicked(_sendor: Any) {
        let alertC = UIAlertController(title: "test webview api", message: "select api", preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: "KiiSocialConnect.login", style: .default) {
            action in
            KiiSocialConnect.log(in: AppDelegate.targetProvider, options: nil, block: {
                (user, provider, error) in
                if (error != nil) {
                    self.set(result: "KiiSocialConnect.login failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiSocialConnect.login succeeded. " + user!.userID!)
                }
            })
        })
        alertC.addAction(UIAlertAction(title: "KiiSocialConnect.loginNavigationController", style: .default) {
            action in
            let nc = KiiSocialConnect.log(inNavigationController: AppDelegate.targetProvider, block: {
                (user, provider, error) in
                if (error != nil) {
                    self.set(result: "KiiSocialConnect.loginNavigationController failed. " + error!.localizedDescription)
                } else {
                    self.set(result: "KiiSocialConnect.loginNavigationController succeeded. " + user!.userID!)
                }
            })
            self.present(nc, animated: true, completion: nil)
        })
        alertC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertC.modalTransitionStyle = .crossDissolve
        alertC.modalPresentationStyle = .overCurrentContext
        alertC.isModalInPopover = true
        self.present(alertC, animated: true, completion: nil)
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

