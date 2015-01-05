//---------------------------------------------------------------------------

#ifndef SoundPlayH
#define SoundPlayH

#include <windows.h>
#include<mmsystem.h>
//---------------------------------------------------------------------------
class SoundPlay {
public:
    enum {  SOUND_ORDER_NEW = 0,
            SOUND_ORDER_MODIFY = 1,
            SOUND_ORDER_FINISH = 2,
    };
    
    SoundPlay() {
    }

    void play(int id)
    {
        if ( id == SOUND_ORDER_NEW )
        {
            PlaySound("neworder.wav", NULL, SND_FILENAME|SND_ASYNC);
        }
        else if ( id == SOUND_ORDER_MODIFY )
        {
            PlaySound("modify.wav", NULL, SND_FILENAME|SND_ASYNC);
        }
        else if ( id == SOUND_ORDER_FINISH )
        {
            PlaySound("complete.wav", NULL, SND_FILENAME|SND_ASYNC);
        }
    }
};
#endif
 