//
//  ViewController2.swift
//  FBTableView
//
//  Created by damjosemijesus on 21/02/2020.
//  Copyright © 2020 damjosemijesus. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import FirebaseDatabase

class ViewController2: UIViewController {

    @IBOutlet weak var lbStocks: UILabel!
    var stocks:Int = 0
    var numero=String()
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(stocks)
        print(numero)
       
    }
    @IBOutlet weak var Correeo: UITextField!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfTarjeta: UITextField!
    @IBOutlet weak var tfDireccion: UITextField!
    var correo: String?
    var nombre: String?
    var direccion: String?
    var tarjeta: String?
    
    
    
   var datos2 = [Informatica]()
    var variable2:Int = 0
    
    @IBAction func Comprat(_ sender: Any) {
        correo = Correeo.text
        nombre = tfNombre.text
        direccion = tfDireccion.text
        tarjeta = tfTarjeta.text
        
        let alert = UIAlertController(title: "¿Estás seguro de realizar la compra?", message: "Comprala, venga no te hagas de rogar :V", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: {(ACTION) in
            self.modificar()
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {(ACTION) in
            print("Compra cancelada")
        }))

        
        self.present(alert, animated: true)
        Correeo.text = ""
        tfNombre.text = ""
        tfDireccion.text = ""
        tfTarjeta.text = ""
    }
    
    func modificar(){
        db.child("Informatica").child(numero).child("Stock").setValue(stocks-1)
    }
    
}
