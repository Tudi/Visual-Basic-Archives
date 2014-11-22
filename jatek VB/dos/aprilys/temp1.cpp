#include <conio.h>
#include <stdlib.h>
#include <dos.h>
#include <stdio.h>
#include "ngraph.tud"
#include "3d.tud"

#define Kozepx 160
#define Kozepy 70
#define Kozepx1 160
#define Kozepy1 130
#define egyseg 3
#define Tspeed 1

void demo();

unsigned char far *source,far *source1;

void main()
 {
	int i;
	int irany,hanyat,most,mx=0,my=0,mz=0;
	int irany1,hanyat1,most1,mx1=0,my1=0,mz1=0;
	float ri=-33,gi=-33,bi=33;
	negyszogtipus3d a[2];
	haromszogtipus3d b[2];
	a[0].p[0].x=-50;a[0].p[0].y=-50;a[0].p[0].z=10;
	a[0].p[1].x=-50;a[0].p[1].y=50;a[0].p[1].z=10;
	a[0].p[2].x=50;a[0].p[2].y=-50;a[0].p[2].z=10;
	a[0].p[3].x=50;a[0].p[3].y=50;a[0].p[3].z=10;
	b[0].p[0].x=-60;b[0].p[0].y=-60;b[0].p[0].z=-10;
	b[0].p[1].x=-60;b[0].p[1].y=60;b[0].p[1].z=-10;
	b[0].p[2].x=60;b[0].p[2].y=-60;b[0].p[2].z=-10;/**/
	initpot();
	clrscr();
	gotoxy(30,12);
	textcolor(GREEN);
	cprintf("FILL DEMO");
	printf("\n\n               szines vonal ");
	printf("\n         NYOMJ EGY BILLENTYUT");
	getch();
	source=loadgpi("green.gpi",0);
	if(source==NULL)return;
	setgr();
	readgpipal("green.pal",0,255,0);
	clearpot(0);
	while(!kbhit())
	 {
		sline(random(320),random(200),random(320),random(200),source+random(*source*(*(source+1)-1)),*source);
		copypottoscreen();
		delay(random(100));
	 }
	getch();/**/
	closegraph();
	gotoxy(30,12);
	printf("teglalap");
	getch();
	setgr();
	readgpipal("green.pal",0,255,0);
	clearpot(0);
	for(i=10;i<200;i++)
	 {
		fitgpi(1,1,i+30,i,source);
		copypottoscreen();
	 }
	for(i=10;i<200;i++)
	 {
		fitgpi(320-i,200-i,320,200,source);
		copypottoscreen();
	 }
	for(i=10;i<200;i++)
	 {
		fitgpi(1,200-i,1+i,200,source);
		copypottoscreen();
	 }
	for(i=10;i<200;i++)
	 {
		fitgpi(320-i,1,320,1+i,source);
		copypottoscreen();
	 }
	for(i=1;i<100;i++)
	 {
		fitgpi(100-i,100-i,220+i,100+i,source);
		copypottoscreen();
	 }
	getch();/**/
	closegraph();
	gotoxy(30,12);
	printf("elipszis");
	getch();
	demo();
	for(i=0;i<50;i++)
	 {
		selipse(160,100,90+i,50+i,source1);
		copypottoscreen();
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,140,100-i,source1);
		copypottoscreen();
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,140-i,50,source1);
		copypottoscreen();
		delay(10);
	 }
	for(i=0;i<50;i++)
	 {
		selipse(160,100,90-i,50-i,source1);
		copypottoscreen();
		delay(10);
	 }
	getch();
	closegraph();/**/
	farfree(source);
	source=loadgpi("tex1.gpi",0);
	gotoxy(30,12);
	printf("kor elforditva egy bizonyos szogben");
	getch();
	setgr();
	readgpipal("quake.pal",0,127,0);
	for(i=0;i<360;i+=7)
	 {
		clearpot(0);
		szscircle(70+i/4,10+i/4,i/4+4,i,source);
		szscircle(250-i/4,190-i/4,i/4+4,i,source);
		copypottoscreen();
	 }
	for(i=360;i>0;i-=7)
	 {
		clearpot(0);
		szscircle(250-i/4,10+i/4,i/4+4,360-i,source);
		szscircle(70+i/4,190-i/4,i/4+4,360-i,source);
		copypottoscreen();
	 }
	getch();/**/
	closegraph();
	gotoxy(30,12);
	printf("texturazas hatter kivagassal");
	farfree(source1);
	source1=loadgpi("mouse.gpi",0);
	getch();
	setgr();
	readgpipal("quake.pal",0,127,0);
	for(most=0;most<150;most+=7)
	 {
		clearpot(0);
		putgpi(140,70,source1);
		line2(50+most,1,1+most,199,*(source1+2));
		line2(0+most,199,150+most,199,*(source1+2));
		line2(100+most,1,150+most,199,*(source1+2));
		line2(50+most,1,100+most,1,*(source1+2));
		line2(320-most,199,270-most,1,*(source1+2));
		line2(270-most,1,220-most,1,*(source1+2));
		line2(170-most,199,220-most,1,*(source1+2));
		line2(320-most,199,170-most,199,*(source1+2));
		nfill(50+most,1,1+most,199,100+most,1,150+most,199,source1,*(source1+2));
		nfill(320-most,199,270-most,1,170-most,199,220-most,1,source1,*(source1+2));
		copypottoscreen();
		delay(50);
	 }
	for(most=150;most>0;most-=7)
	 {
		clearpot(0);
		line2(50+most,1,1+most,199,*(source1+2));
		line2(0+most,199,150+most,199,*(source1+2));
		line2(100+most,1,150+most,199,*(source1+2));
		line2(50+most,1,100+most,1,*(source1+2));
		line2(320-most,199,270-most,1,*(source1+2));
		line2(270-most,1,220-most,1,*(source1+2));
		line2(170-most,199,220-most,1,*(source1+2));
		line2(320-most,199,170-most,199,*(source1+2));
		putgpi(141,71,source1);
		nfill(51+most,1,1+most,199,111+most,1,151+most,199,source1,*(source1+2));
		nfill(319-most,199,271-most,1,171-most,199,221-most,1,source1,*(source1+2));
		copypottoscreen();
		delay(50);
	 }
	getch();
	closegraph();
	gotoxy(30,12);
	printf("szimpla poligon texturazas");
	farfree(source);
	farfree(source1);
	source=loadgpi("tex5.gpi",0);
	source1=loadgpi("tex.gpi",0);
	getch();
	setgr();
	readgpipal("quake.pal",0,127,0);
	randomize();
	irany=random(6);
	hanyat=random(361);
	most=0;
	irany1=random(6);
	hanyat1=random(361);
	most1=0;
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
		if(ri>45)ri=45;
		if(ri<-45)ri=-45;
		if(gi>45)gi=45;
		if(gi<-45)gi=-45;
		if(bi>45)bi=45;
		if(bi<-45)bi=-45;
		inittransparent(ri,gi,bi);
		getkor(adr(a[0]),adr(a[1]),mx,my,mz,4);
		getkor(adr(b[0]),adr(b[1]),mx1,my1,mz1,3);
		clearpot(0);
		fill(a[1].p[0].x+Kozepx,a[1].p[0].y+Kozepy,a[1].p[1].x+Kozepx,a[1].p[1].y+Kozepy,a[1].p[2].x+Kozepx,a[1].p[2].y+Kozepy,a[1].p[3].x+Kozepx,a[1].p[3].y+Kozepy,source);
		fill(b[1].p[0].x+Kozepx,b[1].p[0].y+Kozepy+100,b[1].p[1].x+Kozepx,b[1].p[1].y+Kozepy+100,b[1].p[2].x+Kozepx,b[1].p[2].y+Kozepy+100,b[1].p[3].x+Kozepx,b[1].p[3].y+Kozepy+100,source1);
		tfill(140,70,120,160,210,60,220,150);
//		tbar(200,70,250,140);
//		nfill(b[1].p[0].x+Kozepx1,b[1].p[0].y+Kozepy1-50,b[1].p[1].x+Kozepx1,b[1].p[1].y+Kozepy1-50,b[1].p[0].x+Kozepx1,b[1].p[0].y+Kozepy1-50,b[1].p[2].x+Kozepx1,b[1].p[2].y+Kozepy1-50,source1,*(source1+2));
		copypottoscreen();
	 }
	closegraph();/**/
	farfree(source);
	farfree(source1);
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
		copypottoscreen();
		delay(10);
	 }
	farfree(source1);
	}