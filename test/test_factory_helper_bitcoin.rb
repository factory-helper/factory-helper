require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperBitcoin < Test::Unit::TestCase

  def test_address
    assert FactoryHelper::Bitcoin.address.match(/^[13][1-9A-Za-z][^OIl]{20,40}/)
  end

  def test_testnet_address
    assert_match(/\A[mn][1-9A-Za-z]{32,34}\Z/, FactoryHelper::Bitcoin.testnet_address)
    assert_not_match(/[OIl]/, FactoryHelper::Bitcoin.testnet_address)
  end

end
