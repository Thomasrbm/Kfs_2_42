#pragma once

// ajouter un null descirptor de 8 octet a 0x000

// en asm registre GDT = lgdt instruction

typedef struct s_kernel_code // exec / read
{
    void    *base;
    int     max_len;
    int     acces_rights;

} t_kernel_code;

typedef struct s_user_code // exec / read
{


} t_user_code;





typedef struct s_kernel_data // read / wrote le reste
{


} t_kernel_data;

typedef struct s_user_data
{


} t_user_data;







typedef struct s_kernel_stack
{


} t_kernel_stack;



typedef struct s_user_stack
{


} t_user_stack;





typedef struct s_sections
{
    t_user_code *user_code;
    t_kernel_code *kernel_code;

    t_user_stack *user_stack;
    t_kernel_stack *kernel_stack;

    t_user_data *user_stack;
    t_kernel_data *user_stack;
} t_sections;
