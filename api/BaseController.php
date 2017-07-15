<?php
namespace emc;

use \Illuminate\Database\Eloquent\Model;
use \Illuminate\Database\Eloquent\SoftDeletes;

class BaseController extends Model
{
	public function view($view, $data = []){
		Mvc::view($view, $data);
	}	
}