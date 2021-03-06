//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 5/12/20.
//

import Foundation

#if os(iOS)
import UIKit
#endif

public extension String {
    
    #if os(iOS)
    
    /*
     文字列を渡してシンプルなUIAlertControllerを表示する。
     Show a simple UIAlertController with the given string.
     */
    @available(iOS 13.0, *)
    func showSimpleAlert(on: UIViewController?) {
        guard let onVC = on else { return }
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "アラート", message: self, preferredStyle: .alert)
            let actionDismiss = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
            alert.addAction(actionDismiss)
            onVC.present(alert, animated: true, completion: nil)
        }
    }
    
    @available(iOS 13.0, *)
    func アラートを表示(on: UIViewController?) {
        showSimpleAlert(on: on)
    }
    
    #endif
    
    //MARK: User Defaults
    
    /*
     UserDefaults.standard.set
     */
    func store(toKey: String) {
        UserDefaults.standard.set(self, forKey: toKey)
    }
    
    func 保存(キーワード: String) { store(toKey: キーワード) }
    
    /*
     UserDefaults.standard.string
     */
    init?(fromUserDefaultsKey: String) {
        guard let retrivedValue = UserDefaults.standard.string(forKey: fromUserDefaultsKey) else { return nil }
        self.init(retrivedValue)
    }
    
    init?(キーワード: String) {
        guard let retrivedValue = UserDefaults.standard.string(forKey: キーワード) else { return nil }
        self.init(retrivedValue)
    }
    
}
