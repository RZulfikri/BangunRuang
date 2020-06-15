//
//  ShortcutMenu.swift
//  BangunRuang
//
//  Created by Rahmat Zulfikri on 15/06/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

let reuseIdentifierShortcut = "Cell"

protocol ShortcutMenuDelegate {
    func selectShape(shape: ShapeEnum)
}


class ShortcutMenu: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let menuItems: [Menu] = [
          Menu(name: "Kubus", image: #imageLiteral(resourceName: "kubus")),
          Menu(name: "Limas", image: #imageLiteral(resourceName: "kubus")),
          Menu(name: "Balok", image: #imageLiteral(resourceName: "balok")),
          Menu(name: "Prisma", image: #imageLiteral(resourceName: "prisma"))
      ]

    @IBOutlet var collectionView: UICollectionView!
    
    var delegate: ShortcutMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 20
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierShortcut, for: indexPath) as? ShortcutMenuItem {
                cell.layer.cornerRadius = 10
                cell.image.image = menuItems[indexPath.row].image
                cell.label.text = menuItems[indexPath.row].name
                return cell
            }
        return ShortcutMenuItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.delegate?.selectShape(shape: .kubus)
            break
        case 1:
            self.delegate?.selectShape(shape: .limas)
            break
        case 2:
            showAlert()
            break
        case 3:
            showAlert()
            break
        default:
            showAlert()
        }
    }
    
    func showAlert() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Mohon maaf", message: "Bangun ruang belum tersedia\nAkan tersedia pada versi selanjutnya", preferredStyle: .alert)
        
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
