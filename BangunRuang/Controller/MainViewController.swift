//
//  MainViewController.swift
//  BangunRuang
//
//  Created by Rahmat Zulfikri on 15/06/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit
import RealityKit

class MainViewController: UIViewController, ShortcutMenuDelegate {
    @IBOutlet var arView: ARView!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonChangeObj: UIButton!
    @IBOutlet var buttonPrev: UIButton!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var buttonLayout: UIButton!
    @IBOutlet var buttonInfo: UIButton!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var shortcutObjContainer: UIView!
    @IBOutlet var containerInfo: UIView!
    
    var currentShape: ShapeEnum = .kubus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerInfo.layer.cornerRadius = 10
        
        prepareShape(shape: currentShape)
    }
    
    func prepareShape(shape: ShapeEnum) {
        // Load the "Box" scene from the "Experience" Reality File
        arView.scene.anchors.removeAll()
        switch shape {
        case .kubus:
            labelTitle.text = "Kubus"
            let obj3D = try! Experience.loadKubus()
            let obj2D = try! Experience.loadKubusOpen()
       
            arView.scene.anchors.append(contentsOf: [obj3D, obj2D])
            arView.scene.anchors[1].isEnabled = false
            break
        case .limas:
            labelTitle.text = "Limas"
            let obj3D = try! Experience.loadBox()
            let obj2D = try! Experience.loadBox()
            arView.scene.anchors.append(contentsOf: [obj3D, obj2D])
            arView.scene.anchors[1].isEnabled = false
            break
        default:
            let obj3D = try! Experience.loadBox()
            let obj2D = try! Experience.loadBox()
            arView.scene.anchors.append(contentsOf: [obj3D, obj2D])
            arView.scene.anchors[1].isEnabled = false
            break
        }
        
        buttonNext.isEnabled = true
        buttonPrev.isEnabled = false
    }
    
    func onPressBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func onPressChangeObj() {
        shortcutObjContainer.isHidden = !shortcutObjContainer.isHidden
    }
    
    func onPressPrev() {
        buttonPrev.isEnabled = false
        buttonNext.isEnabled = true
        arView.scene.anchors[0].isEnabled = true
        arView.scene.anchors[1].isEnabled = false
    }
    
    func onPressNext() {
        buttonPrev.isEnabled = true
        buttonNext.isEnabled = false
        arView.scene.anchors[0].isEnabled = false
        arView.scene.anchors[1].isEnabled = true
    }
    
    func onPressLayout() {
        showAlert()
    }
    
    func onPressInfo() {
        performSegue(withIdentifier: "main2info", sender: currentShape)
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
        case buttonLayout:
            onPressLayout()
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
    
    func selectShape(shape: ShapeEnum) {
        currentShape = shape
        prepareShape(shape: shape)
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ShortcutMenu {
            vc.delegate = self
        }
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
