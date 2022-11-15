NAME =	minishell

SRC =	src/minishell.c src/ft_free_array.c src/ft_triple_strjoin.c

OBJ =	$(SRC:.c=.o)

CC =	gcc
FLAGS = -Wall -Wextra -Werror
RM =	rm -rf

OBJ_F = obj
READ =	read -r 

LIBFT =	./Libft/libft.a

PINK	:= \033[0;35m
PURPLE	:= \033[0;34m
RESET	:= \033[0m

all: $(NAME)

%.o: %.c
	@$(CC) $(FLAGS) -c $< -o $@
	@echo "$(PINK)•$(RESET)\c"
#	@mv $(OBJ) $(OBJ_F)/

$(NAME): $(OBJ) $(SRC)
	@$(MAKE) -C Libft
	@$(CC) $(LIBFT) $(OBJ) -o $(NAME) 
	@mv $(OBJ) $(OBJ_F)/
	@echo "\n$(PINK)✨Minishell successfully compiled!✨$(RESET)"
#	@mkdir $(OBJ_F)
#	@bash art.sh

clean:
	@$(MAKE) fclean -C Libft
	@$(RM) $(OBJ_F)/*
	@echo "$(PURPLE)✨Minishell successfully cleaned!✨$(RESET)"

fclean: clean
	@$(RM) $(NAME)

git:
	git add *
	@read -p "Enter the commit message: " halp; \
	git commit -m "$$halp"
	git push
	@echo "$(PURPLE)✨All added, commited and pushed!✨$(RESET)"
re : fclean all
