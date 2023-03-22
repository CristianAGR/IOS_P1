//
//  ViewControllerMat.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 13/03/23.
//

import UIKit

class ViewControllerMat: UIViewController {
    //Objetos En Vista
    //Puntuaciones de cada jugador
    @IBOutlet weak var puntos: UILabel!
    @IBOutlet weak var dificultadLabel: UILabel!
    //Vidas de cada jugador
    @IBOutlet weak var vidas: UILabel!
    //Etiquetas de pregunta
    @IBOutlet weak var n1: UILabel!
    @IBOutlet weak var operador: UILabel!
    @IBOutlet weak var n2: UILabel!
    //EtiquetasExtra
    @IBOutlet weak var Ganar_Perder_Mensaje: UILabel!
    @IBOutlet weak var etiquetaApoyoVidasIniciales: UILabel!
    //Imagen
    @IBOutlet weak var respuestaCorrectaIncorrecta: UIImageView!
    //Botones
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var botonReinicio: UIButton!
    
    
    
    //Variables globales
    var arregloPosiblesRespuestas:[Int] = [0,0,0]
    var operadores:[String] = ["+","-","/","*"]
    var puntuacion = 0
    var puntosGanar: String?
    var puntuacionParaGanar = 100
    var vidasPuntaje = 3
    var vidasIniciales:String?
    var dificultad: String?
    
    //ViewLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        dificultadLabel.text = dificultad
        asignarVidas()
        establecerVidas()
        asignarPuntosParaGanar()
        inicializar()
        // Do any additional setup after loading the view.
    }

    //Funciones
    func asignarPuntosParaGanar(){
        puntuacionParaGanar = Int(String(puntosGanar ?? "")) ?? 0
    }
    
    func asignarRespuestas(){
        let resultado1 = generarResultadoErroneo()
        let resultado2 = generarResultadoErroneo()
        let resultado3 = generarResultadoCorrecto()
        arregloPosiblesRespuestas[0] = resultado1
        arregloPosiblesRespuestas[1] = resultado2
        arregloPosiblesRespuestas[2] = resultado3
        let ordenDeArreglo = Int.random(in: 1...3)
        switch(ordenDeArreglo){
            case 1:
                let variableDeApoyo = arregloPosiblesRespuestas[0]
                arregloPosiblesRespuestas[0] = arregloPosiblesRespuestas[2]
                arregloPosiblesRespuestas[2] = variableDeApoyo
            break
            case 2:
                let variableDeApoyo = arregloPosiblesRespuestas[1]
                arregloPosiblesRespuestas[1] = arregloPosiblesRespuestas[2]
                arregloPosiblesRespuestas[2] = variableDeApoyo
            break
            default:
            
            break
        }
        b1.setTitle(String(arregloPosiblesRespuestas[0]), for: .normal)
        b2.setTitle(String(arregloPosiblesRespuestas[1]), for: .normal)
        b3.setTitle(String(arregloPosiblesRespuestas[2]), for: .normal)
    }
    
    func asignarVidas(){
        etiquetaApoyoVidasIniciales.text = String(vidasIniciales ?? "")
    }
    
    func bloquearBotones(){
        b1.isEnabled = false
        b2.isEnabled = false
        b3.isEnabled = false
    }
    
    func bloquearReinicio(){
        botonReinicio.isEnabled = false
        botonReinicio.isHidden = true
    }
    
    func desbloquearBotones(){
        b1.isEnabled = true
        b2.isEnabled = true
        b3.isEnabled = true
    }
    
    func desbloquearReinicio(){
        botonReinicio.isEnabled = true
        botonReinicio.isHidden = false
    }
    
    func establecerImagen(_ bandera:Bool){
        respuestaCorrectaIncorrecta.isHidden = false
        if(bandera){
            respuestaCorrectaIncorrecta.image = UIImage(named: "Correcto.png")
        }else{
            respuestaCorrectaIncorrecta.image = UIImage(named: "incorrecto.png")
        }
    }
    
    func establecerVidas(){
        vidasPuntaje = Int(String(etiquetaApoyoVidasIniciales.text ?? "")) ?? 1000
        vidas.text = "Vidas: \(vidasPuntaje)"
    }
    
    func evaluarRespuesta(_ opcionEscogida:String){
        let respuestaCorrecta = String(transformarCadenaAExpresionMatematica())
        if(opcionEscogida == respuestaCorrecta){
            puntuacion += 1
            puntos.text = "Puntuación: \(puntuacion)"
            establecerImagen(true)
            if(puntuacion<puntuacionParaGanar){
                inicializar()
            }
            if(puntuacion==puntuacionParaGanar){
                mensajeAGanador()
                bloquearBotones()
                desbloquearReinicio()
            }
        }else{
            vidasPuntaje -= 1
            vidas.text = "Vidas: \(vidasPuntaje)"
            establecerImagen(false)
            inicializar()
            if(vidasPuntaje==0){
                mensajeAPerdedor()
                bloquearBotones()
                desbloquearReinicio()
            }
        }
    }
    
    func genera()->Int{
        return  Int.random(in: 1...100)
    }
    
    func generaOperador()->String{
        let a = Int.random(in: 0...3)
        return operadores[a]
    }
    
    func generarResultadoErroneo()->Int{
        let respuestaIncorrecta = Int.random(in: 1...100)
        return respuestaIncorrecta
    }
    
    func generarResultadoCorrecto()->Int{
        let mathValue = transformarCadenaAExpresionMatematica()
        return mathValue
    }
    
    func inicializar(){
        n1.text = String(genera())
        n2.text = String(genera())
        operador.text = generaOperador()
        //Imprimir Resultado en Consola
        let a = generarResultadoCorrecto()
        print(a)
        asignarRespuestas()
    }
    
    func mensajeAGanador(){
        Ganar_Perder_Mensaje.isHidden = false
        Ganar_Perder_Mensaje.text = "Ganaste"
    }
    
    func mensajeAPerdedor(){
        Ganar_Perder_Mensaje.isHidden = false
        Ganar_Perder_Mensaje.text = "Perdiste"
    }
    
    func reiniciar(){
        performSegue(withIdentifier: "returnMenuSegue", sender: self)
    }
    
    func transformarCadenaAExpresionMatematica() -> Int {
        let numero1:String = String(n1.text!)
        let numero2:String = String(n2.text!)
        let operador:String = String(operador.text!)
        let mathExpression = NSExpression(format: "\(numero1)\(operador)\(numero2)")
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Int ?? 999999999
        return mathValue
    }
    
    //Actions
    @IBAction func EvaluarRespuesta(_ sender:UIButton) {
        let opcionEscogida = sender.currentTitle
        print(opcionEscogida ?? "Nulo")
        evaluarRespuesta(opcionEscogida ?? "-10000")
    }
    @IBAction func btnReiniciar(_ sender: Any) {
        reiniciar()
    }
    
}
