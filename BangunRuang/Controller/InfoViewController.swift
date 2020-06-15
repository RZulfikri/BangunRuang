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
    @IBOutlet var labelTitle: UILabel!
    
    let shapeInfoCollection: [ShapeEnum: ShapeInfo] = [
        ShapeEnum.kubus: ShapeInfo(
            name: "Kubus",
            desc: "Kubus merupakan bangun ruang yang memiliki enam sisi yang semua sisinya berbentuk persegi dan memiliki 12 rusuk yang sama panjang.",
            image3d: #imageLiteral(resourceName: "kubusInfo3d"),
            image2D: #imageLiteral(resourceName: "kubusInfo2d"),
            info: "Sifat-sifat kubus:\n1. Semua sisi kubus berbentuk persegi\n2. Rusuk pada kubus berukuran sama panjang\n3. Diagonal bidang pada kubus berukuran sama panjang\n4. Diagonal ruang pada kubus berkuran sama panjang\n5. Bidang diagonal pada kubus berbentuk persegi panjang",
            volume: "Volume = Sisi x Sisi x Sisi",
            luas: "Luas = 6 x Sisi x Sisi"),
        ShapeEnum.limas: ShapeInfo(
           name: "Limas Segi-4",
           desc: "Limas merupakan bangun ruang yang mempunyai alas berbentuk segi banyak dan bidang tegaknya berbentuk segita yang satu sudutnya bertemu di satu titik",
           image3d: #imageLiteral(resourceName: "limasInfo3d"),
           image2D: #imageLiteral(resourceName: "limasInfo2d"),
           info: "Sifat-sifat limas segi-4:\n1. Memiliki alas berbentuk segi empat\n2. Mempunyai lima buah bidang sisi\n3. Memiliki 4 buah sisi berbentuk segitiga\n4. Memiliki lima buah titik sudut\n5. Memiliki 8 rusuk dan 4 rusuk yang memiliki ukuran yang sama.",
           volume: "Volume = 1/3 x Sisi x Sisi x Tinggi",
           luas: "Luas = (Sisi x Sisi) + (4 x Sisi x Tinggi Segitia / 2)"),
    ]
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var stackview: UIStackView!
    
    var currentShape: ShapeEnum = .kubus
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
//        scrollview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackview]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackview": stackview]))
//        scrollview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackview]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackview": stackview]))
        
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
        
        labelTitle.text = shapeInfoCollection[currentShape]?.name
        
        let image3D = UIImageView()
        image3D.image = shapeInfoCollection[currentShape]?.image3d.withAlignmentRectInsets(UIEdgeInsets(top: -20.0, left: 0, bottom: -20.0, right: 0))
        image3D.contentMode = .scaleAspectFit
        
        let labelVolumeInfo = UILabel()
        labelVolumeInfo.lineBreakMode = .byClipping
        labelVolumeInfo.numberOfLines = 0
        labelVolumeInfo.text = "Cara menghitung volume \(shapeInfoCollection[currentShape]!.name):"
        labelVolumeInfo.sizeToFit()
        
        let labelVolume = PaddingLabel(withInsets: 10, 10, 0, 0)
        labelVolume.lineBreakMode = .byClipping
        labelVolume.numberOfLines = 0
        labelVolume.text = shapeInfoCollection[currentShape]?.volume
        labelVolume.sizeToFit()
        labelVolume.textAlignment = .center
        labelVolume.backgroundColor = UIColor(red: 0.827, green: 0.898, blue: 0.961, alpha: 1)
        
        let labelDesc = UILabel()
        labelDesc.lineBreakMode = .byClipping
        labelDesc.numberOfLines = 0
        labelDesc.text = shapeInfoCollection[currentShape]?.desc
        labelDesc.sizeToFit()
        labelDesc.textAlignment = .justified
        
        let labelJaring2 = UILabel()
        labelJaring2.lineBreakMode = .byClipping
        labelJaring2.numberOfLines = 0
        labelJaring2.text = "Jaring-jaring  \(shapeInfoCollection[currentShape]!.name)"
        labelJaring2.sizeToFit()
        labelJaring2.textAlignment = .center
        
        let image2D = UIImageView()
        image2D.image = shapeInfoCollection[currentShape]?.image2D.withAlignmentRectInsets(UIEdgeInsets(top: -20.0, left: 0, bottom: -20.0, right: 0))
        image2D.contentMode = .scaleAspectFit
        
        let labelLuasInfo = UILabel()
        labelLuasInfo.lineBreakMode = .byClipping
        labelLuasInfo.numberOfLines = 0
        labelLuasInfo.text = "Cara menghitung luas permukaan \(shapeInfoCollection[currentShape]!.name):"
        labelLuasInfo.sizeToFit()
        
        let labelLuas = PaddingLabel(withInsets: 10, 10, 0, 0)
        labelLuas.lineBreakMode = .byClipping
        labelLuas.numberOfLines = 0
        labelLuas.text = shapeInfoCollection[currentShape]?.luas
        labelLuas.sizeToFit()
        labelLuas.textAlignment = .center
        labelLuas.backgroundColor = UIColor(red: 0.827, green: 0.898, blue: 0.961, alpha: 1)
                
        let labelInfo = UILabel()
        labelInfo.lineBreakMode = .byClipping
        labelInfo.numberOfLines = 0
        labelInfo.text = shapeInfoCollection[currentShape]?.info
        labelInfo.sizeToFit()
        labelInfo.textAlignment = .justified
        
        stackview.addArrangedSubview(image3D)
        stackview.addArrangedSubview(labelDesc)
        stackview.addArrangedSubview(labelVolumeInfo)
        stackview.addArrangedSubview(labelVolume)
        stackview.addArrangedSubview(labelJaring2)
        stackview.addArrangedSubview(image2D)
        stackview.addArrangedSubview(labelLuasInfo)
        stackview.addArrangedSubview(labelLuas)
        stackview.addArrangedSubview(labelInfo)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(stackview.frame)
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
