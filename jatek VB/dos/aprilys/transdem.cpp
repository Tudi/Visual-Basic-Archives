#include <conio.h>
#include <stdlib.h>
#include <dos.h>
#include <stdio.h>
#include "ngraph.tud"
#include "3d.tud"

#define Kozepx 160
#define Kozepy 100
#define egyseg 3
#define Tspeed 1

void main()
 {
	unsigned char far *source,far *source1;
	int irany,hanyat,most,mx=0,my=0,mz=0;
	float ri=-33,gi=-33,bi=33;
  int i,j;
	negyszogtipus3d a[2];
	a[0].p[0].x=-100;a[0].p[0].y=-100;a[0].p[0].z=10;
	a[0].p[1].x=-100;a[0].p[1].y=100;a[0].p[1].z=10;
	a[0].p[2].x=100;a[0].p[2].y=-100;a[0].p[2].z=10;
	a[0].p[3].x=100;a[0].p[3].y=100;a[0].p[3].z=10;
	clrscr();
	gotoxy(30,12);
	textcolor(MAGENTA);
	cprintf("TRANSPARENCI DEMO");
	printf("\n         NYOMJ EGY BILLENTYUT");
	getch();
	setgr();
	source=loadgpi("tex1.gpi",0);
	source1=loadgpi("aprily.gpi",0);
	readgpipal("quake.pal",0,127,0);
	randomize();
	irany=random(6);
	hanyat=random(361);
	most=0;
	initpot();
	while(!kbhit())
	 {
		if(irany==0)
		 {
			mx+=egyseg;
			ri+=Tspeed;
		 }
		if(irany==1)
		 {
			my+=egyseg;
			gi+=Tspeed;
		 }
		if(irany==2)
		 {
			mz+=egyseg;
			bi+=Tspeed;
		 }
		if(irany==3)
		 {
			mx+=egyseg;
			my+=egyseg;
			ri-=Tspeed;
		 }
		if(irany==4)
		 {
			mx+=egyseg;
			mz+=egyseg;
			gi-=Tspeed;
		 }
		if(irany==5)
		 {
			my+=egyseg;
			mz+=egyseg;
			bi-=Tspeed;
		 }
		if(mx>360)mx-=360;
		if(my>360)my-=360;
		if(mz>360)mz-=360;
		if(ri>45)ri=45;
		if(ri<-45)ri=-45;
		if(gi>45)gi=45;
		if(gi<-45)gi=-45;
		if(bi>45)bi=45;
		if(bi<-45)bi=-45;
		inittransparent(ri,gi,bi);
		most+=egyseg;
		if(most>=hanyat)
		 {
			most=0;
			irany=random(6);
			hanyat=random(361);
		 }
		getkor(adr(a[0]),adr(a[1]),mx,my,mz,4);
		clearpot(0);
		fill(a[1].p[0].x+Kozepx,a[1].p[0].y+Kozepy,a[1].p[1].x+Kozepx,a[1].p[1].y+Kozepy,a[1].p[2].x+Kozepx,a[1].p[2].y+Kozepy,a[1].p[3].x+Kozepx,a[1].p[3].y+Kozepy,source);
		for(i=0;i<*(source1+1);i++)
		 for(j=0;j<*source1;j++)
			if(*(source1+*source1*i+j+2)!=*(source1+2))tputpixel(j+50,i+100);
		ftcircle(100,50,50);
//		tbar(150,270,320,200);
		tfill(180,40,170,60,240,20,300,120);
		tfill(130,130,90,170,130,130,150,180);
//		delay(10);
		copypottoscreen();
	 }
	closegraph();
 }
