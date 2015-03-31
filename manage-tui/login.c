#include<stdlib.h>
#include<unistd.h>
#include<curses.h>
#include<string.h>

##  Login Interface using ncurses for Linux
## Description: This program uses the ncurses library to offer a similar interface as offered by Linux during login.
## To compile please issue this command "gcc login.c -o login -lcurses".

 int main()
{
 char* loginName = "LOGIN";
 char* psswd = "PASSWORD";
 char* temp;
 initscr();//initialize curses
/*check for color support of terminal*/
if(!has_colors())
{ endwin();
 perror("Error:");
 exit(EXIT_FAILURE);
}
/*starts the color support of terminal*/
if(start_color() != OK)
{ endwin();
 perror("Error:");
 exit(EXIT_FAILURE);
}
 clear();
 refresh();
/*define new color pair to use*/
 init_pair(1,COLOR_BLUE,COLOR_YELLOW);
 attrset(COLOR_PAIR(1) | A_BOLD);
 mvprintw(15,10,"Please Enter your Login Name: ");
 refresh();
 temp = (char*)malloc(30);
 mvscanw(15,40,"%s",temp);
if(strcmp(temp,loginName)==0)
{ mvprintw(18,10,"Enter the Password(will not be echoed):");
 noecho();

