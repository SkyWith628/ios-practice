import UIKit

class ViewController: UIViewController {
    
    // 금액 입력 (원)
    @IBOutlet weak var amountTextField: UITextField!
    
    // 환율 입력 (원/달러, 예: 1400)
    @IBOutlet weak var rateTextField: UITextField!
    
    // 결과 표시 라벨
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 UI 세팅
        amountTextField.placeholder = "금액(원)을 입력하세요"
        rateTextField.placeholder   = "환율(원/달러)을 입력하세요"
        
        amountTextField.keyboardType = .decimalPad
        rateTextField.keyboardType   = .decimalPad
        
        resultLabel.text = "원화 금액과 환율을 입력한 후 [계산]을 누르세요."
        
        // 아무 곳이나 터치하면 키보드 내려가게 제스처 추가
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // [계산] 버튼에 연결할 액션
    @IBAction func convertToDollar(_ sender: UIButton) {
        // 키보드 내리기
        view.endEditing(true)
        
        // 텍스트 → Double 변환
        guard
            let amountText = amountTextField.text,
            let rateText   = rateTextField.text,
            let amount     = Double(amountText),
            let rate       = Double(rateText),
            amount > 0,
            rate > 0
        else {
            resultLabel.textColor = .red
            resultLabel.text = "금액과 환율을 제대로 입력해 주세요."
            return
        }
        
        // 달러 금액 = 원화 금액 ÷ 환율(원/달러)
        let dollar = amount / rate
        
        // 보기 좋게 포맷 (소수 둘째 자리까지)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let dollarString = formatter.string(from: NSNumber(value: dollar)) ?? "\(dollar)"
        
        resultLabel.textColor = .label   // 기본 색상
        resultLabel.text = "\(dollarString) USD"
    }
}
