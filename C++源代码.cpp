//
#include "stdafx.h"
#include "cv.h"
#include "highgui.h"
#include "iostream"
using namespace cv;
using namespace std;                                                     
int _tmain(int argc, _TCHAR* argv[])
{
	  IplImage    *cur_rgb=0,*cur_gray=0;
	  IplImage    *pre=0;
	  int num=0;
	  CvCapture   *capture = cvCaptureFromCAM(0);
      while (cur_rgb=cvQueryFrame(capture))
	  {  
		  cur_gray = cvCreateImage( cvGetSize(cur_rgb),IPL_DEPTH_8U,1 );
		  cvCvtColor(cur_rgb, cur_gray, CV_BGR2GRAY );
		  num++;
		  if (num==1)
	           {pre = cvCreateImage( cvGetSize(cur_rgb),IPL_DEPTH_8U,1 ); 
		        cvCopy(cur_gray,pre);
		       }
		  else
		  {
			  IplImage *diff=cvCreateImage( cvGetSize(cur_gray),IPL_DEPTH_8U, 1 );
			  cvAbsDiff(pre, cur_gray,diff);
			  cvCopy(cur_gray,pre);

			   cvNamedWindow("pre", 0);
			   cvShowImage("pre", pre);
			   cvNamedWindow("cur_gray", 0);
			   cvShowImage("cur_gray", cur_gray);
			   cvNamedWindow("背À3景¡ã差?分¤?法¤¡§", 0);
			   cvShowImage("背À3景¡ã差?分¤?法¤¡§", diff);
			   int c = waitKey(5);
			   if( (char)c == 27 )
			   {
				 break; 
			   } 
		  }
	  }
	return 0;
}

