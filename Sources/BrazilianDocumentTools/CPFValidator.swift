import Foundation

typealias CPF = String

final class CPFValidator {
    func validate(cpf: CPF) -> Bool {
        cpf.isValid
    }
}

private extension Collection where Element == Int {
    var cpfDigit: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}

private extension CPF {
    var isValid: Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        return numbers.prefix(9).cpfDigit == numbers[9] && numbers.prefix(10).cpfDigit == numbers[10]
    }
}
