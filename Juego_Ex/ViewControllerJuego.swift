//
//  ViewControllerJuego.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 21/03/23.
//

import UIKit

class ViewControllerJuego: UIViewController {

    @IBOutlet weak var etiquetaApoyo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let enviarnombre = segue.destination as? ViewControllerDificultad else {return}
        enviarnombre.juego = etiquetaApoyo.text
    }
    @IBAction func establecerJuego(_ sender: UIButton) {
        etiquetaApoyo.text = sender.titleLabel?.text ?? ""
        self.performSegue(withIdentifier: "irDificultad", sender: self)
    }
}
