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

void demo();

unsigned char far *source,far *source1;

void main()
 {
	int i;
/*	int irany,hanyat,most,mx=0,my=0,mz=0;
	int irany1,hanyat1,most1,mx1=0,my1=0,mz1=0;
	negyszogtipus3d a[2];
	haromszogtipus3d b[2];
	a[0].p[0].x=-50;a[0].p[0].y=-50;a[0].p[0].z=10;
	a[0].p[1].x=-50;a[0].p[1].y=50;a[0].p[1].z=10;
	a[0].p[2].x=50;a[0].p[2].y=-50;a[0].p[2].z=10;
	a[0].p[3].x=50;a[0].p[3].y=50;a[0].p[3].z=10;
	b[0].p[0].x=-60;b[0].p[0].y=-60;b[0].p[0].z=-10;
	b[0].p[1].x=-60;b[0].p[1].y=60;b[0].p[1].z=-10;
	b[0].p[2].x=60;b[0].p[2].y=-60;b[0].p[2].z=-10;/**/
//	initpot();
	clrscr();
	gotoxy(30,12);
	textcolor(GREEN);
	cprintf("FILL DEMO");
	printf("\n\n               szines vonal ");
	printf("\n         NYOMJ EGY BILLENTYUT");
	getch();
	source=loadgpi("green.gpi",0);
	if(source==NULL)return;
/*	setgr();
	readgpipal("green.pal",0,255,0);
	while(!kbhit())
	 {
		sline(random(320),random(200),random(320),random(200),source+random(*source*(*(source+1)-1)),*source);
		delay(random(100));
	 }
	getch();/**/
/*	closegraph();
	gotoxy(30,12);
	printf("teglalap");
	getch();
	setgr();
	readgpipal("green.pal",0,255,0);
	for(i=10;i<200;i++)
	 fitgpi(1,1,i+30,i,source);
	for(i=10;i<200;i++)
	 fitgpi(320-i,200-i,320,200,source);
	for(i=10;i<200;i++)
	 fitgpi(1,200-i,1+i,200,source);
	for(i=10;i<200;i++)
	 fitgpi(320-i,1,320,1+i,source);
	for(i=1;i<100;i++)
	 fitgpi(100-i,100-i,220+i,100+i,source);
	getch();/**/
/*	closegraph();
	gotoxy(30,12);
	printf("elipszis");
	getch();
	demo();
	for(i=0;i<50;i++)
	 {
		selipse(160,100,90+i,50+i,source1);
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,140,100-i,source1);
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,140-i,50,source1);
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,90-i,50-i,source1);
		delay(10);
	 }
	getch();
	closegraph();/**/
	gotoxy(30,12);
	printf("kor elforditva egy bizonyos szogben");
	getch();
	setgr();
	readgpipal("green.pal",0,255,0);
	for(i=0;i<360;i+=7)
	 {
		clearpot();
		szscircle(1+i/4,1+i/4,i/4+4,i,source);
		szscircle(320-i/4,1+i/4,i/4+4,i,source);
		szscircle(1+i/4,200-i/4,i/4+4,i,source);
		szscircle(320-i/4,200-i/4,i/4+4,i,source);
	 }
	for(i=0;i<360;i+=7)
	 {
		clearpot();
		szscircle(1+i/4,1+i/4,i/4+4,360-i,source);
		szscircle(320-i/4,1+i/4,i/4+4,360-i,source);
		szscircle(1+i/4,200-i/4,i/4+4,360-i,source);
		szscircle(320-i/4,200-i/4,i/4+4,360-i,source);
	 }
	getch();/**/
	closegraph();
//	source=loadgpi("tex1.gpi",0);
//	readgpipal("quake.pal",0,127,0);
/*	setgr();
	randomize();
	irany=random(6);
	hanyat=random(361);
	most=0;
	irany1=random(6);
	hanyat1=random(361);
	most1=0;
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
	closegraph();/**/
	free(source);
 }

 void demo()
	{
	setgr();
	source1=loadgpi("cool.gpi",0);
	readgpipal("cool.pal",0,255,0);
	char bol=1;
	int el[50];
	int t=0,y;
	float temp;
	for(temp=1;temp<180;temp+=0.1388)
	 {
		if(y!=(int)(50*mcos(temp)))
		 {
			y=(int)(50*mcos(temp));
			el[t]=(int)(*source1*msin(temp)/2);
			if(t<50)t++;
		 }
	 }
	int kur[50];
	for(t=0;t<50;t++)kur[t]=*source1;
	while(bol==1)
	 {
		clearpot(0);
		bol=0;
		for(t=1;t<50;t++)
		 {
			hsline(160-kur[t],160+kur[t],50+t,source1+*source1*t+2,*source1-1);
			hsline(160-kur[t],160+kur[t],50+99-t,source1+*source1*(99-t)+2,*source1-1);
			if(kur[t]>el[t])
			 {
				bol=1;
				kur[t]--;
			 }
		 }
//		delay(100);
	 }
	free(source1);
	}