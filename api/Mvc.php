<?php
namespace emc;

use Phroute\Phroute\RouteCollector;
use Illuminate\Database\Capsule\Manager as Capsule;

class Mvc
{
	public $config;

	public function __construct()
	{
		$this->config = require('config.php');
		$capsule = new Capsule;
		$capsule->addConnection($this->config['database']);
		$capsule->setAsGlobal();
		$capsule->bootEloquent();
		$router = new RouteCollector();
		require ('routes.php');
		$dispatcher = new \Phroute\Phroute\Dispatcher($router->getData());
		$response = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
		return $response;
	}

	static function view($view, $data = [])
	{
		$loader = new \Twig_Loader_Filesystem(__DIR__.'/views');
		$twig = new \Twig_Environment($loader, []);
		$globals = require __DIR__.'/globals.php';
		foreach (get_class_methods(new TwigFilters) as $method)
		{
			$twig->addFilter(new \Twig_SimpleFilter($method, [new TwigFilters, $method]));
		}
		foreach (get_class_methods(new TwigFunctions) as $method)
		{
			$twig->addFilter(new \Twig_SimpleFunctions($method, [new TwigFunctions, $method]));
		}
		$twig->addGlobal('globals', $globals);
		echo $twig->render("{$view}.twig", $data);
	}
}