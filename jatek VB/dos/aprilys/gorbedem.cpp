#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <dos.h>
#include <io.h>
#include <fcntl.h>
#include <graph256.tud>

#define NRgolyok Ng
//#define NRgolyok 20
#define Minx 1 /*a tabla bal szele*/
#define Miny 1 /*a tabla felso sora*/
#define Maxx 640 /*a tabla jaobb szele*/
#define Maxy 480 /*a tabla utolso sora*/
#define Pxangle 1
#define Pyangle 1
#define Maxxangle 3 /*milyen gyakran mozduljon az adott sikban*/
#define Maxyangle 4 /*milyen gyakran mozduljon az adott sikban*/
#define Maxcolor 3 /*a golyo ezek a szinek kozul valogathat*/
#define Maxxspeed 2 /*legalabb ketto,milyen nagyot lepjen az adott sikban*/
#define Maxyspeed 2 /*legalabb ketto,milyen nagyot lepjen az adott sikban*/
#define maxxspeed 5 /*egy sikban milyen gyorsan mehet*/
#define maxyspeed 5 /*egy sikban milyen gyorsan mehet*/
#define minxspeed 1 /*egy sikban milyen lassan mehet*/
#define minyspeed 1 /*egy sikban milyen lassan mehet*/

typedef struct {
								int x,y;       /*a harom kordinata es az elteresi szog*/
								char ik,nextx,nexty,nextz,px,py,pz; /*szine,hany utan lepjen meg egyet,merre(8),hany pixelt*/
							 }golyo;

 void checkhitborder(char);
 void movegolyo(char);
 void initgolyo(char);
 void checkstoped(char);
 void gorbe(golyo *source,int m,int szin);
 void Bezierkeplet(golyo *source,int m,float u,int *x,int *y);

unsigned int counter,Ng;
golyo golyok[50];
float pas=0.028;

void main()
 {
	int i;
	clrscr();
	printf("hany kontrolpontot hasznaljak a gorbe generalasahoz(4..25)");
	scanf("%i",&Ng);
	if(Ng>25)Ng=25;
	if(Ng<0)Ng=1;
	for(i=0;i<NRgolyok;i++)initgolyo(i);
	for(i=0;i<NRgolyok;i++)checkstoped(i);
	setgr(2);
	setcolor(9);
	while (!kbhit())
	 {
		for(i=0;i<NRgolyok;i++)movegolyo(i);
//		for(i=0;i<NRgolyok;i++)putpixel(golyok[i].x,golyok[i].y,4);
		gorbe(golyok,NRgolyok-1,9);
		delay(2);
		gorbe(golyok,NRgolyok-1,0);
//		for(i=0;i<NRgolyok;i++)putpixel(golyok[i].x,golyok[i].y,0);
		counter++;
	 }
	getch();
	closegraph();
 }

void gorbe(golyo *source,int m,int szin)
 {
	float u;
	int kx,ky,x,y;
	Bezierkeplet(source,m,0,&kx,&ky);
	setcolor(szin);
	for(u=pas;u<1;u+=pas)
	 {
		Bezierkeplet(source,m,u,&x,&y);
		if (kx!=x||ky!=y)
		 {
			line(kx,ky,x,y);
			kx=x;
			ky=y;
		 }
	 }
	Bezierkeplet(source,m,1,&x,&y);
	if(kx!=x||ky!=y)line(kx,ky,x,y);
 }

void Bezierkeplet(golyo *source,int m,float u,int *x,int *y)
 {
	float b;
	int k;
	if(u==0){*x=source->x;*y=source->y;return;}
	if(u==1){*x=(source+m)->x;*y=(source+m)->y;return;}
	b=pow(1-u,m);
	*x=b*source->x;
	*y=b*source->y;
	for(k=1;k<=m;k++)
	 {
		b=b*(m-k+1)*u/k/(1-u);
		*x=*x+b*(source+k)->x;
		*y=*y+b*(source+k)->y;
	 }
 }

	void checkstoped(char ik)
	 {
		while(golyok[ik].px==0 && golyok[ik].py==0)
		 {
			golyok[ik].py=rand()%Maxyspeed;
			golyok[ik].px=rand()%Maxxspeed;
		 }
	 }

 void movegolyo(char ik)
	{
	 if(counter % golyok[ik].nexty==0)
		{
		 checkhitborder(ik);
		 golyok[ik].y=golyok[ik].y+golyok[ik].py;
		}
	 if(counter % golyok[ik].nextx==0)
		{
		 checkhitborder(ik);
		 golyok[ik].x=golyok[ik].x+golyok[ik].px;
		}
	}

 void checkhitborder(char ik)
	{
	 char bol;
	 bol=rand()%10;
	 if(golyok[ik].y+golyok[ik].py<=Miny && golyok[ik].py<0)
		{
		 golyok[ik].py=golyok[ik].py*(-1);
		 if (bol>=5 && golyok[ik].nextx<maxxspeed)golyok[ik].nextx=golyok[ik].nextx+Pxangle;
		 if (bol<5 && golyok[ik].nextx>minxspeed)golyok[ik].nextx=golyok[ik].nextx-Pxangle;
		}
	 if(golyok[ik].y+golyok[ik].py>=Maxy && golyok[ik].py>0)
		{
		 golyok[ik].py=golyok[ik].py*(-1);
		 if (bol>=5 && golyok[ik].nextx<maxxspeed)golyok[ik].nextx=golyok[ik].nextx+Pxangle;
		 if (bol<5 && golyok[ik].nextx>minxspeed)golyok[ik].nextx=golyok[ik].nextx-Pxangle;
		}
	 if(golyok[ik].x+golyok[ik].px<=Minx && golyok[ik].px<0)
		{
		 golyok[ik].px=golyok[ik].px*(-1);
		 if (bol>=5 && golyok[ik].nexty<maxyspeed)golyok[ik].nexty=golyok[ik].nexty+Pyangle;
		 if (bol<5 && golyok[ik].nexty>minyspeed)golyok[ik].nexty=golyok[ik].nexty-Pyangle;
		}
	 if(golyok[ik].x+golyok[ik].px>=Maxx && golyok[ik].px>0)
		{
		 golyok[ik].px=golyok[ik].px*(-1);
		 if (bol>=5 && golyok[ik].nexty<maxyspeed)golyok[ik].nexty=golyok[ik].nexty+Pyangle;
		 if (bol<5 && golyok[ik].nexty>minyspeed)golyok[ik].nexty=golyok[ik].nexty-Pyangle;
		}
	}

 void initgolyo(char ik)
	{
	 while(golyok[ik].x<=Minx)golyok[ik].x=rand()%Maxx;
	 while(golyok[ik].x<=Minx)golyok[ik].y=rand()%Maxy;
	 while(golyok[ik].nextx<minxspeed)golyok[ik].nextx=rand()%Maxxangle;
	 while(golyok[ik].nexty<minyspeed)golyok[ik].nexty=rand()%Maxyangle;
	 golyok[ik].ik=0;
	 while(golyok[ik].py==0)golyok[ik].py=rand()%Maxyspeed;
	 while(golyok[ik].px==0)golyok[ik].px=rand()%Maxxspeed;
	}

