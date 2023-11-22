##
## EPITECH PROJECT, 2023
## B-ASM-400-BDX-4-1-bsasmminilibc-leopold.sallan-gemard
## File description:
## Makefile
##

CC		=	ld
CFLAGS		= -shared

NAME		=	libasm.so

AS		=	nasm
ASFLAGS		=	-f elf64

RM			=	rm -f

SRC_DIR		=	src/
SRC_FILE	=	memset.asm	\
				memcpy.asm	\
				memmove.asm	\
				strchr.asm	\
				strlen.asm	\
				strrchr.asm


SRC		= $(addprefix $(SRC_DIR), $(SRC_FILE))

OBJ		=	$(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	 $(CC) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) a.out

re:	fclean	all

.PHONY: all clean fclean re
