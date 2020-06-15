//
//  MainViewController.swift
//  BangunRuang
//
//  Created by Rahmat Zulfikri on 15/06/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit
import RealityKit

class MainViewController: UIViewController {

    @IBOutlet var arView: ARView!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonChangeObj: UIButton!
    @IBOutlet var buttonPrev: UIButton!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var buttonLayout: UIButton!
    @IBOutlet var buttonInfo: UIButton!
    @IBOutlet var labelTitle: UILabel!
    
    var currentShape: ShapeEnum = .kubus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareShape(shape: currentShape)
    }
    
    func prepareShape(shape: ShapeEnum) {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        switch shape {
        case .kubus:
            labelTitle.text = "Kubus"
            break
        case .limas:
            labelTitle.text = "Limas"
            break
        default:
            break
        }
        
           
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    func onPressBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func onPressChangeObj() {
        
    }
    
    func onPressPrev() {
        
    }
    
    func onPressNext() {
        
    }
    
    func onPressLayout() {
        
    }
    
    func onPressInfo() {
        
    }
    
    @IBAction func onPressButton(_ sender: UIButton) {
        switch sender {
        case buttonBack:
            onPressBack()
            break
        case buttonChangeObj:
            onPressChangeObj()
            break
        case buttonNext:
            onPressNext()
            break
        case buttonPrev:
            onPressPrev()
            break
        case buttonInfo:
            onPressInfo()
            break
        default:
            break
        }
    }
    
    func showAlert() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Mohon maaf", message: "Fitur belum tersedia tersedia\nAkan tersedia pada versi selanjutnya", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Ok", style: .default) { (_) in
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
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
