<?php
namespace emc;

use \Illuminate\Database\Eloquent\Model;
use \Illuminate\Database\Eloquent\SoftDeletes;

class BaseModel extends Model
{
	use SoftDeletes;
	
	const CREATED_AT = 'cadastrado';
	const UPDATED_AT = 'atualizado';
	const DELETED_AT = 'excluido';
}