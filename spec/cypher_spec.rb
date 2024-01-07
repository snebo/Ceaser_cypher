require './lib/cypher'

describe CeaserCypher do
  describe '#encrypt' do
    cy = CeaserCypher.new(3)

    it 'return the encrypted message correctly' do
      expect(cy.encrypt('Hello my friend')) == ('Khoor pb iulhqg')
    end
    it 'encrypt the message leaving symbols and number intact' do
      expect(cy.encrypt("1HF2''nn")) == ("1KI2''qq")
    end
    it 'return empty if message is empty' do
      expect(cy.encrypt('')) == ('')
    end
  end

  describe '# decrypt' do
    cy = CeaserCypher.new(3)
    it 'Decodes the given message' do
      expect(cy.decrypt("Mx'w svomrk fixxiv xler ibtigxih")) == "It's working better than expected"
    end
  end
end