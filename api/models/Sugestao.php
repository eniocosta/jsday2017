<?php
namespace Model;

use emc\BaseModel;

class Sugestao extends BaseModel
{
	protected $table = "sugestao";
	protected $primaryKey = "sugestao_id";

	public function votos(){
		return $this->hasMany('\Model\Voto', 'sugestao_id');
	}

	public function qtdVotos($type){
		return $this->votos()->where('vot_opiniao', $type)->count();
	}
}