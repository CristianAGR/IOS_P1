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
    
    //Variables Globales
    let caras = ["dado.png","dado-2.png","dado-3.png","dado-4.png","dado-5.png","dado-6.png"];
    var cara = 0
    var dificultad: String?
    var puntosGanar: String?
    var turno: Int?
    var vidasIniciales: String?
    
    
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
            
        } else {
            //Matematik
            
        }
    }
    

}


