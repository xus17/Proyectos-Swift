//
//  Informatica.swift
//  FBTableView
//
//  Created by damjosemijesus on 20/02/2020.
//  Copyright © 2020 damjosemijesus. All rights reserved.
//

import Foundation

class Informatica{
    var matricula: String
    var producto: String
    var garantia: String
    var precio: String
    var stock: Int
    var link: String
    
    init(matricula:String, producto:String, garantia:String, precio:String, stock:Int, link:String){
        self.matricula = matricula
        self.producto = producto
        self.garantia = garantia
        self.precio = precio
        self.stock = stock
        self.link = link
    }
    
    
}
