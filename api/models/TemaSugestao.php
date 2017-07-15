<?php
namespace Model;

use emc\BaseModel;

class TemaSugestao extends BaseModel
{
	protected $table = 'tema_sugestao';
	protected $primaryKey = 'tema_sugestao_id';

	public function sugestoes(){
		return $this->hasMany('\Model\Sugestao', 'tema_sugestao_id');
	}
}
