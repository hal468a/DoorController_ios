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
        sendRequest(address: "http://192.168.0.73/Up")
        Console.text = "Up"
        
    }
    
    @IBAction func Stop(_ sender: Any) {
        sendRequest(address: "http://192.168.0.73/Stop")
        Console.text = "Stop"
        
    }
    
    @IBAction func Lock(_ sender: Any) {
        sendRequest(address: "http://192.168.0.73/Locked")
        Console.text = "Locked"
    }
    
    @IBAction func Down(_ sender: Any) {
        sendRequest(address: "http://192.168.0.73/Down")
        Console.text = "Down"
    }
    
    func sendRequest(address: String){
        var url = NSURL(string:address)
        var urlreq = NSURLRequest(url: url! as URL)
        web.loadRequest(urlreq as URLRequest)
    }
    
}
