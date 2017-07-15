<?php
namespace Controller;

use \emc\BaseController as BaseControler;
use \Model\TemaSugestao;
use \Model\Sugestao;
use \Model\Voto;

class Site extends BaseControler
{
	public function sugestoes($temaNome = null)
	{
		header('Content-type: application/json');
		$result = [];
		if(!is_null($temaNome)){
			$temas = TemaSugestao::where('tem_tema', $temaNome)->get();
		}else{
			$temas = TemaSugestao::all();
		}
		foreach ($temas as $tema) {
			if(is_null($temaNome)) $result[$tema->tem_nome] = [];
			foreach ($tema->sugestoes as $sugestaoDB) {
				$sugestao['id'] 	= $sugestaoDB->sugestao_id;
				$sugestao['titulo'] 	= $sugestaoDB->sug_titulo;
				$sugestao['imagem'] 	= $sugestaoDB->sug_ilustracao;
				$sugestao['descricao'] 	= $sugestaoDB->sug_descricao;
				$sugestao['likes'] 		= $sugestaoDB->qtdVotos('L');
				$sugestao['dislikes'] 	= $sugestaoDB->qtdVotos('D');
				$sugestao['cadastro'] 	= $sugestaoDB->cadastrado;
				if(!is_null($temaNome)) array_push($result, $sugestao);
				else array_push($result[$tema->tem_nome], $sugestao);
			}
		}
		echo json_encode($result);
	}

	public function sugestao($sugestaoID)
	{
		header('Content-type: application/json');
		$sugestaoDB = Sugestao::find($sugestaoID);
		$sugestao['id'] 	    = $sugestaoDB->sugestao_id;
		$sugestao['titulo'] 	= $sugestaoDB->sug_titulo;
		$sugestao['imagem'] 	= $sugestaoDB->sug_ilustracao;
		$sugestao['descricao'] 	= $sugestaoDB->sug_descricao;
		$sugestao['likes'] 		= $sugestaoDB->qtdVotos('L');
		$sugestao['dislikes'] 	= $sugestaoDB->qtdVotos('D');
		$sugestao['cadastro'] 	= $sugestaoDB->cadastrado;
		echo json_encode($sugestao);
	}

	public function votar($sugestaoID, $voto)
	{
		$novoVoto = new Voto();
		$novoVoto->sugestao_id 	= $sugestaoID;
    	$novoVoto->usuario_id 	= 1;
    	$novoVoto->vot_opiniao 	= strtoupper($voto);
    	$novoVoto->vot_ip 		= $_SERVER['REMOTE_ADDR'];
		$novoVoto->save();
		echo json_encode(["sucesso" => true, "voto"=> strtoupper($voto)]);
	}

	public function cadastrar()
	{
		$sugestao = new Sugestao();
		$sugestao->tema_sugestao_id = $_POST['temaID'];
		$sugestao->usuario_id		= 1;
		$sugestao->sug_titulo 		= $_POST['titulo'];
		$sugestao->sug_ilustracao	= $_POST['imagem'];
		$sugestao->sug_descricao	= $_POST['descricao'];
		$sugestao->save();
		echo json_encode(["sucesso" => true, "sugestao"=> $sugestao->sug_titulo]);
	}
}