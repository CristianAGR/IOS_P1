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
    @IBOutlet weak var puntosj2: UILabel!
    @IBOutlet weak var vidas: UILabel!
    @IBOutlet weak var vidasj2: UILabel!
    @IBOutlet weak var enunciadoTxt: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var resultadoTxt: UILabel!
    
    //Variables Globales
    let caras = ["dado.png","dado-2.png","dado-3.png","dado-4.png","dado-5.png","dado-6.png"];
    var cara = 0
    var dificultad: String?
    var puntosGanar: String?
    var turno: Int?
    var vidasIniciales: String?
    var puntosV = 0;
    var puntosj2V = 0;
    var vidasV = 0;
    var vidasj2V = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        establecerPuntosYVidas()
        establecerEtiquetaTurno()
        dadoImg.image = UIImage(named: "dado.png")
        cas1.image = UIImage(named: "start.jpg")
        cas2.image = UIImage(named: "start.jpg")
        cas3.image = UIImage(named: "start.jpg")
        cas4.image = UIImage(named: "start.jpg")
        cas5.image = UIImage(named: "start.jpg")
        cas6.image = UIImage(named: "start.jpg")
        cas7.image = UIImage(named: "start.jpg")
        cas8.image = UIImage(named: "start.jpg")
        cas9.image = UIImage(named: "start.jpg")
        
        // Do any additional setup after loading the view.
    }
    
    //Funciones
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
        etiquetaPuntos.text = puntosGanar
        vidas.text = "Vidas: " + (etiquetaVidas.text ?? "10000")
        vidasj2.text = "Vidas: " + (etiquetaVidas.text ?? "10000")
    }
    
    func establecerEtiquetaTurno(){
        if(turno == 1){
            etiquetaTurnoJugador.text = "Es el turno del: Jugador1"
        }
        if(turno == 2){
            etiquetaTurnoJugador.text = "Es el turno del: Jugador2"
        }
    }
    
    func obtenerCara()->Int {
        let caraDado = Int.random(in: 0...5);
        return caraDado;
    }

    
    //IBActions
    
    @IBAction func lanzarDado(_ sender: Any) {
        cara = obtenerCara()
        dadoImg.image = UIImage(named: caras[cara])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let puntos = cara+1
        
        if (puntos == 1 || puntos == 3 || puntos == 5) {
            guard let enviarnombre = segue.destination as? QuizController else {return}
            enviarnombre.dificultad = dificultad
        } else {
            guard let enviarnombre = segue.destination as? ViewControllerMat else {return}
            enviarnombre.dificultad = dificultad
        }
        
    }
    @IBAction func reto(_ sender: UIButton) {
        cambiarturno()
        establecerEtiquetaTurno()
        let puntos = cara+1
        if (puntos == 1 || puntos == 3 || puntos == 5) {
            //preguntas
            iniciarPreguntas()
        } else {
            
        }
    }
    
    //Funciones preguntas
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
    
    var resultado = ""
    var anterior:Int = 0
    func bloquearBotones() {
        enunciadoTxt.isHidden = true
        
        btn1.isEnabled = false
        btn1.isHidden = true
        btn2.isEnabled = false
        btn2.isHidden = true
        btn3.isEnabled = false
        btn3.isHidden = true
    }
    
    func iniciarPreguntas() {
        enunciadoTxt.isHidden = false
        btn1.isEnabled = true
        btn1.isHidden = false
        btn3.isEnabled = true
        btn3.isHidden = false
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
    
    @IBAction func comprobarRespuesta(_ sender: UIButton) {
        let respUser = sender.currentTitle ?? "grbt"
        let respActual = quiz[anterior][1]
        
        print(respUser)
        print(respActual)
        
        if (respUser == respActual) {
            resultado = "VICTORIA"
        } else {
            resultado = "DERROTA"
        }
        print(resultado)
        
        
        if(resultado == "VICTORIA") {
            asignarPuntos()
        }
        quiz.remove(at: anterior)
        bloquearBotones()
    }
    
    func asignarPuntos(){
        if (turno == 1) {
            puntosV += 1;
            puntos.text = String(puntosV);
            if (puntosV == Int(puntosGanar ?? "80")) {
                resultadoTxt.text = "Has ganado Jugador 1"
            }
        } else {
            puntosj2V += 1;
            puntosj2.text = String(puntosj2V);
            if (puntosj2V == Int(puntosGanar ?? "80")) {
                resultadoTxt.text = "Has ganado Jugador 2"
            }
        }
        
    }
    

}


