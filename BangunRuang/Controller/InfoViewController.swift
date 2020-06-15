//
//  InfoViewController.swift
//  BangunRuang
//
//  Created by Rahmat Zulfikri on 15/06/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var buttonBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPressBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
