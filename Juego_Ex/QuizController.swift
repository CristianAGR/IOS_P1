//
//  QuizController.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 16/03/23.
//


import UIKit

class QuizController: UIViewController {

    @IBOutlet weak var etiquetaParaVidas: UILabel!
    @IBOutlet weak var etiquetaParaPuntos: UILabel!
    @IBOutlet weak var etiquetaParaDificultad: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var preguntaTxt: UILabel!
    @IBOutlet weak var vidas: UILabel!
    @IBOutlet weak var puntuacion: UILabel!
    @IBOutlet weak var dificultadLabel: UILabel!
    @IBOutlet weak var btnV: UIButton!
    @IBOutlet weak var btnF: UIButton!
    
    var anterior:Int = 0
    var puntuacionValue:Int = 0
    var incorrecto:Int = 0
    var victoria:Int = 0
    var derrota:Int = 0
    var resultado = ""
    var vidasValue = 0
    
    var dificultad: String?
    // tematica: preguntas raras de historia
    var quiz = [["",""]]//ArregloPreguntasBasico
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
    ["¿Nueva Zelanda fue el primer país en otorgar a las muejeres el derecho al voto?", "Verdadero"],
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
    override func viewDidLoad() {
        super.viewDidLoad()
        iniciar()
        anterior = lanzarPregunta()
        image.image = UIImage(named: "start.jpg")
        // Do any additional setup after loading the view.
    }
    
    func iniciar() {
        dificultadLabel.text = dificultad
        if (dificultadLabel.text == "BÁSICO!!!!!") {
            victoria = 5
            vidasValue = 3
            quiz = quizBasico
        } else if (dificultadLabel.text == "Intermedio") {
            victoria = 7
            vidasValue = 2
            quiz = quizIntermedio
        } else if (dificultadLabel.text == "Avanzado") {
            victoria = 10
            vidasValue = 1
            quiz = quizAvanzado
        }
        vidas.text = "Vidas: " + String(vidasValue)
    }
    
    func lanzarPregunta()->Int {
        let aleatorio = Int.random(in: 0...quiz.count-1)
        preguntaTxt.text = quiz[aleatorio][0]
        return aleatorio
    }
    
    func bloquearBotones() {
        btnV.isEnabled = false
        btnF.isEnabled = false
    }
    
    @IBAction func comprobarRespuesta(_ sender: UIButton) {
        let respUser = sender.currentTitle ?? "grbt"
        let respActual = quiz[anterior][1]
        print(respUser)
        print(respActual)
        
        if (respUser == respActual) {
            puntuacionValue += 1
            vidas.text = "Vidas: " + String(vidasValue)
            puntuacion.text = "Puntuacion: " + String(puntuacionValue)
            image.image = UIImage(named: "Correcto")
            if (puntuacionValue == victoria) {
                resultado = "VICTORIA"
                bloquearBotones()
                //performSegue(withIdentifier: "finSegue", sender: self)
            }
        } else {
            incorrecto += 1
            vidasValue -= 1
            vidas.text = "Vidas: " + String(vidasValue)
            puntuacion.text = "Puntuacion: " + String(puntuacionValue)
            image.image = UIImage(named: "incorrecto")
            if (vidasValue == derrota) {
                resultado = "DERROTA"
                bloquearBotones()
                //performSegue(withIdentifier: "finSegue", sender: self)
            }
            
        }
        print(resultado)
        
        
        //print(sender .title)
        quiz.remove(at: anterior)
        anterior = lanzarPregunta()
    }
    
    

}