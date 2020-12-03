//
//  ViewController.swift
//  FBTableView
//
//  Created by damjosemijesus on 06/02/2020.
//  Copyright © 2020 damjosemijesus. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Foundation
import MessageUI



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func COMPRAFINAL(_ sender: Any) {
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is ViewController2 {
        
            let vc = segue.destination as? ViewController2
            
            let cell = tableView.cellForRow(at: self.tableView!.indexPathForSelectedRow!)
            
            let index = cell?.viewWithTag(10) as! UILabel
            
            let stock = cell?.viewWithTag(4) as! UILabel
            
            let id = index.text!
            
            let stoc = stock.text!
            
           
            vc?.stocks = Int(stock.text!)!
            vc?.numero = id
        }
    }
    
    
    @IBAction func Comprar(_ sender: Any) {
       

    }
    
    var datos = [Informatica]()
    var variable:String = ""
    
    let db = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = 220
        rellenarArray()
    }
    
    func rellenarArray()  {

        
        db.child("Informatica").observe(.value){ snapshot in
            if let x = snapshot.value as? NSDictionary{
                let keys = x.allKeys
                self.datos.removeAll()
                for key in keys {
                    if let xDic = x[key] as? [String:Any]{
                        let producto = xDic["Producto"] as! String
                        let garantia = xDic["Garantia"] as! String
                        let precio = xDic["Precio"] as! String
                        let stock = xDic["Stock"] as! Int
                        let link = xDic["Link"] as! String
                        self.datos.append(Informatica(matricula: key as! String, producto:  producto, garantia:  garantia, precio:  precio, stock:  stock, link: link))
                        
                    }
                }
            }
            self.tableView.reloadData()
            print (self.datos)
        
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        let lb = cell.viewWithTag(10) as! UILabel
        let labelproducto = cell.viewWithTag(1) as! UILabel
        let labelgarantia = cell.viewWithTag(2) as! UILabel
        let labelprecio = cell.viewWithTag(3) as! UILabel
        let labelstock = cell.viewWithTag(4) as! UILabel
        let image = cell.viewWithTag(5) as! UIImageView
        
        lb.text = datos[indexPath.section].matricula
        labelproducto.text = datos[indexPath.section].producto
        labelgarantia.text = datos[indexPath.section].garantia
        labelprecio.text = datos[indexPath.section].precio
        labelstock.text = String (datos[indexPath.section].stock)
        image.descargar(link: datos[indexPath.section].link)

        return cell
    }

}

extension UIImageView{
    func descargar(link:String){
        URLSession.shared.dataTask(with: URL(string: link)!){
            (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else{return}
                self.image = UIImage(data:data)
            }
        }.resume()
    }
    
    
}


