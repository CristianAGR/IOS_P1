//
//  ViewControllerDificultad.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 13/03/23.
//

import UIKit

class ViewControllerDificultad: UIViewController {

    
    //Objetos de la vista
    @IBOutlet weak var ImagenPrincipal: UIImageView!
    @IBOutlet weak var botonBasico: UIButton!
    @IBOutlet weak var botonIntermedio: UIButton!
    @IBOutlet weak var botonAvanzado: UIButton!
    @IBOutlet weak var etiquetaApoyo: UILabel!
    @IBOutlet weak var etiquetaApoyoVidasIniciales: UILabel!
    @IBOutlet weak var etiquetaApoyopUNTUACIONganar: UILabel!
    @IBOutlet weak var etiquetaApoyoturno: UILabel!
    
    
    
    
    //Variables globales
    var vidas = 0
    var puntosParaGanar = 0
    var turno = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turno = generaAleatorio()
        ImagenPrincipal.image = UIImage(named: "PuercoInicial")
    }
    
    
    //Funciones
    func establecerVidas(_ dif: String){
        turno = generaAleatorio()
        switch(dif){
        case "BÁSICO!!!!!":
            vidas = 3
            puntosParaGanar = 5
            break
        case "Intermedio":
            vidas = 2
            puntosParaGanar = 7
            break
        case "Avanzado":
            vidas = 1
            puntosParaGanar = 10
            break
        default:
            break
        }
    }
    
    func generaAleatorio()->Int{
        return  Int.random(in: 1...2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let enviarnombre = segue.destination as? ViewController else {return}
        enviarnombre.dificultad = etiquetaApoyo.text
        enviarnombre.puntosGanar = etiquetaApoyopUNTUACIONganar.text
        enviarnombre.vidasIniciales = etiquetaApoyoVidasIniciales.text
        enviarnombre.turno = Int(etiquetaApoyoturno.text ?? "1")
    }
    
    //Actions
    @IBAction func EstablecerNivel(_ sender: UIButton) {
        etiquetaApoyo.text = sender.titleLabel?.text ?? ""
        establecerVidas(etiquetaApoyo.text ?? "")
        etiquetaApoyoVidasIniciales.text = String(vidas)
        etiquetaApoyopUNTUACIONganar.text = String(puntosParaGanar)
        etiquetaApoyoturno.text = String(turno)
        self.performSegue(withIdentifier: "DifSegue", sender: self)

    }
}
