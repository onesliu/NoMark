//---------------------------------------------------------------------------

#ifndef ScaleH
#define ScaleH
//---------------------------------------------------------------------------

#include <vcl.h>

class TScale
{
public:
	AnsiString errmsg;
    
    bool ParseFile();
    bool SendScale();
    bool RecvScale();
};

#endif
