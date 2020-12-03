import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Resultado: UILabel!
    @IBOutlet weak var Cuenta: UILabel!
    
    @IBOutlet weak var numero0: UIButton!
    @IBOutlet weak var numero1: UIButton!
    @IBOutlet weak var numero2: UIButton!
    @IBOutlet weak var numero3: UIButton!
    @IBOutlet weak var numero4: UIButton!
    @IBOutlet weak var numero5: UIButton!
    @IBOutlet weak var numero6: UIButton!
    @IBOutlet weak var numero7: UIButton!
    @IBOutlet weak var numero8: UIButton!
    @IBOutlet weak var numero9: UIButton!

    @IBOutlet weak var coma: UIButton!
    @IBOutlet weak var igual: UIButton!
    @IBOutlet weak var sumar: UIButton!
    @IBOutlet weak var resta: UIButton!
    @IBOutlet weak var multiplicacion: UIButton!
    @IBOutlet weak var dividir: UIButton!
    @IBOutlet weak var porciento: UIButton!
    @IBOutlet weak var masmenos: UIButton!
    @IBOutlet weak var borrar: UIButton!
    @IBOutlet weak var hjn: UIButton!
    

    
    var pulsacion = 0
    var num1 = 0.0
    var num2 = 0.0
    var operador = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func num0(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "0"
    }
    @IBAction func num1(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "1"
    }
    @IBAction func num2(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "2"
    }
    @IBAction func num3(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "3"
    }
    @IBAction func num4(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "4"
    }
    @IBAction func num5(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "5"
    }
    
    @IBAction func num6(_ sender: Any) {
       Cuenta.text = Cuenta.text! + "6"
    }
    @IBAction func num7(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "7"
    }
    @IBAction func num8(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "8"    }
    @IBAction func num9(_ sender: Any) {
      Cuenta.text = Cuenta.text! + "9"
    }
    
    @IBAction func coma(_ sender: Any) {
        Cuenta.text = Cuenta.text! + "."
    }
    @IBAction func porcentaje(_ sender: Any) {
        if(Cuenta.text != ""){
            num1 = Double(Cuenta.text!)!
            var result = num1 / 100
            Cuenta.text = String(result)
        }

    }
    @IBAction func dividir(_ sender: Any) {
        if (pulsacion == 0){
            Resultado.text = Cuenta.text! + "/"
            num1 = Double(Cuenta.text!)!
            Cuenta.text = ""
            operador = 0
            pulsacion = 1
        }
        
    }
    @IBAction func multi(_ sender: Any) {
        if (pulsacion == 0){
            Resultado.text = Cuenta.text! + "*"
            num1 = Double(Cuenta.text!)!
            Cuenta.text = ""
            operador = 1
            pulsacion = 1
        }
        
    }
    
    @IBAction func resta(_ sender: Any) {
        if (pulsacion == 0){
            Resultado.text = Cuenta.text!  + "-"
            num1 = Double(Cuenta.text!)!
            Cuenta.text = ""
            operador = 2
            pulsacion = 1
        }
        
    }
    @IBAction func suma(_ sender: Any) {
        if (pulsacion == 0){
            Resultado.text = Cuenta.text! + "+"
            num1 = Double(Cuenta.text!)!
            Cuenta.text = ""
            operador = 3
            pulsacion = 1
        }
        
    }
    @IBAction func igual(_ sender: Any) {
        if (pulsacion == 1){
            num2 = Double(Cuenta.text!)!
            if (operador == 0){
                var result = num1 / num2
                Resultado.text = ""
                Cuenta.text = String(result)
            }
            if (operador == 1){
                var result = num1 * num2
                Resultado.text = ""
                Cuenta.text = String(result)
            }
            if (operador == 2){
                var result = num1 - num2
                Resultado.text = ""
                Cuenta.text = String(result)
            }
            if (operador == 3){
                var result = num1 + num2
                Resultado.text = ""
                Cuenta.text = String(result)
            }
            pulsacion = 0
        }
        
        
    }
    @IBAction func borrar(_ sender: Any) {
        Resultado.text = ""
        Cuenta.text = ""
        num1 = 0
        num2 = 0
        operador = -1
        
    }
    
    @IBAction func porspain(_ sender: Any) {
        self.numero0.backgroundColor = UIColor.red
        self.numero1.backgroundColor = UIColor.red
        self.numero2.backgroundColor = UIColor.red
        self.numero3.backgroundColor = UIColor.red
        self.igual.backgroundColor = UIColor.red
        self.coma.backgroundColor = UIColor.red
        self.hjn.backgroundColor = UIColor.red
        self.sumar.backgroundColor = UIColor.red
        self.borrar.backgroundColor = UIColor.red
        self.porciento.backgroundColor = UIColor.red
        self.dividir.backgroundColor = UIColor.red
    self.multiplicacion.backgroundColor = UIColor.red
        self.numero9.backgroundColor = UIColor.red
        self.numero8.backgroundColor = UIColor.red
        self.numero7.backgroundColor = UIColor.red
        self.numero6.backgroundColor = UIColor.yellow
        self.numero5.backgroundColor = UIColor.yellow
        self.numero4.backgroundColor = UIColor.yellow
        self.resta.backgroundColor = UIColor.yellow
        self.masmenos.backgroundColor = UIColor.red
        
        
    }
    @IBAction func cambiarsigno(_ sender: Any) {
        var num = Double(Cuenta.text!)!
        num = num * -1
        Cuenta.text = String(num)
    }
}

