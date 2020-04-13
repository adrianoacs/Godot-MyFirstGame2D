extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.3
func _ready():
	$Sprite.play("Walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	
func _process(delta):
	if(flip):
		$".".position.x += velocidade		
		if($".".position.x >= posicao_final):
			flip = false
	if(!flip):		
		$".".position.x -= velocidade
		if($".".position.x < posicao_inicial):
			flip = true
	$Sprite.flip_h = !flip			
	
func Dano():
	get_node("anim").play("die")
	get_node("audioDie").play()	
	
func Die():
	$".".queue_free()
	
