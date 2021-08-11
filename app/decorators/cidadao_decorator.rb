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

  # def foto
  #   if object.foto.present?
  #     object.foto.key(style:'height: 150px; width: 150px; border-radius: 50%;')
  #   else
  #     object.foto.attach(io: File.open(File.join(Rails.root,'app/assets/images/avatar.png')), filename: 'avatar.png')
  #   end
  # end
end
