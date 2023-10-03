require "test_helper"

class TransfactorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "get data" do
    tf = Transfactor.where(regulatory_factor: "AARS").first
    puts "Target Gene: #{tf.target_gene}"
    puts "Target UTR: #{tf.target_utr}"
    puts "Target_UTR_length: #{tf.target_utr_length}"
    puts "Binding site start: #{tf.binding_site_start}"
    puts "Binding site stop: #{tf.binding_site_stop}"
    assert tf
  end
end
