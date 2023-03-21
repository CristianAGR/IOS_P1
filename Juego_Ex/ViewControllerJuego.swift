//
//  ViewControllerJuego.swift
//  Juego_Ex
//
//  Created by ISSC_611_2023 on 21/03/23.
//

import UIKit

class ViewControllerJuego: UIViewController {

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

    @IBAction func establecerJuego(_ sender: UIButton) {
        let juego = sender.currentTitle
        self.performSegue(withIdentifier: "irDificultad", sender: self)
    }
}
