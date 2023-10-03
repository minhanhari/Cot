class GeneAttribute
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'geneattributes'
  field 'GeneSym', as: :gene_sym
  field 'ProbeID', as: :probe_id
  field 'GeneID', as: :gene_id
  field 'Cell Line', as: :cell_line
  field 'Cell desc', as: :cell_desc
  field 'CellID', as: :cell_id
  field :weight
end
