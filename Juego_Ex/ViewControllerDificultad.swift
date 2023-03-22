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
    @IBOutlet weak var etiquetaApoyoJuego: UILabel!
    
    
    
    
    //Variables globales
    var vidas = 0
    var puntosParaGanar = 0
    var turno = 0
    
//    Variables Globales que reciben valores
    var juegoAJugar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        asignarJuegoAjugar()
        turno = generaAleatorio()
        ImagenPrincipal.image = UIImage(named: "PuercoInicial")
    }
    
    
    //Funciones
    func asignarJuegoAjugar(){
        etiquetaApoyoJuego.text = String(juegoAJugar ?? "")
    }
    
    func establecerValores(_ dirDeLosDatos: ViewController){
        dirDeLosDatos.dificultad = etiquetaApoyo.text
        dirDeLosDatos.puntosGanar = etiquetaApoyopUNTUACIONganar.text
        dirDeLosDatos.vidasIniciales = etiquetaApoyoVidasIniciales.text
        dirDeLosDatos.turno = Int(etiquetaApoyoturno.text ?? "1")
    }
    
    func establecerValores2(_ dirDeLosDatos: ViewControllerMat){
        dirDeLosDatos.dificultad = etiquetaApoyo.text
        dirDeLosDatos.puntosGanar = etiquetaApoyopUNTUACIONganar.text
        dirDeLosDatos.vidasIniciales = etiquetaApoyoVidasIniciales.text
    }
    
    func establecerValores3(_ dirDeLosDatos: QuizController){
        dirDeLosDatos.dificultad = etiquetaApoyo.text
    }
    
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
        
        if(etiquetaApoyoJuego.text == "Combina2"){
            guard let enviarnombre = segue.destination as? ViewController else {return}
            establecerValores(enviarnombre)
        }
        if(etiquetaApoyoJuego.text == "Pregunta2"){
            guard let enviarnombre = segue.destination as? QuizController else {return}
            establecerValores3(enviarnombre)
        }
        if(etiquetaApoyoJuego.text == "Matematik"){
            guard let enviarnombre = segue.destination as? ViewControllerMat else {return}
            establecerValores2(enviarnombre)
        }
    }
    
    //Actions
    @IBAction func EstablecerNivel(_ sender: UIButton) {
        etiquetaApoyo.text = sender.titleLabel?.text ?? ""
        establecerVidas(etiquetaApoyo.text ?? "")
        etiquetaApoyoVidasIniciales.text = String(vidas)
        etiquetaApoyopUNTUACIONganar.text = String(puntosParaGanar)
        etiquetaApoyoturno.text = String(turno)
        
        if(etiquetaApoyoJuego.text == "Combina2"){
            self.performSegue(withIdentifier: "DifSegue", sender: self)
        }
        if(etiquetaApoyoJuego.text == "Pregunta2"){
            performSegue(withIdentifier: "irQuiz", sender: self)
        }
        if(etiquetaApoyoJuego.text == "Matematik"){
            performSegue(withIdentifier: "irMath", sender: self)
        }

        

    }
}
