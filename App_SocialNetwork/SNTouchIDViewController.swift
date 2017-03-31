//
//  SNTouchIDViewController.swift
//  App_SocialNetwork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import LocalAuthentication

class SNTouchIDViewController: UIViewController {

    //MARK: - Variables locales
    var customTouchId = LAContext()
    var messageData = "Necesito saber si esres tú"
    var nombre = "Gustavo"
    
    var alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myMomentoAutentificacionLB: UILabel!
    @IBOutlet weak var myComentarioAutenticacionLB: UILabel!
    
    
    //MARK: - IBActions
    @IBAction func desbloqueoTouchIDACTION(_ sender: Any) {
        
        myMomentoAutentificacionLB.text = "Autenticando"
        var touchIDerror: NSError?
        
        if customTouchId.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &touchIDerror){
            
            customTouchId.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                                         localizedReason: messageData,
                                         reply: { (exitoso, errorTouch) in
                                            if exitoso {
                                                
                                                self.myMomentoAutentificacionLB.text = "TouchID exitoso"
                                                self.myComentarioAutenticacionLB.text = "Has logrado demostrar que eres tu"
                                                
                                                self.alertVC.title = "Autentificacion exitosa"
                                                self.alertVC.message = "Se que eres tu \(self.nombre)"
                                                
                                            } else {
                                                
                                                self.myMomentoAutentificacionLB.text = "TouchID Denegado"
                                                self.myComentarioAutenticacionLB.text = "No has logrado demostrar que eres tu"
                                                
                                                self.alertVC.title = "Autentificacion Fallida"
                                                
                                                
                                                switch errorTouch!._code{
                                                    case LAError.authenticationFailed.rawValue:
                                                        self.alertVC.message = "Fallo en la autentificacion"
                                                    case LAError.userCancel.rawValue:
                                                        self.alertVC.message = "El usuario cancelo la operación"
                                                    case LAError.systemCancel.rawValue:
                                                        self.alertVC.message = "El sistema cancelo la operación"
                                                    case LAError.userFallback.rawValue:
                                                        self.alertVC.message = "Solicito que uses la contraseña"
                                                    default:
                                                        self.alertVC.message = "otra cosa salio mal"
                                                    
                                                }
                                                
                                                self.present(self.alertVC, animated: true, completion: {
                                                    self.myComentarioAutenticacionLB.text = self.messageData
                                                })
                                                
                                            }
            })
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertVC.addAction(alertAction)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
