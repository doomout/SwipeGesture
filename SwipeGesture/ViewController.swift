import UIKit

class ViewController: UIViewController {
    let numOfTouchs = 2 //터치 갯수 2로 설정
    
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    
    //각 배열 선언
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 배열에 이미지 할당
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        //이미지 뷰에 이미지 할당
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        //위쪽 방향의 스와이프 제스처 등록
        let swipUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipUp.direction = UISwipeGestureRecognizer.Direction.up
        //swipUp.numberOfTouchesRequired = numOfTouchs //멀티 터치 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipUp)
        
        //아래쪽 방향의 스와이프 제스처 등록
        let swipDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipDown.direction = UISwipeGestureRecognizer.Direction.down
        //swipDown.numberOfTouchesRequired = numOfTouchs //멀티 터치 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipDown)

        //왼쪽 방향의 스와이프 제스처 등록
        let swipLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipLeft.direction = UISwipeGestureRecognizer.Direction.left
        //swipLeft.numberOfTouchesRequired = numOfTouchs //멀티 터치 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipLeft)

        //오른쪽 방향의 스와이프 제스처 등록
        let swipRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipRight.direction = UISwipeGestureRecognizer.Direction.right
        //swipRight.numberOfTouchesRequired = numOfTouchs //멀티 터치 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipRight)
        
        //멀티 스와이프 제스처 등록
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        //멀티 스와이프 제스처 등록
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        //멀티 스와이프 제스처 등록
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        //멀티 스와이프 제스처 등록
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }

    //싱글 스와이프 시 빨강으로 표시 하는 함수
    @objc func respondToSwipeGesture(_ gesture:UIGestureRecognizer) {
        //만약 제스처가 있다면?
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            //전체 이미지 뷰를 검은색 화살표로 초기화 한다.
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            //제스처 방향에 따라 해당 방향 이미지를 빨간색 이미지로 변경한다.
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
            }
        }
    }
    
    //멀티 스와이프시 색상을 녹색으로 변경하는 함수
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        //만약 제스처가 있다면?
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            //전체 이미지 뷰를 검은색 화살표로 초기화 한다.
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            //제스처 방향에 따라 해당 방향 이미지를 초록색 이미지로 변경한다.
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }
}

