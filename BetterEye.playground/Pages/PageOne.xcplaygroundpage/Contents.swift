//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "MedulaOne-Regular", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)

let font = UIFont(name: "MedulaOne-Regular", size: 85)!

let cfURL2 = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)

let font2 = UIFont(name: "Quicksand", size: 17)!

var aprendizadosImagens = [UIImage]()


class MyViewController : UIViewController {
   
    override func loadView() {
        let view = UIView()
        //view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        let background = UIImageView (image: UIImage(named:"Background.png"))
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
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
        command.frame = CGRect(x: 180, y: 180, width: 400, height: 100)
        command.text = "Olá, \n Escolha um cenário"
        command.textColor = .black
        command.numberOfLines = 2
        command.textAlignment = .center
        command.font = UIFont(name: "Quicksand-Bold", size: 40)
        
        //Photo Album
        let varal = UIImage(named: "PhotoAlbum.png")
        let varalView  = UIImageView(image:varal)
        varalView.frame = CGRect (x: 40, y: 200, width: 700, height: 700)
        
        
        //Cenario1
         let cenario1 = UIImage(named: "Cenario.png")
         let btmCenario1 = UIButton()
         btmCenario1.frame = CGRect(x: 175, y: 373, width: 125, height: 110)
         btmCenario1.setBackgroundImage(cenario1, for: .normal)
        
        //Adding action o button
        btmCenario1.addTarget(nil, action: #selector(tapCenario1), for: .touchUpInside)
         
         //Botão Meus Aprendizados
         let semiCirculo = UIImage(named:"PinkRectangle.png")
         let btmMeusAprendizados = UIButton()
         btmMeusAprendizados.frame = CGRect(x: 220, y: 880, width: 340, height: 97)
         btmMeusAprendizados.setBackgroundImage(semiCirculo, for: .normal)
         btmMeusAprendizados.setTitle("Aprendizados", for: .normal)
        //btmMeusAprendizados.titleLabel?.text = "Meus Aprendizados"
        btmMeusAprendizados.titleLabel?.font = UIFont(name: "Quicksand-Bold", size: 35)

        
        btmMeusAprendizados.addTarget(nil, action: #selector(tapMeusAprendizados), for: .touchUpInside)

        
        

        view.addSubview(background)
        view.addSubview(name)
        view.addSubview(logo)
        view.addSubview(command)
        view.addSubview(varalView)
        view.addSubview(btmMeusAprendizados)
        view.addSubview(btmCenario1)

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

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        aprendizadosImagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        let whiteBackground = UIImageView (image: UIImage(named:"BackWhiteIcon.png"))
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
        
        //background
        let background = UIImageView (image: UIImage(named:"Background.png"))
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        
        
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
        aprendizadosCollection?.backgroundColor = .white
        
        
        
        
        
        //Title
        let rectangle = UIImageView(image: UIImage(named: "PinkRectangle.png"))
        rectangle.frame = CGRect (x: 130, y: -50, width: 460, height: 200)
    
    
        let labelMeusAprendizados = UILabel()
               labelMeusAprendizados.frame = CGRect(x: 220, y: 20, width: 300, height: 70)
               labelMeusAprendizados.text = "Aprendizados"
               labelMeusAprendizados.textColor = .white
               //labelMeusAprendizados.font = font2
               labelMeusAprendizados.font = UIFont(name:"Quicksand-Bold", size: 42)
               labelMeusAprendizados.numberOfLines = 2
               labelMeusAprendizados.textAlignment = .center
        
        //rectangle.addSubview(labelMeusAprendizados)
        
        //Label Cenario
        let labelCenario = UILabel()
        labelCenario.frame = CGRect(x: 65, y: 210, width: 200, height: 70)
        labelCenario.text = "Cenário 1:"
        labelCenario.font = UIFont(name:"Quicksand-Bold", size: 35)
        
        
        //Botao voltar
         let voltarImage = UIImage(named:"Backbtm-2.png")
         let btmBack = UIButton()
         btmBack.frame = CGRect(x: 30, y: 920, width: 75, height: 75)
         btmBack.setBackgroundImage(voltarImage, for: .normal)
         btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        
        
        view.addSubview(background)
        view.addSubview(rectangle)
        view.addSubview(labelMeusAprendizados)
        view.addSubview(labelCenario)
        //view.addSubview(labelMeusAprendizados)
        //view.addSubview(boxImage1)
        //view.addSubview(boxImage2)
        //view.addSubview(boxImage3)
        //view.addSubview(boxImage4)
        view.addSubview(btmBack)
        view.addSubview(aprendizadosCollection!)
        self.view = view
    }
    
    
    
    @objc func tapBack() {
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        //print("chegou em tapback")
        navigationController?.popViewController(animated: true)
        
    }
}


class Cenario1ViewController : UIViewController {

    var achouLupa = false
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        //navigationController?.navigationBar.isHidden = false
    
    
        //Command
        let command = UILabel()
        command.text = "Encontre: "
        command.font = UIFont(name: "Quicksand-Bold", size: 47)
        command.frame = CGRect(x: 50, y: 30, width: 300, height: 200)
        
        //White Container
        let whiteRectangle = UIImageView(image: UIImage(named:"whiteLongRectangle"))
        whiteRectangle.frame = CGRect(x: 300, y: 93, width: 350, height: 78)
        
        //Cenario
        let cenario = UIImageView (image: UIImage (named: "Cenario.png"))
        cenario.frame = CGRect (x:43, y:200, width: 680, height: 670)
        
        //Botao Lupa
        let lupaImage = UIImage(named:"Lupa.png")
        let btmLupa = UIButton()
        btmLupa.frame = CGRect(x: 176, y:530, width: 30, height: 30)
        btmLupa.setBackgroundImage(lupaImage, for: .normal)
        btmLupa.addTarget(nil, action: #selector(tapLupa), for: .touchUpInside)
        
        //Botao voltar
         let voltarImage = UIImage(named:"Backbtm-2.png")
         let btmBack = UIButton()
         btmBack.frame = CGRect(x: 30, y: 920, width: 75, height: 75)
         btmBack.setBackgroundImage(voltarImage, for: .normal)
         btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        
        view.addSubview(cenario)
        view.addSubview(btmLupa)
        view.addSubview(btmBack)
        view.addSubview(command)
        view.addSubview(whiteRectangle)
        
        self.view = view
    }
    
    
    @objc func tapBack() {
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func tapLupa() {
        
        if(!achouLupa){
            aprendizadosImagens.append(UIImage(named:"Lupa.png")!)
            aprendizadosViewController.aprendizadosCollection!.reloadData()
            achouLupa = true
        }
            
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
        
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
navigation.pushViewController(firstViewController, animated: false)
//navigation.pushViewController(aprendizadosViewController, animated: false)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)



