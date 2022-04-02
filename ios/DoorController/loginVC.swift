//
//  loginVC.swift
//  DoorController
//
//  Created by 楊承學 on 2022/4/2.
//

import UIKit
import LocalAuthentication

class loginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //checkFace()
    }
    
    //禁止翻轉
    override var shouldAutorotate: Bool{
        return false
    }
    
    func checkFace(){
        // 創建 LAContext 實例
        let context = LAContext()
        // 設置取消按鈕標題
        context.localizedCancelTitle = "Cancel"
        // 宣告一個變數接收 canEvaluatePolicy 返回的錯誤
        var error: NSError?
        // 評估是否可以針對給定方案進行身份驗證
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // 描述使用身份辨識的原因
            let reason = "登入以控制鐵捲門"
            // 評估指定方案
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
                if success {
                    DispatchQueue.main.async { [unowned self] in
                        self.performSegue(withIdentifier: "segue_controller", sender: self)
                    }
                } else {
                    DispatchQueue.main.async { [unowned self] in}
                }
            }
        }
    }

    @IBAction func faceid(_ sender: Any) {
        checkFace()
    }
}
