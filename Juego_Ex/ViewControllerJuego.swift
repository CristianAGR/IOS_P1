//
//  ViewControllerJuego.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 21/03/23.
//

import UIKit

class ViewControllerJuego: UIViewController {

    //Objetos en vista
    @IBOutlet weak var etiquetaParaDefinirJuego: UILabel!
    
    
    //Variables Globales
    
    
    //ViewLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Funciones
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let enviarJuego = segue.destination as? ViewControllerDificultad else {return}
        enviarJuego.juegoAJugar = etiquetaParaDefinirJuego.text
    }
    
    //Actions
    @IBAction func establecerJuego(_ sender: UIButton) {
        etiquetaParaDefinirJuego.text = sender.titleLabel?.text ?? ""
        self.performSegue(withIdentifier: "irDificultad", sender: self)
    }
}
