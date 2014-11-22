#include <conio.h>
#include <stdlib.h>
#include <dos.h>
#include <stdio.h>
#include "ngraph.tud"
#include "3d.tud"

#define Kozepx 160
#define Kozepy 50
#define Kozepx1 160
#define Kozepy1 150
#define egyseg 3

void main()
 {
	unsigned char far *source,far *source1,far *source2;
	int irany,hanyat,most,mx=0,my=0,mz=0;
	int irany1,hanyat1,most1,mx1=0,my1=0,mz1=0;
	negyszogtipus3d a[2];
	haromszogtipus3d b[2];
	a[0].p[0].x=-50;a[0].p[0].y=-50;a[0].p[0].z=10;
	a[0].p[1].x=-50;a[0].p[1].y=50;a[0].p[1].z=10;
	a[0].p[2].x=50;a[0].p[2].y=-50;a[0].p[2].z=10;
	a[0].p[3].x=50;a[0].p[3].y=50;a[0].p[3].z=10;
	b[0].p[0].x=-60;b[0].p[0].y=-60;b[0].p[0].z=-10;
	b[0].p[1].x=-60;b[0].p[1].y=60;b[0].p[1].z=-10;
	b[0].p[2].x=60;b[0].p[2].y=-60;b[0].p[2].z=-10;
	clrscr();
	gotoxy(30,12);
	textcolor(GREEN);
	cprintf("FILL DEMO");
	printf("\n\n               (texturazas,kitoltes...) ");
	printf("\n         NYOMJ EGY BILLENTYUT");
	getch();
	setgr();
	source=loadgpi("tex1.gpi",0);
	readgpipal("quake.pal",0,127,0);
//	source=loadgpi("green.gpi",0);
//	readgpipal("green.pal",0,255,0);
	randomize();
	irany=random(6);
	hanyat=random(361);
	most=0;
	irany1=random(6);
	hanyat1=random(361);
	most1=0;
	initpot();
	while(!kbhit())
	 {
		if(irany==0)mx+=egyseg;
		if(irany==1)my+=egyseg;
		if(irany==2)mz+=egyseg;
		if(irany==3)
		 {
			mx+=egyseg;
			my+=egyseg;
		 }
		if(irany==4)
		 {
			mx+=egyseg;
			mz+=egyseg;
		 }
		if(irany==5)
		 {
			my+=egyseg;
			mz+=egyseg;
		 }
		if(mx>360)mx-=360;
		if(my>360)my-=360;
		if(mz>360)mz-=360;
		most+=egyseg;
		if(most>=hanyat)
		 {
			most=0;
			irany=random(6);
			hanyat=random(361);
		 }
		if(irany1==0)mx1+=egyseg;
		if(irany1==1)my1+=egyseg;
		if(irany1==2)mz1+=egyseg;
		if(irany1==3)
		 {
			mx1+=egyseg;
			my1+=egyseg;
		 }
		if(irany1==4)
		 {
			mx1+=egyseg;
			mz1+=egyseg;
		 }
		if(irany1==5)
		 {
			my1+=egyseg;
			mz1+=egyseg;
		 }
		if(mx1>360)mx1-=360;
		if(my1>360)my1-=360;
		if(mz1>360)mz1-=360;
		most1+=egyseg;
		if(most1>=hanyat1)
		 {
			most1=0;
			irany1=random(6);
			hanyat1=random(361);
		 }
		getkor(adr(a[0]),adr(a[1]),mx,my,mz,4);
		getkor(adr(b[0]),adr(b[1]),mx1,my1,mz1,3);
		clearpot(0);
		fill(a[1].p[0].x+Kozepx,a[1].p[0].y+Kozepy,a[1].p[1].x+Kozepx,a[1].p[1].y+Kozepy,a[1].p[2].x+Kozepx,a[1].p[2].y+Kozepy,a[1].p[3].x+Kozepx,a[1].p[3].y+Kozepy,source);
		fill(b[1].p[0].x+Kozepx1,b[1].p[0].y+Kozepy1,b[1].p[1].x+Kozepx1,b[1].p[1].y+Kozepy1,b[1].p[0].x+Kozepx1,b[1].p[0].y+Kozepy1,b[1].p[2].x+Kozepx1,b[1].p[2].y+Kozepy1,source);
//		copypottoscreen();
	 }
	closegraph();
 }
