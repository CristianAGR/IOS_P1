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
    // tematica: preguntas raras de historia
    var quiz = [["La guerra de los emús, ¿existió?", "True"], ["El 10 de mayo es dìa de las madres?", "True"], ["El 412 es mejor que el 411?", "True"], ["La comida llamada guacamaya es originaria de CDMX", "False"], ["El nombre real de pigy es carlos", "True"], ["Los procesadores son hechos con silicio?", "True"], ["GPU son las siglas para graphic processor unity", "True"], ["China es el pais mas grande del mundo", "False"], ["El oceano atlantico es el mas grande del mundo", "False"], ["El heptagono tiene 11 lados", "False"], ["El animal que provoca mas muertes al año es el tiburon", "False"], ["El cuerpo humano tiene 206 huesos", "True"], ["Messi es el futbolista con mas balones de oro", "True"], ["El platino es el mineral mas duro del planeta", "False"], ["Un gusano de tierra tiene 5 corazones", "True"], ["Shanghai es la ciudad mas poblada del mundo", "False"], ["Hitler nacio en Austria", "True"], ["La bandera olimpica tiene 3 anillos", "False"], ["Un lustro son 1000 años", "False"], ["Una araña tiene 6 patas", "False"], ["La moneda de Japon es el yen", "True"]]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniciar()
        anterior = lanzarPregunta()
        image.image = UIImage(named: "start.jpg")
        // Do any additional setup after loading the view.
    }
    
    func iniciar() {
        if (dificultadLabel.text == "Basico") {
            victoria = 5
            vidasValue = 3
            quiz = quizBasico
        } else if (dificultadLabel.text == "Intermedio") {
            victoria = 7
            vidasValue = 2
        } else if (dificultadLabel.text == "Avanzado") {
            victoria = 10
            vidasValue = 1
            
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
