//
//  SNPostSocialNetworkViewController.swift
//  App_SocialNetwork
//
//  Created by cice on 31/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import Social

class SNPostSocialNetworkViewController: UIViewController {

    //MARK: - IBoutlets
    @IBOutlet weak var myTextview: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    
    @IBAction func showCameraACTION(_ sender: Any) {
        pickerPhoto()
    }
    
    @IBAction func showFacebookACTION(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let postFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postFacebook?.setInitialText(myTextview.text)
            postFacebook?.add(myImageView.image)
            postFacebook?.add(URL(string: "https://gmbdesign.es"))
            present(postFacebook!, animated: true, completion: nil)
            
            limpiarDatos()
        }else{
           present(muestraAlert("Cuenta de Facebook", messageData: "Por favor, inicia tu sesión en Facebook para postear", titleAction: "OK"), animated: true, completion: nil)
        }
        
    }
    
    @IBAction func showTwitterACTION(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let postTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postTwitter?.setInitialText(myTextview.text)
            postTwitter?.add(myImageView.image)
            postTwitter?.add(URL(string: "https://gmbdesign.es"))
            present(postTwitter!, animated: true, completion: nil)
            
            limpiarDatos()
        }else{
            present(muestraAlert("Cuenta de Twitter", messageData: "Por favor, inicia tu sesión en Twitter para postear", titleAction: "OK"), animated: true, completion: nil)
        }
        
    }
    
    @IBAction func showActivityACTION(_ sender: Any) {
        
        //let model = myModel[sender.tag].objectId
        
        let textPost = myTextview.text
        let imagePost = myImageView.image
        let urlPost = "http://gmbdesign.es"
        
        
        let composePost = UIActivityViewController(activityItems: [textPost!, imagePost!, urlPost], applicationActivities: nil)
        
        present(composePost, animated: true, completion: nil)
        limpiarDatos()
        
        
    }
    
    @IBAction func showAlertVCACTION(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    
    func limpiarDatos(){
        myTextview.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        myImageView.image = #imageLiteral(resourceName: "imgPlaceholder")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}//TODO: - Fin de la clase

extension SNPostSocialNetworkViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        }else{
            muestraLibreriaFotos()
        }
    }
    
    func muestraMenu(){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let tomaFotoCamarAction = UIAlertAction(title: "Toma foto", style: .default) { _ in
            self.muestraCamaraDisposito()
        }
        let seleccionaFotoAction = UIAlertAction(title: "Selecciona desde la Librería", style: .default) { _ in
            self.muestraLibreriaFotos()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(tomaFotoCamarAction)
        alertVC.addAction(seleccionaFotoAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    func muestraLibreriaFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraCamaraDisposito(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

