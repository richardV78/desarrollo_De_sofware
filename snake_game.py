import pygame, sys, time, random
# se importa una libreria de pyton para en su mayoria juegos
pygame.init() 
# se inicializa la libreria
play_surface = pygame.display.set_mode((500, 500)) # aca se crea una variable que es el tamaño de la pantalla  
fps = pygame.time.Clock() # se crea una variable que son los fps a las que se mueve 

def main():
# creamos el main y dos variables la cabeza y el cuerpo de la serpiente
    snake_pos = [100,50]
    snake_body = [[100,50],[90,50],[80,50]]
    # estos array son para delimitar el tamaño de la ser4piente recien se inicie el juego 
    # es en la posicion y tamaño que iniciara 

    run = True

    while run: 
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
                 
    play_surface.fill|((0,0,0))
     
    pygame.display.flip()
    fps.tick(10)

main()

pygame.quit()
