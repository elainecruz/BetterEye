//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import AVFoundation


let cfURL = Bundle.main.url(forResource: "MedulaOne-Regular", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)

let font = UIFont(name: "MedulaOne-Regular", size: 65)!

let cfURL2 = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)

let font2 = UIFont(name: "Quicksand", size: 17)!


let cfURL3 = Bundle.main.url(forResource: "Quicksand", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL3 as CFURL, CTFontManagerScope.process, nil)


let cfURL4 = Bundle.main.url(forResource: "IndieFlower", withExtension: "ttf")!

CTFontManagerRegisterFontsForURL(cfURL4 as CFURL, CTFontManagerScope.process, nil)

let font3 = UIFont(name: "IndieFlower-Regular", size: 60)


var aprendizadosImagens = [UIImage]()

var indexCollection: Int = 0

var icones = [UIImageView]()
var titles = [UILabel]()
var texts = [UILabel]()


class MyViewController : UIViewController {
    
    private var chompPlayer: AVAudioPlayer?
    public var lockSquareView = UIImageView()
    public var lockArchViewContainer = UIView()
   
    override func loadView() {
        let view = UIView()
        //view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        let background = UIImageView (image: UIImage(named:"Background.png"))
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        navigationController?.navigationBar.isHidden = true
        
        chompPlayer = createPlayer(from: "unlock")
        
        //Name
        let name = UILabel()
        name.frame = CGRect(x: 330, y: 25, width: 400, height: 100)
        name.text = "BetterEye"
        name.textColor = .black
        name.font =  UIFont(name: "IndieFlower", size: 40)
        
        //Logo
        let elipses = UIImage(named: "logo-2.png")
        let logo  = UIImageView(image:elipses)
        logo.frame = CGRect (x: 230, y: 40, width: 70, height: 60)
        
        //Comando
        let command = UILabel()
        command.frame = CGRect(x: 180, y: 180, width: 400, height: 100)
        command.text = "Olá, \n Escolha um cenário"
        command.textColor = .black
        command.numberOfLines = 2
        command.textAlignment = .center
        command.font = UIFont(name: "Quicksand-Bold", size: 40)
        
        //Photo Album
        let varal = UIImage(named: "album-2.png")
        let varalView  = UIImageView(image:varal)
        varalView.frame = CGRect (x: 40, y: 200, width: 700, height: 700)
        
        //Padlock that will unlock
        
        lockArchViewContainer = UIView(frame: CGRect(x: 490, y: 315, width: 250 , height: 250 ))
        lockArchViewContainer.clipsToBounds = true
        //lockContainer.addSubview(lockArchViewContainer)

        let lockArchView = UIImageView(image: UIImage(named: "lockArch.png"))
        lockArchView.frame = CGRect(x: 20, y: 62, width: 58 , height: 50 )
        lockArchView.layer.anchorPoint = CGPoint(x: 22.0/45.0, y: 50.0/110.0)
        lockArchViewContainer.addSubview(lockArchView)

        lockSquareView = UIImageView(image: UIImage(named: "lockSquare.png"))
        lockSquareView.frame = CGRect(x: 18, y:105, width: 68, height: 55)
        //lockContainer.addSubview(lockSquareView)
        lockArchViewContainer.addSubview(lockSquareView)

       
        
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
        view.addSubview(lockArchViewContainer)

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
    
    func animationPadlock(){
        
        UIView.animate(withDuration: 0.15, delay: 0, options:.beginFromCurrentState, animations: {
            
//            let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
//            self.lockArchViewContainer.transform = scale
            
            self.lockSquareView.frame = CGRect(x: 18, y:115, width: 68, height: 55)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
            
            self.chompPlayer?.play()
        }
    }
    
    func createPlayer(from filename: String) -> AVAudioPlayer? {
      guard let url = Bundle.main.url(
        forResource: filename,
        withExtension: "mp3"
        ) else {
          return nil
      }
      var player = AVAudioPlayer()

      do {
        try player = AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
      } catch {
        print("Error loading \(url.absoluteString): \(error)")
      }

      return player
    }
    
}

class AprendizadosViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    
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
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let saibaMaisViewController = SaibaMaisViewController(screenType: .ipad, isPortrait: true)
        
        //Trocar para achou[indexpath.row]
        if((cenarioViewController.achouLupa && indexPath.row==0) || (cenarioViewController.achouMegaphone && indexPath.row==1) || (cenarioViewController.achouConnect && indexPath.row==2)) {
            saibaMaisViewController.iconCard = icones[indexPath.row]
            saibaMaisViewController.titleCard = titles[indexPath.row]
            saibaMaisViewController.textCard = texts[indexPath.row]
            
            
            if(indexPath.row>0){
                saibaMaisViewController.titleCard.frame = CGRect(x: 150, y: 320, width: 700, height: 100)
            }else{
                saibaMaisViewController.titleCard.frame = CGRect(x: 120, y: 320, width: 700, height: 100)
            }
            
            navigation.pushViewController(saibaMaisViewController, animated: false)
        }
        
        
    }
    
    var aprendizadosCollection: UICollectionView?
    //var icones = []
    
   
    var aux = [UILabel]()
    var aux2 = [UILabel]()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        
        //aprendizadosCollection?.allowsSelection = true
        
        icones.append(UIImageView(image: UIImage(named: "Lupa.png")))
        aux.append(UILabel())
        aux.append(UILabel())
        aux.append(UILabel())
        aux2.append(UILabel())
        aux2.append(UILabel())
        aux2.append(UILabel())
        
        aux[0].text = "Não coloque rótulos na criança"
        titles.append(aux[0])
        aux2[0].text = "    Dizer para seu/sua filho(a) que ele(a) é agressivo(a), por exemplo, é extremamente limitador para o desenvolvimento da personalidade dele(a) e pode vir a agravar os comportamentos agressivos. \n \n           Uma alternativa a esse comentário seria dizer que  “a raiva o deixou agressivo, por exemplo."
        texts.append(aux2[0])
        aux[1].text = "Sugira a atitude desejada"
        aux2[1].text = "    Dizer para seu filho que ele deve para de correr ou para de gritar pode motivá-lo a continuar fazendo tal ação. Ao invés disso diga explicitamente o que você deseja que ele faça no lugar disso. \n \n    Troque o pare de gritar por você pode usar uma voz mais calma e baixa?"
        aux[2].text = "Conecte-se antes de corrigir"
        aux2[2].text = "    É muito difícil influenciar positivamente uma criança se não houver uma conexão com ela. Conexão cria um ambiente seguro e honesto. Com isso, a criança fica mais aberta para uma correção respeitosa. \n\n    Pode-se substituir o pare de chorar por eu entendo como você se sente."
        titles.append(aux[1])
        texts.append(aux2[1])
        titles.append(aux[2])
        texts.append(aux2[2])
        
        icones.append(UIImageView(image: UIImage(named: "megaphone.png")))
        icones.append(UIImageView(image: UIImage(named: "connect.png")))

        
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
        aprendizadosCollection?.dataSource = self
        aprendizadosCollection?.backgroundColor = .clear
        aprendizadosCollection?.delegate = self
        aprendizadosImagens.append(UIImage(named: "LupaShadow2.png")!)
        aprendizadosImagens.append(UIImage(named:"megaphoneShadow.png")!)
        aprendizadosImagens.append(UIImage(named: "connectShadow.png")!)
        
        
        
        
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

    private var chompPlayer: AVAudioPlayer?
    private var FoundPlayer: AVAudioPlayer?
    
    public var achouLupa = false
    public var achouMegaphone = false
    public var achouConnect = false
    
    let command = UILabel()
    let whiteRectangle = UIImageView(image: UIImage(named:"whiteLongRectangle"))
    let voceEncontrou = UILabel()
    
    
    //Pop Up
    let popupBackground = UIImageView(image: UIImage(named: "popup.png"))
    var lupaPopUp = UIImageView(image: UIImage(named: "Lupa.png"))
    var titlePopUp = UILabel(frame: CGRect(x: 190, y: 450, width: 500, height: 100))
    var textPopUp = UILabel(frame: CGRect(x: 100, y:400, width: 550, height: 500))
    let okImage = UIImage(named:"okBtm.png")
    let btmOk = UIButton(frame: CGRect(x: 350, y: 880, width: 75, height: 75))
    let rectangleStroke = UIImage(named: "RectangleStroke.png")
    let btmSaibaMais = UIButton(frame:CGRect(x: 500, y: 800, width: 150, height: 50))
    
    
    let lupaCheck = UIImageView(image: UIImage(named: "check.png"))
    let megaphoneCheck = UIImageView(image: UIImage(named: "check.png"))
    let connectCheck = UIImageView(image: UIImage(named: "check.png"))

    //finished pop up
    let finishedPopUp = UIImageView(image: UIImage(named:"finishedPopup.png"))
    
    let finishedLabel = UILabel()
    
    //let okImage = UIImage(named:"okBtm.png")
    let btmOk2 = UIButton(frame: CGRect(x: 350, y: 680, width: 55, height: 55))
    
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.968627451, blue: 1, alpha: 1)
        //navigationController?.navigationBar.isHidden = false
    
        chompPlayer = createPlayer(from: "tada")
        FoundPlayer = createPlayer2(from: "success")
        
        //Logo
        let elipses = UIImage(named: "logo-2.png")
        let logo  = UIImageView(image:elipses)
        logo.frame = CGRect (x: 350, y: 25, width: 60, height: 50)
    
        //Command
        command.text = "Encontre: "
        command.font = UIFont(name: "Quicksand-Bold", size: 47)
        command.frame = CGRect(x: 50, y: 65, width: 300, height: 200)
        
        //White Container
        
        whiteRectangle.frame = CGRect(x: 300, y: 120, width: 350, height: 88)
        
        //COLOCAR ICONES EM WHITE CONTAINER
        //lupa
        let lupaIcon = UIImageView(image: UIImage(named: "Lupa.png"))
        lupaIcon.frame = CGRect(x: 25, y: 15, width: 52, height: 52)
        whiteRectangle.addSubview(lupaIcon)
        
        //lupacheck
        lupaCheck.frame = CGRect(x: 70, y: 10, width:35, height: 28)
        lupaCheck.isHidden = true
        whiteRectangle.addSubview(lupaCheck)
        
        //megaphone
        let megaphoneIcon = UIImageView(image: UIImage(named: "megaphone.png"))
        megaphoneIcon.frame = CGRect(x: 130, y: 12, width: 52, height: 52)
        whiteRectangle.addSubview(megaphoneIcon)
        
        //megaphonecheck
        megaphoneCheck.frame = CGRect(x: 185, y: 10, width:35, height: 28)
        megaphoneCheck.isHidden = true
        whiteRectangle.addSubview(megaphoneCheck)
        
        //Hands with heart
        let connectIcon = UIImageView(image: UIImage(named: "connect.png"))
        connectIcon.frame = CGRect(x: 228, y: 20, width: 70, height: 52)
        whiteRectangle.addSubview(connectIcon)
        
        //Hands with heart check
        connectCheck.frame = CGRect(x: 290, y: 10, width:35, height: 28)
        connectCheck.isHidden = true
        whiteRectangle.addSubview(connectCheck)
        
        
        //Cenario
        let cenario = UIImageView (image: UIImage (named: "Cenario.png"))
        cenario.frame = CGRect (x:43, y:230, width: 680, height: 670)
        
        //Botao Lupa
        let lupaImage = UIImage(named:"Lupa.png")
        let btmLupa = UIButton()
        btmLupa.frame = CGRect(x: 176, y:560, width: 30, height: 30)
        btmLupa.setBackgroundImage(lupaImage, for: .normal)
        btmLupa.addTarget(nil, action: #selector(tapLupa), for: .touchUpInside)
        
        //Botao megaphone
        let megaphoneImage = UIImage(named:"megaphone.png")
        let btmMegaphone = UIButton()
        btmMegaphone.frame = CGRect(x: 378, y: 713, width: 35, height: 35)
        btmMegaphone.setBackgroundImage(megaphoneImage, for: .normal)
        btmMegaphone.addTarget(nil, action: #selector(tapMegaphone), for: .touchUpInside)
        
        //Botao hands with heart
        let connectImage = UIImage(named:"connect.png")
        let btmConnect = UIButton()
        btmConnect.frame = CGRect(x: 595, y:432, width: 56, height: 42)
        btmConnect.setBackgroundImage(connectImage, for: .normal)
        btmConnect.addTarget(nil, action: #selector(tapConnect), for: .touchUpInside)
        
        
        //Encontrou text
        voceEncontrou.text = "Você encontrou! "
        voceEncontrou.font = UIFont(name: "Quicksand-Bold", size: 47)
        voceEncontrou.frame = CGRect(x: 200, y: 30, width: 500, height: 200)
        voceEncontrou.isHidden = true
        
    //pop up
        popupBackground.isHidden = true
        lupaPopUp.isHidden = true
        titlePopUp.isHidden = true
        textPopUp.isHidden = true
        btmOk.isHidden = true
        
        
        //label saiba mais
        let saibaMaisLabel = UILabel()
        saibaMaisLabel.frame = CGRect(x: 23, y: 3, width: 100, height: 50)
        saibaMaisLabel.text = "Saiba Mais"
        saibaMaisLabel.font = UIFont(name: "Quicksand", size: 20)
        
        btmSaibaMais.addSubview(saibaMaisLabel)
        
        
        //Background
       
        popupBackground.frame = CGRect(x: 70, y: 300, width: 650, height: 690)

        //Title and text
        titlePopUp.font = UIFont(name: "Quicksand-Bold", size: 25)
        textPopUp.font = UIFont(name: "Quicksand", size: 20)
        textPopUp.numberOfLines = 0
        textPopUp.textAlignment = .justified

        //botao saiba mais""
        btmSaibaMais.setBackgroundImage(rectangleStroke, for: .normal)
//        btmSaibaMais.setTitle("Saiba Mais", for: .normal)
//        btmSaibaMais.titleLabel?.font = UIFont(name: "Quicksand", size: 20)
//        btmSaibaMais.titleLabel?.textColor = .black
        btmSaibaMais.addTarget(nil, action: #selector(tapSaibaMais), for: .touchUpInside)
        btmSaibaMais.isHidden = true
        
        //botao OK
        btmOk.setBackgroundImage(okImage, for: .normal)
        btmOk.addTarget(nil, action: #selector(dismissPopUp), for: .touchUpInside)
        
        //Botao voltar
         let voltarImage = UIImage(named:"Backbtm-2.png")
         let btmBack = UIButton()
         btmBack.frame = CGRect(x: 30, y: 920, width: 75, height: 75)
         btmBack.setBackgroundImage(voltarImage, for: .normal)
         btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        finishedPopUp.frame = CGRect(x: 75, y: 320, width: 630, height: 460)
        finishedLabel.frame = CGRect(x: 20, y: 330, width: 700, height: 400)
        finishedLabel.text = "Parabéns!\nVocê completou esse cenário."
        finishedLabel.font = UIFont(name: "Quicksand-Bold", size: 35)
        finishedLabel.numberOfLines = 0
        finishedLabel.textAlignment = .center
        
        btmOk2.setBackgroundImage(okImage, for: .normal)
        btmOk2.addTarget(nil, action: #selector(dismissFinishedPopUp), for: .touchUpInside)
        
        finishedPopUp.isHidden = true
        finishedLabel.isHidden = true
        btmOk2.isHidden = true
        
        view.addSubview(logo)
        view.addSubview(cenario)
        view.addSubview(btmLupa)
        view.addSubview(btmBack)
        view.addSubview(btmMegaphone)
        view.addSubview(btmConnect)
        view.addSubview(command)
        view.addSubview(whiteRectangle)
        view.addSubview(popupBackground)
        view.addSubview(lupaPopUp)
        view.addSubview(titlePopUp)
        view.addSubview(textPopUp)
        view.addSubview(btmOk)
        view.addSubview(voceEncontrou)
        view.addSubview(btmSaibaMais)
        view.addSubview(finishedPopUp)
        view.addSubview(finishedLabel)
        view.addSubview(btmOk2)
        
        self.view = view
    }
    
    
    @objc func tapBack() {
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }
    
    func createPlayer(from filename: String) -> AVAudioPlayer? {
      guard let url = Bundle.main.url(
        forResource: filename,
        withExtension: "mp3"
        ) else {
          return nil
      }
      var player = AVAudioPlayer()

      do {
        try player = AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
      } catch {
        print("Error loading \(url.absoluteString): \(error)")
      }

      return player
    }
    
    func createPlayer2(from filename: String) -> AVAudioPlayer? {
      guard let url = Bundle.main.url(
        forResource: filename,
        withExtension: "wav"
        ) else {
          return nil
      }
      var player = AVAudioPlayer()

      do {
        try player = AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
      } catch {
        print("Error loading \(url.absoluteString): \(error)")
      }

      return player
    }
    
    
    
    @objc func tapLupa() {
        
        if(!achouLupa){
            
            achouLupa = true
            
            //Atualizando CollectionView
            aprendizadosImagens[0] = UIImage(named:"Lupa.png")!
            aprendizadosViewController.aprendizadosCollection!.reloadData()
            
          
            
            
           //icon
           lupaPopUp.frame = CGRect(x: 330, y: 350, width: 100, height: 100)
           lupaPopUp.image = UIImage(named:"Lupa.png")
           
           //title
           titlePopUp.text = "Não coloque rótulos nas crianças"
           
           //text
           textPopUp.text = "    Dizer para seu/sua filho(a) que ele(a) é agressivo(a), por exemplo, é extremamente limitador para o desenvolvimento da personalidade dele(a) e pode vir a agravar os comportamentos agressivos. \n \n   Uma alternativa a esse comentário seria dizer que  “a raiva o deixou agressivo, por exemplo."
            
          //btm Saiba mais
//          btmSaibaMais.frame = CGRect(x: 500, y: 800, width: 150, height: 50)
//          btmSaibaMais.setTitle("Saiba Mais", for: .normal)
//          btmSaibaMais.titleLabel?.textColor = .black
            
            voceEncontrou.isHidden = false
            popupBackground.isHidden = false
            lupaPopUp.isHidden = false
            titlePopUp.isHidden = false
            textPopUp.isHidden = false
            btmSaibaMais.isHidden = false
            btmOk.isHidden = false
            btmSaibaMais.titleLabel?.isHidden = false
            command.isHidden = true
            whiteRectangle.isHidden = true
            lupaCheck.isHidden = false
          
            
            //chompPlayer?.play()
            FoundPlayer?.play()
            
            
           
        }
            
        //show(aprendizadosViewController, sender: nil)
        //dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
        
    }
    
    @objc func tapMegaphone(){
        
        if(!achouMegaphone){
            achouMegaphone = true
            
            //Atualizando CollectionView
            aprendizadosImagens[1] = UIImage(named: "megaphone.png")!
            aprendizadosViewController.aprendizadosCollection!.reloadData()
         
            //icon
            //lupaPopUp = UIImageView(image: UIImage(named:"megaphone.png"))
            lupaPopUp.frame = CGRect(x: 330, y: 350, width: 100, height: 100)
            
            lupaPopUp.image = UIImage(named:"megaphone.png")
            
            //title
            titlePopUp.text = "Sugira a atitude desejada"
            titlePopUp.frame = CGRect(x: 200, y: 450, width: 500, height: 100)
            titlePopUp.font = UIFont(name: "Quicksand-Bold", size: 30)
            
            //text
            textPopUp.text = "    Dizer para seu filho que ele deve para de correr ou para de gritar pode motivá-lo a continuar fazendo tal ação. Ao invés disso diga explicitamente o que você deseja que ele faça no lugar disso. \n \n   Troque o pare de gritar por você pode usar uma voz mais calma e baixa?"
            
            //btm Saiba mais
//            btmSaibaMais.frame = CGRect(x: 500, y: 800, width: 150, height: 50)
//            btmSaibaMais.titleLabel?.textColor = .black
            
            
            //Making pop up visible
            voceEncontrou.isHidden = false
            popupBackground.isHidden = false
            lupaPopUp.isHidden = false
            titlePopUp.isHidden = false
            textPopUp.isHidden = false
            btmOk.isHidden = false
            btmSaibaMais.isHidden = false
            btmSaibaMais.titleLabel?.isHidden = false
            
            //Hiding command and white rectangle
            command.isHidden = true
            whiteRectangle.isHidden = true
            
            //Making check visible
            megaphoneCheck.isHidden = false
            
            //chompPlayer?.play()
            FoundPlayer?.play()
                      
            
        }
        
    }
    
    @objc func tapConnect(){
         if(!achouConnect){
            achouConnect = true
            
            //Atualizando CollectionView
            aprendizadosImagens[2] = UIImage(named: "connect.png")!
            aprendizadosViewController.aprendizadosCollection!.reloadData()
         
            //icon
            lupaPopUp.image = UIImage(named:"connect.png")
            lupaPopUp.frame = CGRect(x: 330, y: 350, width: 100, height: 100)
            

            
            //title
            titlePopUp.text = "Conecte-se antes de corrigir"
            titlePopUp.frame = CGRect(x: 200, y: 450, width: 500, height: 100)
            titlePopUp.font = UIFont(name: "Quicksand-Bold", size: 30)
            
            //text
            textPopUp.text = "    É muito difícil influenciar positivamente uma criança se não houver uma conexão com ela. Conexão cria um ambiente seguro e honesto. Com isso, a criança fica mais aberta para uma correção respeitosa. \n\n   Pode-se substituir o pare de chorar por eu entendo como você se sente."
            
            //btm Saiba mais
//            btmSaibaMais.frame = CGRect(x: 500, y: 800, width: 150, height: 50)
//            btmSaibaMais.titleLabel?.textColor = .black
            
            
            //Making pop up visible
            voceEncontrou.isHidden = false
            popupBackground.isHidden = false
            lupaPopUp.isHidden = false
            titlePopUp.isHidden = false
            textPopUp.isHidden = false
            btmOk.isHidden = false
            btmSaibaMais.isHidden = false
            btmSaibaMais.titleLabel?.isHidden = false
            
            //Hiding command and white rectangle
            command.isHidden = true
            whiteRectangle.isHidden = true
            
            //Making check visible
            connectCheck.isHidden = false
            
            //chompPlayer?.play()
            FoundPlayer?.play()
                      
            
        }
    }
    
    @objc func dismissPopUp() {
        
        voceEncontrou.isHidden = true
        popupBackground.isHidden = true
        lupaPopUp.isHidden = true
        titlePopUp.isHidden = true
        textPopUp.isHidden = true
        btmOk.isHidden = true
        btmSaibaMais.isHidden = true
        command.isHidden = false
        whiteRectangle.isHidden = false
        checkIfFinished()
        
       
    }
    
    @objc func dismissFinishedPopUp() {
        
//        finishedPopUp.isHidden = true
//        finishedLabel.isHidden = true
//        btmOk2.isHidden = true
        firstViewController.animationPadlock()
        navigationController?.popViewController(animated: false)
       
    }
    
    @IBAction func tapSaibaMais(){
        
        
        let saibaMaisViewController = SaibaMaisViewController(screenType: .ipad, isPortrait: true)
        
        if(titlePopUp.text == "Não coloque rótulos nas crianças"){
            saibaMaisViewController.iconCard = icones[0]
            saibaMaisViewController.titleCard = titles[0]
            saibaMaisViewController.textCard = texts[0]
            saibaMaisViewController.titleCard.frame = CGRect(x: 120, y: 320, width: 700, height: 100)
            
        } else if(titlePopUp.text == "Sugira a atitude desejada"){
            saibaMaisViewController.iconCard = icones[1]
            saibaMaisViewController.titleCard = titles[1]
            saibaMaisViewController.textCard = texts[1]
            
            saibaMaisViewController.titleCard.frame = CGRect(x: 170, y: 320, width: 700, height: 100)
            
        }else{
            saibaMaisViewController.iconCard = icones[2]
            saibaMaisViewController.titleCard = titles[2]
            saibaMaisViewController.textCard = texts[2]
            saibaMaisViewController.titleCard.frame = CGRect(x: 150, y: 320, width: 700, height: 100)
        }
        
       
//        btmSaibaMais.setTitle("Saiba Mais", for: .normal)
//        btmSaibaMais.titleLabel?.textColor = .black
//        btmSaibaMais.titleLabel?.isHidden = false
        
        
        navigation.pushViewController(saibaMaisViewController, animated: false)
    }
    
    
    func checkIfFinished(){
        if(achouLupa && achouMegaphone && achouConnect){
            finishedPopUp.isHidden = false
            finishedLabel.isHidden = false
            btmOk2.isHidden = false
            chompPlayer?.play()
        }
    }
    
//    @obj func tapSaibaMais(){
//
//    }

}

class SaibaMaisViewController: UIViewController{
    public var iconCard = UIImageView()
    public var titleCard = UILabel()
    public var textCard = UILabel()
//
//    init(icon: UIImage, title: UILabel, text: UILabel){
//        iconCard = UIImageView(image: icon)
//        titleCard = title
//        textCard = text
//    }
    

    override func viewWillAppear(_ animated: Bool){
         iconCard.frame = CGRect(x: 330, y: 200, width: 120, height: 120)
         titleCard.font = UIFont(name: "Quicksand-Bold", size: 35 )
         
         textCard.font = UIFont(name: "Quicksand", size: 25)
         textCard.frame = CGRect(x: 80, y: 200, width: 610, height: 700)
         textCard.numberOfLines = 0
         textCard.textAlignment = .justified
        
          view.addSubview(iconCard)
          view.addSubview(titleCard)
          view.addSubview(textCard)
              
    }
    
    override func loadView(){
        let view = UIView()
        
        let background = UIImageView (image: UIImage(named:"bckgnd.png"))
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        
        //links and fontes
        let links = UIImageView(image: UIImage(named: "links.png"))
        links.frame = CGRect(x: 230, y: 770, width: 310, height: 120)
        
        
        //Botao voltar
        let voltarImage = UIImage(named:"Backbtm-2.png")
        let btmBack = UIButton()
        btmBack.frame = CGRect(x: 30, y: 940, width: 75, height: 75)
        btmBack.setBackgroundImage(voltarImage, for: .normal)
        btmBack.addTarget(nil, action: #selector(tapBack), for: .touchUpInside)
        
        
       
        
        view.addSubview(background)
        view.addSubview(btmBack)
        view.addSubview(links)
        
        
        
      
        self.view = view
    }
    
    @objc func tapBack(){
        navigationController?.popViewController(animated: false)
    }
    
}





let firstViewController = MyViewController(screenType: .ipad, isPortrait: true)

let aprendizadosViewController = AprendizadosViewController(screenType: .ipad, isPortrait: true)

aprendizadosViewController.modalPresentationStyle = .fullScreen
let cenarioViewController = Cenario1ViewController(screenType: .ipad, isPortrait: true)
//let navigation = UINavigationController(rootViewController: firstViewController)
let navigation = UINavigationController(screenType: .ipad, isPortrait: true)
navigation.navigationBar.isHidden = true
navigation.pushViewController(firstViewController, animated: false)



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.6)



