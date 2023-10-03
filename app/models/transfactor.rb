class Transfactor
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'transfactors'
  field 'Regulatory factor', as: :regulatory_factor
  field 'Target Gene', as: :target_gene
  field 'Target UTR', as: :target_utr
  field 'Target_UTR_length', as: :target_utr_length
  field 'Binding site start', as: :binding_site_start
  field 'Binding site stop', as: :binding_site_stop
end
