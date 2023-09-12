//
//  ViewController.swift
//  PrimeiraTelaCadastroCurso
//
//  Created by Samuel Montagnini on 30/08/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.lightGray
        
        //Function to set the elements configuration.
        configTextFields()
        configButtons()
        
        //Contracts of Delegation.
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    @IBAction func pressedRegisterButton(_ sender: Any) {
        print("User Registered!")
        //Alerta na tela do usuário
        let alertController = UIAlertController(title: "Sucess ✅", message: "User Registered 🧑🏻‍💻", preferredStyle: .alert)

        // Adicione ação ao alerta (por exemplo, um botão OK)
        let okAction = UIAlertAction(title: "Let's Meditate", style: .default, handler: nil)
        alertController.addAction(okAction)

        // Apresente o alerta ao usuário
        self.present(alertController, animated: true, completion: nil)
        
        print("Username: ", nameTextField.text ?? "")
        print("Email address: ", emailTextField.text ?? "")
        print("User password: ", passwordTextField.text ?? "")
    }
    
    func configTextFields() {
        //Name TextField Configs.
        nameTextField.keyboardType = .default
        nameTextField.layer.cornerRadius = 15
        nameTextField.backgroundColor = .white
        nameTextField.clipsToBounds = true
        
        //Email TextField Configs.
        emailTextField.keyboardType = .emailAddress
        emailTextField.layer.cornerRadius = 15
        emailTextField.backgroundColor = .white
        emailTextField.clipsToBounds = true
        
        //Password TextField Configs.
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.clipsToBounds = true
    }
    
    func configButtons(){
        //Register Button Configs.
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.setTitleColor(.white, for: .normal)
        //Setting the button border as semicircular.
        registerButton.layer.cornerRadius = 15
        registerButton.clipsToBounds = true
    }
    
    func validateTextField() {
        //Logic to validate the Register Button
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
        
    }
    
}

extension ViewController{
    //Extension para TextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderWidth = 0
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
    
    
}
