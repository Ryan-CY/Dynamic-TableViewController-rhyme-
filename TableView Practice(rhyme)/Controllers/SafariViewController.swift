//
//  SafariViewController.swift
//  TableView Practice(rhyme)
//
//  Created by Ryan Lin on 2023/2/4.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
    var website: String
    
    init?(coder: NSCoder, website: String) {
        self.website = website
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatedUI()
    }
    
    func updatedUI() {
        let url = URL(string: website)
        let browser = SFSafariViewController(url: url!)
        present(browser, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
