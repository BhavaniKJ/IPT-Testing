#include <numeric>
#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/opencv.hpp"
#include <iostream>
using namespace cv;
using namespace std;
extern "C"
{
    #include "api_scilab.h"
    #include "Scierror.h"
    #include "BOOL.h"
    #include <localization.h>
int opencv_aimread(char *fname, unsigned long fname_len)
{
    SciErr sciErr;
    int iLen        = 0;
    //variable info
    int iRows       = 0;
    int iCols       = 0;
    int *piAddr     = NULL;
    int *piAddrNew  = NULL;
    int piRows      = 0;
    int piCols      = 0;        
    int *piLen      = NULL;
    char **pstData  = NULL;
    int **pstData1  = NULL;
    int i,j,k=0;


    //Checking number of input and output arguments (enviromnet variable, min arguments, max arguments)
    CheckInputArgument(pvApiCtx, 1, 1);
    CheckOutputArgument(pvApiCtx, 1, 1) ;
    
    // get Address of inputs
    sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddr);

    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }


    //Now, we will retrieve the string from the input parameter. For this, we will require 3 calls
    //first call to retrieve dimensions
    sciErr = getMatrixOfString(pvApiCtx, piAddr, &iRows, &iCols, NULL, NULL);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }
    piLen = (int*)malloc(sizeof(int) * iRows * iCols);
    //second call to retrieve length of each string
    sciErr = getMatrixOfString(pvApiCtx, piAddr, &iRows, &iCols, piLen, NULL);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }

    pstData = (char**)malloc(sizeof(char*) * iRows * iCols);
    for(i = 0 ; i < iRows * iCols ; i++)
    {
        pstData[i] = (char*)malloc(sizeof(char) * (piLen[i] + 1));//+ 1 for null termination
    }
    //third call to retrieve data
    sciErr = getMatrixOfString(pvApiCtx, piAddr, &iRows, &iCols, piLen, pstData);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }
    
    //creating image matrix, by getting the image at the specified path
    Mat img = imread(pstData[0],CV_LOAD_IMAGE_UNCHANGED);
    /*
    What we now need, is to pass this matrix to the Scilab environment.
    We do this by passing a List of 2-D matrices. The size of the list, in our case is known(3),
    hence we do not require the dynamic capability of a list.
    The first matrix will be a matrix with dimensions img.rows X img.cols, and will denote the R(red)
    values of the image. Similarly, the second will have the G(green) values, and the third will have B(blue) values
    */

    //Since we need to pass a single pointer as an arguement, for a 2-D matrix, we define it in this manner
     unsigned char *r = (unsigned char *)malloc(img.rows * img.cols * sizeof(unsigned char));
     unsigned char *g = (unsigned char *)malloc(img.rows * img.cols * sizeof(unsigned char));
     unsigned char *b = (unsigned char *)malloc(img.rows * img.cols * sizeof(unsigned char));

     //The next block of code retrieves the RGB values at a specified pixel, and assigns it to the matrices
     for(i=0;i<img.rows;i++)
     {
        for(j=0;j<img.cols;j++)
        {
            Vec3b intensity = img.at<Vec3b>(i, j);
            *(r + i*img.cols + j)=intensity.val[2];
            *(g + i*img.cols + j)=intensity.val[1];
            *(b + i*img.cols + j)=intensity.val[0];
        }
     }

     //creating the list that will be passed to the Scilab enviroment
    sciErr = createList(pvApiCtx, nbInputArgument(pvApiCtx) + 1, 3, &piAddrNew);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }


    //Adding the R value matrix to the list
    //Syntax : createMatrixOfInteger32InList(void* _pvCtx, int _iVar, int* _piParent, int _iItemPos, int _iRows, int _iCols, const int* _piData)
    sciErr = createMatrixOfUnsignedInteger8InList(pvApiCtx, nbInputArgument(pvApiCtx)+1 , piAddrNew, 1, img.rows, img.cols, r);
    free(r);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }

    //Adding the G value matrix to the list
    sciErr = createMatrixOfUnsignedInteger8InList(pvApiCtx, nbInputArgument(pvApiCtx)+1 , piAddrNew, 2, img.rows, img.cols, g);
    free(g);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }

    //Adding the B value matrix to the list
    sciErr = createMatrixOfUnsignedInteger8InList(pvApiCtx, nbInputArgument(pvApiCtx)+1 , piAddrNew, 3, img.rows, img.cols, b);
    free(b);
    if(sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }

    //Assigning the list as the Output Variable
    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    //Returning the Output Variables as arguments to the Scilab environment
    ReturnArguments(pvApiCtx); 
    return 0;
}
/* ==================================================================== */
}
