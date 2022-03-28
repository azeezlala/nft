const LalaNFT = artifacts.require("LalaNFT");

contract("NFT", (account) => {
    before(async () => {
        instance = await LalaNFT.deployed()
    })
    it("should be named LalaNft", async () => {
        let name = await instance.name()
        let nm = await name
        assert.equal(nm, "LalaNft", "the contract name should be LalaNft")
    })
    it("should be symbol LNFT", async () => {
        let symbol = await instance.symbol()
        let sym = await symbol
        assert.equal(sym, "LNFT", "the contract symbol should be LNFT")
    })
    it("should mint token successful", async () => {
        let mint = await instance.mintToken(account[1], {from: account[0]})
        assert("token minted successfully")
    })
    it("should mint token failed", async () => {
        try {
            let mint = await instance.mintToken(account[0], {from: account[0]})
            assert.fail()
        } catch (e) {
            assert(e.message.indexOf('revert') >= 0,"can not mint token to yourself")
        }
    })

})