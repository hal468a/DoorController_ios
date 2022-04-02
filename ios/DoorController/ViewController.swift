//
//  ViewController.swift
//  DoorController
//
//  Created by 楊承學 on 2022/4/1.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var web: UIWebView!
    @IBOutlet var Console: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Console.textAlignment = .center
    }
    
    //禁止翻轉
    override var shouldAutorotate: Bool{
        return false
    }
    
    @IBAction func faceid(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_controller", sender: self)
    }
    
    @IBAction func Up(_ sender: Any) {
        var url = NSURL(string: "http://192.168.0.243/test/1")
        var urlreq = NSURLRequest(url: url! as URL)
        web.loadRequest(urlreq as URLRequest)
        Console.text = "Up"
        
    }
    
    @IBAction func Stop(_ sender: Any) {
        var url = NSURL(string: "http://192.168.0.243/test/0")
        var urlreq = NSURLRequest(url: url! as URL)
        web.loadRequest(urlreq as URLRequest)
        Console.text = "Stop"
        
    }
    
    @IBAction func Lock(_ sender: Any) {
        Console.text = "Locked"
    }
    
    @IBAction func Down(_ sender: Any) {
        Console.text = "Down"
    }
    
}
