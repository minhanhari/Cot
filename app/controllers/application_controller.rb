class ApplicationController < ActionController::Base
  def index; end

  def search
    @edges = Array.new
    genes = params[:genes].split("\r\n")
    cell = params[:cell]
    min = params[:coregulation].to_i
    if genes.blank? == cell.blank?
      redirect_back_or_to root_path, error: 'Please specify co-regulated genes or cell line expressed in.'
    else
      @edges = genes.blank? ? filter_by_cell(cell, min) : filter_by_genes(genes, min)
    end
    redirect_back_or_to root_path, error: 'No trans-factors found.' if @edges.empty?
  end
end

def filter_by_cell(cell, min)
  genes = GeneAttribute.where(gene_sym: cell).to_a
  filterByGenes(genes, min)
end

def filter_by_genes(genes, min)
  transfactors = Transfactor.in(target_gene: genes).to_a
  tf_genes = Hash.new { |hash, key| hash[key] = [] }
  transfactors.each do |tf|
    tf_genes[tf.regulatory_factor] |= [tf.target_gene]
  end
  coreg = Array.new
  other_tfs = tf_genes.deep_dup
  tf_genes.each do |key, value|
    other_tfs.delete(key)
    other_tfs.each do |key2, value2|
      if (value & value2).count >= min then coreg << { start: key, end: key2, weight: (value & value2).count } end
    end
  end
  coreg
end
