//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "MedulaOne-Regular", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)

let font = UIFont(name: "MedulaOne-Regular", size: 85)!

let cfURL2 = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)

let font2 = UIFont(name: "Quicksand", size: 17)!



class MyViewController : UIViewController {
   
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.isHidden = true
        
        //Name
        let name = UILabel()
        name.frame = CGRect(x: 330, y: 25, width: 400, height: 100)
        name.text = "BetterEye"
        name.textColor = .black
        name.font = font
        
        //Logo
        let elipses = UIImage(named: "logo.png")
        let logo  = UIImageView(image:elipses)
        logo.frame = CGRect (x: 170, y: 20, width: 120, height: 120)
        
        //Comando
        let command = UILabel()
        command.frame = CGRect(x: 250, y: 200, width: 300, height: 55)
        command.text = "Escolha um cenário"
        command.textColor = .black
        command.font = UIFont(name: "Quicksand-Bold", size: 30)
        
        //Varal
        let varal = UIImage(named: "CurveLine.png")
        let varalView  = UIImageView(image:varal)
        varalView.frame = CGRect (x: 0, y: 250, width: 900, height: 90)
        
        //Cenario1 - imagem
        let retangulo1 = UIImage(named: "RectangleWhite.png")
        let retangulo1View  = UIImageView(image:retangulo1)
        retangulo1View.frame = CGRect (x: 15, y: 10, width: 120, height: 160)
        
        //Cenario1
         let cenario1 = UIImage(named: "RectangleAzul.png")
         let btmCenario1 = UIButton()
         btmCenario1.frame = CGRect(x: 70, y: 400, width: 150, height: 190)
         btmCenario1.setBackgroundImage(cenario1, for: .normal)
        
        //Adding action o button
        btmCenario1.addTarget(nil, action: #selector(tapCenario1), for: .touchUpInside)
        
        //Adding button of cenario to blue card
        btmCenario1.addSubview(retangulo1View)
        view.addSubview(btmCenario1)
      
        
        //Cenario2
        let retangulo2 = UIImage(named: "RectangleAzul.png")
        let retangulo2View  = UIImageView(image:retangulo2)
        retangulo2View.frame = CGRect (x: 310, y: 400, width: 150, height: 190)
        
        //Cenario3
        let retangulo3 = UIImage(named: "RectangleAzul.png")
        let retangulo3View  = UIImageView(image:retangulo3)
        retangulo3View.frame = CGRect (x: 550, y: 400, width: 150, height: 190)
        
         
         //Botão Meus Aprendizados
         let semiCirculo = UIImage(named:"semiCirculo.png")
         let btmMeusAprendizados = UIButton()
         btmMeusAprendizados.frame = CGRect(x: 200, y: 860, width: 360, height: 164)
         btmMeusAprendizados.setBackgroundImage(semiCirculo, for: .normal)
         //btmMeusAprendizados.setTitle("Meus Aprendizados", for: .normal)
        //btmMeusAprendizados.titleLabel?.text = "Meus Aprendizados"
        //btmMeusAprendizados.titleLabel?.font = font2
        //btmMeusAprendizados.titleLabel?.textAlignment = .center
        //btmMeusAprendizados.titleLabel?.frame = CGRect(x: 100, y: 550, width: 100, height: 200)
        //btmMeusAprendizados.titleLabel?.numberOfLines = 2
       
        //btmMeusAprendizados.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        //btmMeusAprendizados.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        //btmMeusAprendizados.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping

        let label = UILabel()
        label.text = "Meus Aprendizados"
        label.font = UIFont(name: "Quicksand-Bold", size: 37)
        label.textColor = .white
        label.frame = CGRect(x: 40, y: 0, width: 270, height: 200)
        label.numberOfLines = 2
        label.textAlignment = .center
        btmMeusAprendizados.addSubview(label)
        
        btmMeusAprendizados.addTarget(nil, action: #selector(tapMeusAprendizados), for: .touchUpInside)

        
        

        
        view.addSubview(name)
        view.addSubview(logo)
        view.addSubview(command)
        view.addSubview(varalView)
        //view.addSubview(retangulo1View)
        view.addSubview(retangulo2View)
        view.addSubview(retangulo3View)
        view.addSubview(btmMeusAprendizados)
        //view.addSubview(labelMeusAprendizados)

        self.view = view
    }
    
    @objc func tapMeusAprendizados() {
        //show(aprendizadosViewController, sender: nil)
        
        //present(aprendizadosViewController, animated: true, completion: nil)
        
        navigationController?.pushViewController(aprendizadosViewController, animated: true)
        
    }
    
    
    @objc func tapCenario1() {
        //show(aprendizadosViewController, sender: nil)
        //present(aprendizadosViewController, animated: true, completion: nil)
        navigationController?.pushViewController(cenarioViewController, animated: true)
        
    }
    
}

class AprendizadosViewController : UIViewController, UICollectionViewDataSource{
    
    var aprendizadosImagens = [UIImage]()
    
    //teste:

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        aprendizadosImagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        let whiteBackground = UIImageView (image: UIImage(named:"RectangleAzul.png"))
        let icon = UIImageView (image: aprendizadosImagens[indexPath.row])
        icon.frame = CGRect(x:35 , y: 35, width: 340, height: 350)
        
       
        whiteBackground.addSubview(icon)
        
        //icon.center = whiteBackground.center
        
        myCell.backgroundView = whiteBackground
        
        //UIImage(named: cachorros[indexPath.row].imagemSilhueta)
        return myCell
    }

    
    var aprendizadosCollection: UICollectionView?
    //var icones = []
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        
        //Configurando CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 400, height: 400)
        layout.scrollDirection = .horizontal
        
        // Inicializando Collection com o tamanho e layout desejado
        aprendizadosCollection = UICollectionView(frame: CGRect(x: 200, y: 300, width: 570, height: 480), collectionViewLayout: layout)
        
        //: Registrando qual a classe que será usada para desenhar cada célula do UICollectionView
        aprendizadosCollection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        aprendizadosCollection?.backgroundColor = UIColor.white
        aprendizadosCollection?.dataSource = self
        aprendizadosCollection?.backgroundColor = .red
        
        
        //teste:
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
//        aprendizadosImagens.append(UIImage(named:"logo.png")!)
        
        
        
        
        view.addSubview(aprendizadosCollection!)
        
        //Title
        let elipse = UIImage(named: "semiCirculo2.png")
        let elipseImage = UIImageView(image:elipse)
        elipseImage.frame = CGRect (x: 80, y: 0, width: 230, height: 100)
        
        
        let labelMeusAprendizados = UILabel()
               labelMeusAprendizados.frame = CGRect(x: 30, y: 0, width: 170, height: 70)
               labelMeusAprendizados.text = "Meus Aprendizados"
               labelMeusAprendizados.textColor = .white
               //labelMeusAprendizados.font = font2
               labelMeusAprendizados.font = UIFont(name:"Quicksand-Bold", size: 23.0)
               labelMeusAprendizados.numberOfLines = 2
               labelMeusAprendizados.textAlignment = .center
        
        elipseImage.addSubview(labelMeusAprendizados)
        
        //Botao voltar
         let voltarImage = UIImage(named:"backbtm.png")
         let btmBack = UIButton()
         btmBack.frame = CGRect(x: 30, y: 920, width: 75, height: 75)
         btmBack.setBackgroundImage(voltarImage, for: .normal)
        btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        
        // Containers
        let box = UIImage(named: "RectangleWhite.png")
        let boxImage1  = UIImageView(image:box)
        boxImage1.frame = CGRect (x: 50, y: 200, width: 60, height: 60)
        
        let boxImage2  = UIImageView(image:box)
        boxImage2.frame = CGRect (x: 130, y: 200, width: 60, height: 60)
        
        let boxImage3  = UIImageView(image:box)
        boxImage3.frame = CGRect (x: 210, y: 200, width: 60, height: 60)
        
        let boxImage4  = UIImageView(image:box)
        boxImage4.frame = CGRect (x: 290, y: 200, width: 60, height: 60)
        
        
        view.addSubview(elipseImage)
        //view.addSubview(labelMeusAprendizados)
        //view.addSubview(boxImage1)
        //view.addSubview(boxImage2)
        //view.addSubview(boxImage3)
        //view.addSubview(boxImage4)
        view.addSubview(btmBack)
        self.view = view
    }
    
    
    
    @objc func tapBack() {
        //show(aprendizadosViewController, sender: nil)
        dismiss(animated: true, completion: nil)
        
    }
}


class Cenario1ViewController : UIViewController {

    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        //navigationController?.navigationBar.isHidden = false
    
    
        //Botao voltar
         let voltarImage = UIImage(named:"backbtm.png")
         let btmBack = UIButton()
         btmBack.frame = CGRect(x: 30, y: 610, width: 40, height: 40)
         btmBack.setBackgroundImage(voltarImage, for: .normal)
        btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        view.addSubview(btmBack)
        self.view = view
    }
    
    
    @objc func tapBack() {
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }
}





let firstViewController = MyViewController(screenType: .ipad, isPortrait: true)
let aprendizadosViewController = AprendizadosViewController(screenType: .ipad, isPortrait: true)
//aprendizadosViewController.scale(to: 0.4)
aprendizadosViewController.modalPresentationStyle = .fullScreen
let cenarioViewController = Cenario1ViewController(screenType: .ipad, isPortrait: true)
//let navigation = UINavigationController(rootViewController: firstViewController)
let navigation = UINavigationController(screenType: .ipad, isPortrait: true)
navigation.navigationBar.isHidden = true
//navigation.pushViewController(firstViewController, animated: false)
navigation.pushViewController(aprendizadosViewController, animated: false)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)



