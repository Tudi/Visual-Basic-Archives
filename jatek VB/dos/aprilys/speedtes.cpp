#include "ngraph.tud"
#include <stdio.h>
#include <dos.h>
#include <conio.h>

struct time t,t1;

unsigned int converttosec(struct time);

void main()
{
 unsigned int i,j,ful;
 unsigned long time1,time2;
 unsigned char far *source;
 clrscr();
 textcolor(RED);
 cprintf("KERLEK FUTASD TOBBSZOR , AZ EREDMENYEK VALTOZNAK!!!!");
 textcolor(WHITE);
 printf("\ntesting pixel(100 frame):");
 printf("\n NYOMJ EGY BILLENTYUT");
 getch();
 setgr();
 gettime(&t);
 for(j=0;j<50;j++)
	for(ful=0;ful<64000;ful++)
	 {
		putpixel(1,1,0);
		putpixel(-1,1,0);
	 }
 gettime(&t1);
 time1=converttosec(t1)-converttosec(t);
 gettime(&t);
 for(j=0;j<50;j++)
	for(ful=0;ful<64000;ful++)
	 {
		putpixel(1,1,0);
		putpixel(-1,1,0);
	 }
 gettime(&t1);
 time2=(converttosec(t1)-converttosec(t));
 closegraph();
 printf("\naz o algoritmusa szerint szazadmasodpercbe kerult kerult 100 frame : %u ",time1);
 printf("\naz en algoritmusom szerint szazadmasodpercbe kerult kerult 100 frame : %u ",time2);
 printf("\naltalaban 428-434 kozott van");
 printf("\na kulombseg : %i ",time2-time1);
 getch();

 clrscr();
 printf("\ntesting line(100 frame):");
 printf("\n NYOMJ EGY BILLENTYUT");
 getch();
 setgr();
 setcolor(10);
 gettime(&t);
 for(i=0;i<50;i++)
	for(ful=0;ful<320;ful++)
	 {
		line(ful,1,ful,200);
		line(ful,-10,ful,210);
	 }
 gettime(&t1);
 time1=converttosec(t1)-converttosec(t);
 gettime(&t);
 for(i=0;i<100;i++)
	for(ful=0;ful<320;ful++)
	 {
		line2(ful,1,ful,200,9);
		line2(ful,-10,ful,210,9);
	 }
 gettime(&t1);
 time2=(converttosec(t1)-converttosec(t));
 closegraph();
 printf("\naz o algoritmusa szerint szazadmasodpercbe kerult kerult 100 frame : %u ",time1);
 printf("\naz en algoritmusom szerint szazadmasodpercbe kerult kerult 100 frame : %u ",time2);
 printf("\naltalaban 164-577 kozott van");
 printf("\na kulombseg : %i ",time2-time1);
 getch();/**/
 clrscr();
 printf("texturazas teszteles");
 source=loadgpi("tex1.gpi",0);
 getch();
 setgr();
 readgpipal("quake.pal",0,127,0);
 gettime(&t);
 for(i=0;i<100;i++)
	fill(1,1,1,199,319,1,319,199,source);
 gettime(&t1);
 time2=(converttosec(t1)-converttosec(t));
 closegraph();
 printf("\naz algoritmusom szerint 100 frame %i szazadmasodpercbe kerult",time2);
 printf("\naltalaban 110");
 getch();
}

unsigned int converttosec(struct time t)
 {return(t.ti_sec*100+t.ti_hund);}