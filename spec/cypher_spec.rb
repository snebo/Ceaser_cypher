require './lib/cypher'

describe Cypher do
  cy = CeaserCypher.new(3)
  describe '#encrypt' do
    it 'return the encrypted message correctly' do
      expect(cy.encrypt('Hello my friend')).to equal('Khoor ob iulhqg')
    end
    it 'encrypt the message leaving symbols and number intact' do
      expect(cy.encrypt("1HF2''nn")).to equal("1KI2''qq")
    end
    it 'return empty if message is empty' do
      expect(cy.encrypt('')).to equal('')
    end
  end
end