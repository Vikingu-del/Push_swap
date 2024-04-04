/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stack.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eseferi <eseferi@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/08 16:41:34 by eseferi           #+#    #+#             */
/*   Updated: 2024/04/04 11:05:02 by eseferi          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef STACK_H
# define STACK_H

# include "ft_printf.h"
# include <stdlib.h>
# include <stdbool.h>
# include <limits.h>
#include <stdint.h>

// t_stack Represents a stack with pointers to its top 
// and bottom and its content.
typedef struct s_stack
{
	int		*stack;
	int		size;
	int		top;
	int		bottom;
}			t_stack;

// main structure for push_swap, containing two stacks (a and b) 
// and a list of operations.
typedef struct s_push_swap
{
	t_stack	a;
	t_stack	b;
	t_list	*op_list;
	bool	writing_mode;
}			t_ps;

// Enumeration for possible operations on the stacks.
enum		e_op
{
	null_op,
	pa,
	pb,
	ra,
	rb,
	rr,
	rra,
	rrb,
	rrr,
	sa,
	sb,
	ss
};

// DATA MANAGEMENT
void		init_data(t_ps *data, int argc, char **argv, bool writing_mode);
void		init_stack(t_ps *data, t_stack *stk, int size);
bool		is_sorted(t_ps *data);
void		free_data(t_ps *data);
void		error(t_ps *data);

// STACK UTILS
void		fill_stack(t_ps *data, t_stack *stk, int size, char **arg);
bool		valid_arg(char *arg);
void		check_duplication(t_ps *data, int *numbers, int size);
void		random_to_rank(int *numbers, int *rank, int size);

// STACK UTILS
int			next_up(t_stack *stk, int index);
int			next_down(t_stack *stk, int index);
int			value(t_stack *stk, int n);
int			current_size(t_stack *stk);
bool		is_full(t_stack *stk);

// OPERATIONS UTILS
void		save_op(t_ps *data, enum e_op op);
void		print_operations(t_list *head);
const char	*op_to_string(enum e_op op);
enum e_op	op_from(t_list *node);

// OPERATIONS ON STACKS
void		push(t_stack *src, t_stack *dest);
void		push_a(t_ps *data);
void		push_b(t_ps *data);
void		r_rotate(t_stack *stk);
void		r_rotate_a(t_ps *data);
void		r_rotate_b(t_ps *data);
void		r_rotate_ab(t_ps *data);
void		rotate(t_stack *stk);
void		rotate_a(t_ps *data);
void		rotate_b(t_ps *data);
void		rotate_ab(t_ps *data);
void		swap(t_stack *stk);
void		swap_a(t_ps *data);
void		swap_b(t_ps *data);
void		swap_ab(t_ps *data);

#endif
