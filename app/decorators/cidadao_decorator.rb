class CidadaoDecorator < Draper::Decorator
  delegate_all
  
  def pretty_telefone
    "+55 (#{object.telefone[0..1]}) #{object.telefone[2..6]}-#{object.telefone[7..10]}"
  end

  def pretty_cns
    "#{object.cns[0..2]} #{object.cns[3..6]} #{object.cns[7..10]} #{object.cns[11..14]}"
  end

  def pretty_cep
    "#{object.endereco.cep[0..4]}-#{object.endereco.cep[5..7]}"
  end

  def pretty_cpf
    "#{object.cpf[0..2]}.#{object.cpf[3..5]}.#{object.cpf[6..8]}-#{object.cpf[9..10]}"
  end

  def which_status
    object.status? ? 'Ativo' : 'Inativo'
  end

  def foto
    if object.foto.present?
      h.image_tag(object.foto, style:'height: 150px; width: 150px; border-radius: 50%;')
    else
      h.image_tag(object.foto.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png', content_type: "image/png", style:'height: 150px; width: 150px; border-radius: 50%;'))
    end
  end
end
