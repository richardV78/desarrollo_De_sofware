import pygame, sys, time, random
# se importa una libreria de pyton para en su mayoria juegos
pygame.init() 
# se inicializa la libreria
play_surface = pygame.display.set_mode((500, 500)) # aca se crea una variable que es el tamaño de la pantalla  
fps = pygame.time.Clock() # se crea una variable que son los fps a las que se mueve 

def main():
# creamos el main y dos variables la cabeza y el cuerpo de la serpiente
    snake_pos = [100,50]
    snake_body = [[100,50], [90,50], [80,50]]
    # estos array son para delimitar el tamaño de la ser4piente recien se inicie el juego 
    # es en la posicion y tamaño que iniciara 
    change = "RIGHT"

    run = True

    while run: 

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_RIGHT:
                    change = "RIGHT"
                if event.key == pygame.K_LEFT:
                    change = "LEFT"
                if event.key == pygame.K_UP:
                    change = "UP"
                if event.key == pygame.K_DOWN:
                    change = "DOWN"
            
            if change == "RIGHT":
                snake_pos[0] += 10
            if change == "LEFT":
                snake_pos[0] -= 10
            if change == "UP":
                snake_pos[1] -= 10
            if change == "DOWN":
                snake_pos[1] += 10

            snake_body.insert(0, list(snake_pos))
            snake_body.pop()


        play_surface.fill((0,0,0))
        for pos in snake_body:
            pygame.draw.rect(play_surface,(200,200,200), pygame.Rect(pos[0], pos[1], 10, 10))

        pygame.display.flip()
        fps.tick(30)


main()
pygame.quit()
