class CidadaoDecorator < Draper::Decorator
  delegate_all
  
  def pretty_telefone(cidadao, telefone)
    h.content_tag("+55 (#{cidadao.telefone[0..1]}) #{cidadao.telefone[2..6]}-#{cidadao.telefone[7..10]}")
  end

  def pretty_cns(cidadao, cns)
    h.format_cns("#{cidadao.cns[0..2]} #{cidadao.cns[3..6]} #{cidadao.cns[7..10]} #{cidadao.cns[11..14]}")
  end

  def pretty_cep(cidadao, cep)
    h.content_tag("#{cidadao.endereco.cep[0..4]}-#{cidadao.endereco.cep[5..7]}")
  end
end
