//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "MedulaOne-Regular", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)

let font = UIFont(name: "MedulaOne-Regular", size: 50)!

let cfURL2 = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)

let font2 = UIFont(name: "Quicksand", size: 17)!


class MyViewController : UIViewController {
   
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        
        //Name
        let name = UILabel()
        name.frame = CGRect(x: 160, y: 25, width: 200, height: 55)
        name.text = "BetterEye"
        name.textColor = .black
        name.font = font
        
        //Logo
        let elipses = UIImage(named: "logo.png")
        let logo  = UIImageView(image:elipses)
        logo.frame = CGRect (x: 70, y: 15, width: 80, height: 80)
        
        //Comando
        let command = UILabel()
        command.frame = CGRect(x: 110, y: 120, width: 200, height: 55)
        command.text = "Escolha um cenário"
        command.textColor = .black
        command.font = font2
        
        //Varal
        let varal = UIImage(named: "CurveLine.png")
        let varalView  = UIImageView(image:varal)
        varalView.frame = CGRect (x: 0, y: 130, width: 390, height: 90)
        
        //Cenario1
        let retangulo1 = UIImage(named: "RectangleAzul.png")
        let retangulo1View  = UIImageView(image:retangulo1)
        retangulo1View.frame = CGRect (x: 40, y: 230, width: 70, height: 90)
        
        //Cenario2
        let retangulo2 = UIImage(named: "RectangleAzul.png")
        let retangulo2View  = UIImageView(image:retangulo1)
        retangulo2View.frame = CGRect (x: 160, y: 230, width: 70, height: 90)
        
        //Cenario3
        let retangulo3 = UIImage(named: "RectangleAzul.png")
        let retangulo3View  = UIImageView(image:retangulo1)
        retangulo3View.frame = CGRect (x: 280, y: 230, width: 70, height: 90)
        
         
         //Botão Meus Aprendizados
         let semiCirculo = UIImage(named:"semiCirculo.png")
         let btmMeusAprendizados = UIButton()
         btmMeusAprendizados.frame = CGRect(x: 100, y: 500, width: 190, height: 90)
         btmMeusAprendizados.setBackgroundImage(semiCirculo, for: .normal)
        //btmMeusAprendizados.titleLabel?.text = "Meus Aprendizados"
        
        //Label Meus Aprendizados
        let labelMeusAprendizados = UILabel()
        labelMeusAprendizados.frame = CGRect(x: 125, y: 398, width: 140, height: 300)
        labelMeusAprendizados.text = "Meus Aprendizados"
        labelMeusAprendizados.textColor = .white
        labelMeusAprendizados.font = font2
        labelMeusAprendizados.numberOfLines = 2
        labelMeusAprendizados.textAlignment = .center


        
        view.addSubview(name)
        view.addSubview(logo)
        view.addSubview(command)
        view.addSubview(varalView)
        view.addSubview(retangulo1View)
        view.addSubview(retangulo2View)
        view.addSubview(retangulo3View)
        view.addSubview(btmMeusAprendizados)
        view.addSubview(labelMeusAprendizados)

        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
