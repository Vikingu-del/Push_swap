# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eseferi <eseferi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/08 16:46:30 by eseferi           #+#    #+#              #
#    Updated: 2024/04/08 10:45:00 by eseferi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
CC           = gcc
CFLAGS       = -Wall -Wextra -Werror -Iinc -Isrc -O3

RM           = rm -rf
CHECKER      = checker
PUSH_SWAP    = push_swap
NAME         = $(PUSH_SWAP) $(CHECKER)

# Libraries
LIBFT        = libft.a
LIBFT_DIR    = lib/ft_printf/lib/libft
LIBFT_FILE   = $(LIBFT_DIR)/$(LIBFT)
CFLAGS      += -I $(LIBFT_DIR)/inc

FT_PRINTF    = libftprintf.a
FT_PRINTF_DIR= lib/ft_printf
FT_PRINTF_FILE = $(FT_PRINTF_DIR)/$(FT_PRINTF)
CFLAGS      += -I $(FT_PRINTF_DIR)/inc

MAKE_LIB     = make --no-print-directory -s -C

# Source and Object Files
VPATH        = src:src/stack:src/push_swap:src/checker_bonus:inc
STACK_INC    = stack.h
STACK_SRC    = data_mngt.c stack_init.c stack_utils.c op_push.c \
			op_reverse_rotate.c op_rotate.c op_swap.c op_utils.c
PUSH_SWAP_INC= $(STACK_INC) push_swap.h
PUSH_SWAP_SRC= $(STACK_SRC) push_swap.c sort.c move.c chunk_sort.c  \
			chunk_split.c chunk_utils.c opti_easy_sort.c \
			opti_sort_asap.c opti_sort_three.c opti_to_the_top.c \
			opti_post_sort.c opti_post_sort_utils.c
CHECKER_INC  = $(STACK_INC) checker_bonus.h
CHECKER_SRC  = $(STACK_SRC) checker_bonus.c checker_utils_bonus.c

# Rules
all:    $(PUSH_SWAP)
		@echo "\033[1;32m[$(PUSH_SWAP)] created successfully.\033[0"

bonus:  $(CHECKER)
		@echo "\033[1;32m[$(CHECKER)] created successfully.\033[0"
obj:
	mkdir -p obj

LIB       = $(LIBFT_FILE) $(FT_PRINTF_FILE)
PUSH_SWAP_OBJ = $(PUSH_SWAP_SRC:%.c=obj/push_swap/%.o)
CHECKER_OBJ   = $(CHECKER_SRC:%.c=obj/checker/%.o)

$(PUSH_SWAP_OBJ): obj/push_swap/%.o: %.c $(PUSH_SWAP_INC)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

$(CHECKER_OBJ): obj/checker/%.o: %.c $(CHECKER_INC)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT_FILE):
	@$(MAKE_LIB) $(LIBFT_DIR)

$(FT_PRINTF_FILE):
	@$(MAKE_LIB) $(FT_PRINTF_DIR)

$(PUSH_SWAP): $(PUSH_SWAP_OBJ) $(LIB)
	@$(CC) $(CFLAGS) $(PUSH_SWAP_OBJ) $(LIB) -o $@

$(CHECKER): $(CHECKER_OBJ) $(LIB)
	@$(CC) $(CFLAGS) $(CHECKER_OBJ) $(LIB) -o $@

lib_clean:
	@$(MAKE_LIB) $(LIBFT_DIR) clean
	@$(MAKE_LIB) $(FT_PRINTF_DIR) clean
	@echo "\033[1;33m[$(NAME)] Object files deleted.\033[0m"

lib_fclean:
	@$(MAKE_LIB) $(LIBFT_DIR) fclean
	@$(MAKE_LIB) $(FT_PRINTF_DIR) fclean
	@echo "\033[1;31m[$(NAME)] Program deleted.\033[0m"

clean:  lib_clean
	@$(RM) obj

fclean: clean lib_fclean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all bonus lib_clean lib_fclean clean fclean re

