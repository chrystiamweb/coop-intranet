class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :location
  belongs_to :sector
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum kind: [ :admin, :supervisor, :user ]
  
  enum role: [ :'AGENTE DE CONTROLES INTERNOS',
               :'AGENTE_ADMINISTRATIVO_CENTRALIZADO_II_III',
               :'AGENTE_DE_ATENDIMENTO_I',
               :'AGENTE_DE_ATENDIMENTO_II_III',
               :'AGENTE_DE_ATENDIMENTO_PAC_II_III',
               :'ANALISTA JURIDICO',
               :'ANALISTA_DE_CREDITO',
               :'AUXILIAR_ADMINIST/AGENTE_ADMINIST_CENTRALIZADO_I',
               :'DIRETORIA EXECUTIVA',
               :'ESTAGIARIO',
               :'GERENTE AGENCIA MATRIZ',
               :'GERENTE AGENCIA PAC',
               :'GERENTE DE RELACIONAMENTO MATRIZ',
               :'GERENTE DE RELACIONAMENTO PAC',
               :'GERENTE NEGOCIOS PAC',
               :'GERENTE NEGOCIOS/OPERACIONAL/GERAL',
               :'GERENTE_ADMINISTRATIVO_CENTRALIZADO',
               :'SUP_CCO E PRODUTOS',
               :'SUP_CONTAB_TRIB_SERV_GERAIS_CENTRALIZADO',
               :'SUP_DE_CREDITO',
               :'SUP_INFOR/ARRECAD/COMPE',
               :'SUP_TESOURARIA',
               :'SUPERINTENDENTE']
end
