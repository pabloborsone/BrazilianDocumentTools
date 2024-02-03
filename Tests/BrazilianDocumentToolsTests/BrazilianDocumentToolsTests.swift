@testable import BrazilianDocumentTools

import XCTest

final class BrazilianDocumentToolsTests: XCTestCase {
    private let sut = CPFValidator()

    func testGivenAValidCPFWhenValidatorIsCalledThenCPFValidationWillSucceed() throws {
        XCTAssertTrue(sut.validate(cpf: "312.826.920-38"))
        XCTAssertTrue(sut.validate(cpf: "31282692038"))
    }

    func testGivenAnInvalidCPFWhenValidatorIsCalledThenCPFValidationWillFail() throws {
        XCTAssertFalse(sut.validate(cpf: "333.222.111-00"))
        XCTAssertFalse(sut.validate(cpf: "33322211100"))
        XCTAssertFalse(sut.validate(cpf: "12345"))
    }
}
