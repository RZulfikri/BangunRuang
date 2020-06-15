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
    
    let shapeInfoCollection: [ShapeEnum: ShapeInfo] = [
        ShapeEnum.kubus: ShapeInfo(
            name: "Kubus",
            desc: "Bangun ruang yang memiliki enam sisi yang semua sisinya berbentuk persegi dan memiliki 12 rusuk yang sama panjang.",
            image3d: #imageLiteral(resourceName: "kubusInfo3d"),
            image2D: #imageLiteral(resourceName: "kubusInfo2d"),
            info: "1. Semua sisi kubus berbentuk persegi\n2. Rusuk pada kubus berukuran sama panjang\n3. Diagonal bidang pada kubus berukuran sama panjang\n4. Diagonal ruang pada kubus berkuran sama panjang\n5. Bidang diagonal pada kubus berbentuk persegi panjang",
            volume: "V=SxSxS",
            luas: "L=6xSxS"),
        ShapeEnum.limas: ShapeInfo(
           name: "Kubus",
           desc: "Bangun ruang yang memiliki enam sisi yang semua sisinya berbentuk persegi dan memiliki 12 rusuk yang sama panjang.",
           image3d: #imageLiteral(resourceName: "kubusInfo3d"),
           image2D: #imageLiteral(resourceName: "kubusInfo2d"),
           info: "1. Semua sisi kubus berbentuk persegi\n2. Rusuk pada kubus berukuran sama panjang\n3. Diagonal bidang pada kubus berukuran sama panjang\n4. Diagonal ruang pada kubus berkuran sama panjang\n5. Bidang diagonal pada kubus berbentuk persegi panjang",
           volume: "V=SxSxS",
           luas: "L=6xSxS"),
    ]
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var stackview: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        scrollview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackview]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackview": stackview]))
        scrollview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackview]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackview": stackview]))
        
//        var hStackview = UIStackView()
//        hStackview.translatesAutoresizingMaskIntoConstraints = false
//        hStackview.axis = .horizontal
//
//        var vStackview1 = UIStackView()
//        vStackview1.translatesAutoresizingMaskIntoConstraints = false
//        vStackview1.axis = .vertical
//
//
//        var vStackview2 = UIStackView()
//        vStackview2.translatesAutoresizingMaskIntoConstraints = false
//        vStackview2.axis = .vertical
//
        print(stackview.frame)
        
        let labelName = UILabel()
        labelName.numberOfLines = 0
        labelName.text = shapeInfoCollection[.kubus]?.name
        labelName.sizeToFit()
        
        let labelDesc = UILabel()
        labelDesc.lineBreakMode = .byClipping
        labelDesc.numberOfLines = 0
        labelDesc.text = shapeInfoCollection[.kubus]?.desc
        labelDesc.sizeToFit()
        
        print(labelDesc.frame, stackview.frame)
        
        let labelInfo = UILabel()
        labelInfo.lineBreakMode = .byClipping
        labelInfo.numberOfLines = 0
        labelInfo.text = shapeInfoCollection[.kubus]?.info
        labelInfo.sizeToFit()
        
        stackview.addArrangedSubview(labelName)
        stackview.addArrangedSubview(labelDesc)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)
        stackview.addArrangedSubview(labelInfo)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollview.contentSize = CGSize(width: stackview.frame.width, height: stackview.frame.height)
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
