//
//  ViewController.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 13/03/23.
//
import UIKit

class ViewController: UIViewController {
    
    //Objetos en vista
    @IBOutlet weak var cas1: UIImageView!
    @IBOutlet weak var cas2: UIImageView!
    @IBOutlet weak var cas3: UIImageView!
    @IBOutlet weak var cas4: UIImageView!
    @IBOutlet weak var cas5: UIImageView!
    @IBOutlet weak var cas6: UIImageView!
    @IBOutlet weak var cas7: UIImageView!
    @IBOutlet weak var cas8: UIImageView!
    @IBOutlet weak var cas9: UIImageView!
    @IBOutlet weak var dadoImg: UIImageView!
    @IBOutlet weak var etiquetaDificultad: UILabel!
    @IBOutlet weak var etiquetaPuntos: UILabel!
    @IBOutlet weak var etiquetaTurnoJugador: UILabel!
    @IBOutlet weak var etiquetaVidas: UILabel!
    @IBOutlet weak var puntos: UILabel!
    @IBOutlet weak var racha: UILabel!
    @IBOutlet weak var puntosj2: UILabel!
    @IBOutlet weak var rachaj2: UILabel!
    @IBOutlet weak var vidas: UILabel!
    @IBOutlet weak var vidasj2: UILabel!
    @IBOutlet weak var enunciadoTxt: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var resultadoTxt: UILabel!
    @IBOutlet weak var botonReinicio: UIButton!
    @IBOutlet weak var LanzarDado: UIButton!
    @IBOutlet weak var GenerarReto: UIButton!
    
    //Variables Globales
    let caras = ["dado.png","dado-2.png","dado-3.png","dado-4.png","dado-5.png","dado-6.png"];
    var cara = 0
    var puntosV = 0;
    var rachaV = 0;
    var puntosj2V = 0;
    var rachaj2V = 0;
    var vidasV = 0;
    var vidasj2V = 0;
    var posicionAnteriorJ1 = 0;
    var posicionAnteriorJ2 = 0;
    var posicionj1 = 0
    var posicionj2 = 0
    
    
    //Variables Globales que reciben valores
    var dificultad: String?
    var puntosGanar: String?
    var turno: Int?
    var vidasIniciales: String?
    
    //Variables globales de Preguntados
    var resultado = ""
    var anterior:Int = 0
    
    //Variables Globales de Matematik
    var arregloPosiblesRespuestas:[Int] = [0,0,0]
    var operadores:[String] = ["+","-","/","*"]
    
    //ViewLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        establecerPuntosYVidas()
        establecerEtiquetaTurno()
        dadoImg.image = UIImage(named: "dado.png")
        cas1.image = UIImage(named: "vacio")
        cas2.image = UIImage(named: "vacio")
        cas3.image = UIImage(named: "vacio")
        cas4.image = UIImage(named: "vacio")
        cas5.image = UIImage(named: "vacio")
        cas6.image = UIImage(named: "vacio")
        cas7.image = UIImage(named: "vacio")
        cas8.image = UIImage(named: "vacio")
        cas9.image = UIImage(named: "vacio")
    }
    
    //Funciones Generales
    func asignarPosicion(_ posicionAnterior: Int, _ posicionNueva:Int){
        
        if(turno == 1){
            if(posicionj1 == posicionj2){
                switch(posicionNueva){
                    case 1:
                        cas1.image = UIImage(named: "2j")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "2j")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "2j")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "2j")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "2j")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "2j")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "2j")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "2j")
                    break;
                default:
                    break;
                }
            }else{
                switch(posicionAnterior){
                    case 1:
                        cas1.image = UIImage(named: "vacio")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "vacio")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "vacio")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "vacio")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "vacio")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "vacio")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "vacio")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "vacio")
                    break;
                default:
                    break;
                }
                switch(posicionNueva){
                    case 1:
                        cas1.image = UIImage(named: "j1")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "j1")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "j1")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "j1")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "j1")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "j1")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "j1")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "j1")
                    break;
                case 9:
                    cas9.image = UIImage(named: "j1")
                break;
                default:
                    break;
                }
            }
            
        }else{
            if(posicionj1 == posicionj2){
                switch(posicionNueva){
                    case 1:
                        cas1.image = UIImage(named: "2j")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "2j")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "2j")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "2j")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "2j")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "2j")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "2j")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "2j")
                    break;
                    
                default:
                    break;
                }
            }else{
                switch(posicionAnterior){
                    case 1:
                        cas1.image = UIImage(named: "vacio")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "vacio")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "vacio")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "vacio")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "vacio")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "vacio")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "vacio")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "vacio")
                    break;
                default:
                    break;
                }
                switch(posicionNueva){
                    case 1:
                        cas1.image = UIImage(named: "j2")
                    break;
                    case 2:
                        cas2.image = UIImage(named: "j2")
                    break;
                    case 3:
                        cas3.image = UIImage(named: "j2")
                    break;
                    case 4:
                        cas4.image = UIImage(named: "j2")
                    break;
                    case 5:
                        cas5.image = UIImage(named: "j2")
                    break;
                    case 6:
                        cas6.image = UIImage(named: "j2")
                    break;
                    case 7:
                        cas7.image = UIImage(named: "j2")
                    break;
                    case 8:
                        cas8.image = UIImage(named: "j2")
                    break;
                case 9:
                    cas9.image = UIImage(named: "j2")
                break;
                default:
                    break;
                }
            }
            
        }
    }
    
    func asignarPuntos(){
        if (turno == 1) {
            puntosV += 1;
            puntos.text = String(puntosV);
            rachaV += 1;
            racha.text = "Racha: " + String(rachaV);
            avanzar()
            cambiarturno()
            establecerEtiquetaTurno()
            if (posicionj1 == 9) {
                resultadoTxt.isHidden = false
                resultadoTxt.text = "Has ganado Jugador 1"
            }
        } else {
            puntosj2V += 1;
            puntosj2.text = String(puntosj2V);
            rachaj2V += 1;
            rachaj2.text = "Racha: " + String(rachaj2V);
            avanzar()
            
            cambiarturno()
            establecerEtiquetaTurno()
            if (posicionj2 == 9) {
                resultadoTxt.isHidden = false
                resultadoTxt.text = "Has ganado Jugador 2"
            }
        }
    }
    
    func avanzar(){
        if (turno == 1) {
            let puntos = cara + 1
            posicionAnteriorJ1 = posicionj1
            posicionj1 += puntos
            if(posicionj1 > 9){
                posicionj1 = 9
            }
            asignarPosicion(posicionAnteriorJ1,posicionj1)
        } else {
            let puntos = cara + 1
            posicionAnteriorJ2 = posicionj2
            posicionj2 += puntos
            if(posicionj2 > 9){
                posicionj2 = 9
            }
            asignarPosicion(posicionAnteriorJ2,posicionj2)
        }
    }
    
    func bloquearBotones() {
        enunciadoTxt.isHidden = true
        
        btn1.isEnabled = false
        btn1.isHidden = true
        btn2.isEnabled = false
        btn2.isHidden = true
        btn3.isEnabled = false
        btn3.isHidden = true
    }
    
    func cambiarturno(){
        if(turno == 1){
            turno! += 1
        }else{
            turno = 1
        }
    }
    
    func establecerPuntosYVidas (){
        etiquetaDificultad.text = dificultad
        etiquetaVidas.text = vidasIniciales
        vidas.text = "Vidas: " + (etiquetaVidas.text ?? "10000")
        vidasj2.text = "Vidas: " + (etiquetaVidas.text ?? "10000")
        vidasV = Int(String(vidasIniciales ?? "")) ?? 10
        vidasj2V = Int(String(vidasIniciales ?? "")) ?? 10
    }
    
    func establecerEtiquetaTurno(){
        if(turno == 1){
            etiquetaTurnoJugador.text = "Es el turno del: Jugador 1"
        }
        if(turno == 2){
            etiquetaTurnoJugador.text = "Es el turno del: Jugador 2"
        }
    }
    
    func obtenerCara()->Int {
        let caraDado = Int.random(in: 0...5);
        return caraDado;
    }
    
    func quitarVidas(){
        if (turno == 1) {
            vidasV -= 1;
            vidas.text = "Vidas: " + String(vidasV);
            rachaV = 0;
            racha.text = "Racha: " + String(rachaV);
            cambiarturno()
            establecerEtiquetaTurno()
            if (vidasV == 0) {
                resultadoTxt.text = "Jugador 1 Eliminado"
            }
        } else {
            vidasj2V -= 1;
            vidasj2.text = "Vidas: " + String(vidasj2V);
            rachaj2V = 0;
            rachaj2.text = "Racha: " + String(rachaj2V);
            cambiarturno()
            establecerEtiquetaTurno()
            if (vidasj2V == 0) {
                resultadoTxt.text = "Jugador 2 Eliminado"
            }
        }
    }
    
    
    //Funciones Preguntados
    func iniciarPreguntas() {
        enunciadoTxt.isHidden = false
        btn1.isEnabled = true
        btn1.isHidden = false
        btn3.isEnabled = true
        btn3.isHidden = false
        btn1.setTitle("Verdadero", for: .normal)
        btn3.setTitle("Falso", for: .normal)
        
        if (etiquetaDificultad.text == "BÁSICO!!!!!") {
            quiz = quizBasico
        } else if (etiquetaDificultad.text == "Intermedio") {
            quiz = quizIntermedio
        } else if (etiquetaDificultad.text == "Avanzado") {
            quiz = quizAvanzado
        }
        anterior = lanzarPregunta()
    }
    
    func lanzarPregunta()->Int {
        let aleatorio = Int.random(in: 0...quiz.count-1)
        enunciadoTxt.text = quiz[aleatorio][0]
        return aleatorio
    }
    
    
    //Funciones Matematik
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
        btn1.setTitle(String(arregloPosiblesRespuestas[0]), for: .normal)
        btn2.setTitle(String(arregloPosiblesRespuestas[1]), for: .normal)
        btn3.setTitle(String(arregloPosiblesRespuestas[2]), for: .normal)
    }
    
    func desbloquearReinicio(){
        botonReinicio.isEnabled = true
        botonReinicio.isHidden = false
    }
    
    func evaluarRespuesta(_ opcionEscogida:String){
        let respuestaCorrecta = String(transformarCadenaAExpresionMatematica())
        if(opcionEscogida == respuestaCorrecta){
            asignarPuntos()
            if(posicionj1 < 9 && posicionj2 < 9){
                inicializar()
                //cambiarturno()
            }else{
                bloquearBotones()
                LanzarDado.isEnabled = false
                GenerarReto.isEnabled = false
                desbloquearReinicio()
            }
            
        }else{
            quitarVidas()
            inicializar()
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
        let valor1 = String(genera())
        let operador = generaOperador()
        let valor2 = String(genera())
        enunciadoTxt.text = "\(valor1)\(operador)\(valor2)"
        
        //Imprimir Resultado en Consola
        let a = generarResultadoCorrecto()
        print(a)
        asignarRespuestas()
        
        enunciadoTxt.isHidden = false
        btn1.isEnabled = true
        btn1.isHidden = false
        btn2.isEnabled = true
        btn2.isHidden = false
        btn3.isEnabled = true
        btn3.isHidden = false
    }
    
    func reiniciar(){
        performSegue(withIdentifier: "returnMenuSegue", sender: self)
    }
    
    func transformarCadenaAExpresionMatematica() -> Int {
        let expresion:String = String(enunciadoTxt.text!)
        let mathExpression = NSExpression(format: "\(expresion)")
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Int ?? 999999999
        return mathValue
    }
    
    
    //IBActions
    @IBAction func comprobarRespuesta(_ sender: UIButton) {
        //Procesos en caso de que salga preguntados
        if(cara+1 == 1 || cara+1 == 3 || cara+1 == 5){
            let respUser = sender.currentTitle ?? "grbt"
            let respActual = quiz[anterior][1]
            if (respUser == respActual) {
                resultado = "VICTORIA"
            } else {
                resultado = "DERROTA"
            }
            if(resultado == "VICTORIA") {
                asignarPuntos()
            }
            if(resultado == "Derrota"){
                quitarVidas()
            }
            quiz.remove(at: anterior)
        }//Procesos en caso de que salga matematik
        else{
            let opcionEscogida = sender.currentTitle
            print(opcionEscogida ?? "Nulo")
            evaluarRespuesta(opcionEscogida ?? "Nulo")
        }
        
        bloquearBotones()
        LanzarDado.isEnabled = true
        
    }
    
    @IBAction func lanzarDado(_ sender: Any) {
        cara = obtenerCara()
        dadoImg.image = UIImage(named: caras[cara])
        LanzarDado.isEnabled = false
        GenerarReto.isEnabled = true
    }
    
    @IBAction func reto(_ sender: UIButton) {
        //cambiarturno()
        //establecerEtiquetaTurno()
        let puntos = cara+1
        if (puntos == 1 || puntos == 3 || puntos == 5) {
            //preguntas
            iniciarPreguntas()
        } else {
            //matematik
            inicializar()
        }
        GenerarReto.isEnabled = false
    }
    
    
    //ARREGLOS DE PREGUNTAS
    
    var quiz = [["",""]]
    //ArregloPreguntasBasico
    var quizBasico = [["¿La independencia de México inició en 1810?","Verdadero"],
                      ["¿Cristobal Colón exploró el nuevo mundo?","Verdadero"],
                      ["¿China es la civilización más antigua del mundo?","Falso"],
                      ["¿Momificación proviene del griego?","Falso"],
                      ["¿Thomas Edison fue un inversionista y empresario alemán?","Falso"],
                      ["¿Zeus es el rey de los dioses olímpicos en la mitología griega?","Verdadero"],
                      ["¿La Peste Negra afectó mayormente a Europa?","Verdadero"],
                      ["¿Hitler fue el líder del partido Nacional Socialista?","Verdadero"],
                      ["¿En Egipto solo alababan a un Dios?","Falso"],
                      ["¿El rey Arturo existió realmente como el rey de Gran Bretaña?","Falso"]]
    //ArregloPreguntasIntermedio
    var quizIntermedio = [
        ["¿El muro de Berlín fue derribado en 1989?","Verdadero"],
        ["¿Alejandro Magno fue el rey de la antigua Roma?","Falso"],
        ["¿Nueva Zelanda fue el primer país en otorgar a las mujeres el derecho al voto?", "Verdadero"],
        ["¿El día D en la Segunda Guera Mundial fue el 6 de Noviembre de 1944?","Falso"],
        ["¿Rusia se retiró de la Primera guerra Mundial por su revolución?","Verdadero"],
        ["¿La Gran Depresión ocurrió después de la Segunda Guerra Mundial?","Falso"],
        ["¿Los acontecimientos de Chernobyl fueron encubiertos por Rusia y descubiertos por Europa?","Verdadero"],
        ["¿El padre de Zeus es Atlas?","Falso"],
        ["¿La revolución bolchevique es la revolución rusa?","Verdadero"],
        ["¿Galileo Galilei creó el telescopio?","Falso"]]
    
    //ArregloPreguntasDificil
    var quizAvanzado =
    [["¿La guerra de los emús ocurrió?","Verdadero"],
     ["¿Napoleón es conocido como el Hombre de Sangre y Hierro?","Falso"],
     ["¿Erwin Rommel fue conocido como el zorro del desierto en la Segunda Guerra Mundial?","Verdadero"],
     ["¿La batalla del Alamein fue la última gran batalla de tanques de la historia?","Falso"],
     ["¿La Luftwaffe fue derrotada por última vez en la batalla de Inglaterra?","Verdadero"],
     ["¿La batalla de Stalingrado fue la más grande batalla de tanques de la historia?","Falso"],
     ["¿Hubo batallas navales durante la Primera Guera Mundial?","Verdadero"],
     ["¿La batalla de Guadalcanal aseguró la victoria estadounidense frente a Japón en la Segunda Guerra Mundial?","Falso"],
     ["¿Existió un artefacto o artilugio apodado Dora durante la Segunda Guerra Mundial?","Verdadero"],
     ["¿Ferdinand Porsche diseñó y creó algunos de los tanques durante la Segunda Guerra Mundial?","Verdadero"]]
    
    
    
    
}
