<?php
header('Access-Control-Allow-Origin: *');

$router->get('/sugestoes', ['Controller\Site', 'sugestoes']); // OK
$router->get('/sugestoes/{tema}', ['Controller\Site', 'sugestoes']); // OK
$router->get('/sugestao/{sugestaoID}', ['Controller\Site', 'sugestao']); // OK
$router->get('/votar/{sugestaoID}/{voto}', ['Controller\Site', 'votar']); // OK
$router->post('/cadastrar', ['Controller\Site', 'cadastrar']); // OK

