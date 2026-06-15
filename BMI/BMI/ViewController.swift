import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    private var lastBMI: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtHeight.placeholder = "키(cm)를 입력하세요"
        txtWeight.placeholder = "몸무게(kg)를 입력하세요"
        
        txtHeight.keyboardType = .decimalPad
        txtWeight.keyboardType = .decimalPad
        
        txtHeight.delegate = self
        txtWeight.delegate = self
        
        lblResult.text = "키와 몸무게를 입력한 뒤 계산 버튼을 눌러주세요."
        lblResult.textColor = .label
    }
    
    @IBAction func calcBmi(_ sender: UIButton) {
        view.endEditing(true)
        
        guard
            let h = parseNumber(from: txtHeight.text),
            let w = parseNumber(from: txtWeight.text),
            h > 0, w > 0
        else {
            lblResult.textColor = .red
            lblResult.text = "유효한 키(cm)와 몸무게(kg)를 입력하세요"
            return
        }
        
        let bmi = BMI(weight: w, height: h)
        lastBMI = bmi
        
        lblResult.text = bmi.resultText
        lblResult.textColor = color(for: bmi.category)
    }
    
    private func parseNumber(from text: String?) -> Double? {
        let cleaned = (text ?? "")
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ",", with: ".")
        
        return Double(cleaned)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtHeight {
            txtWeight.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            calcBmi(UIButton())
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func classificationForBMI(_ sender: UIButton) {
        guard let bmi = lastBMI else {
            let alert = UIAlertController(
                title: "안내",
                message: "먼저 BMI를 계산해주세요.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            return
        }
        
        let message = """
        현재 \(bmi.resultText)
        
        • 저체중: BMI < 18.5
        • 정상: 18.5 ≤ BMI < 25
        • 1단계 비만: 25 ≤ BMI < 30
        • 2단계 비만: 30 ≤ BMI < 40
        • 3단계 비만: BMI ≥ 40
        """
        
        let alert = UIAlertController(
            title: "BMI 분류 기준",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    private func color(for category: BMICategory) -> UIColor {
        switch category {
        case .underweight:
            return UIColor.systemBlue
        case .normal:
            return UIColor.systemGreen
        case .obese1:
            return UIColor.systemOrange
        case .obese2:
            return UIColor.systemRed
        case .obese3:
            return UIColor(red: 0.6, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
}
