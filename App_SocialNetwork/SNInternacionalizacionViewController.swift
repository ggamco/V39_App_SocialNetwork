//
//  SNInternacionalizacionViewController.swift
//  App_SocialNetwork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class SNInternacionalizacionViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var myNameLB: UILabel!
    @IBOutlet weak var myCurrencyLB: UILabel!
    @IBOutlet weak var myDateLB: UILabel!
    @IBOutlet weak var myLastLB: UILabel!
    @IBOutlet weak var myNumberLB: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dameValores()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        muestraAlertVC()
    }

    //MARK: Utils
    
    func dameValores(){
        myNameLB.text = "Gustavo"
        myLastLB.text = "Gamboa"
        myCurrencyLB.text = "\(9.999)"
        myDateLB.text = "\(Date())"
        myNumberLB.text = "\(666444555)"
        myImageView.image = UIImage(named: "hola.png")
    }
    
    func muestraAlertVC(){
        present(muestraAlert(NSLocalizedString("TITLE_DATA", comment: ""), messageData: NSLocalizedString("MESSAGE_DATA", comment: ""), titleAction: "OK"),
                animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
