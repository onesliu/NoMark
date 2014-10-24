
#ifndef IniCfaceUnitH
#define IniCfaceUnitH

#ifdef INI_DLL_LIB
#define EXPORT __declspec(dllexport)
#else
#define EXPORT
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef void * ini_dom_handle;

/*  Return:     NULL: Fail, otherwise dom handle
 *  Params:     file    NULL makes a empty dom
 */
EXPORT ini_dom_handle get_dom( const char *file );
EXPORT void free_dom( ini_dom_handle dom );
EXPORT void clear_dom( ini_dom_handle dom );
EXPORT void set_encode( ini_dom_handle dom, int encode );

/*  Return:     0: Success, otherwise Fail */
EXPORT int load_from( ini_dom_handle dom, const char *file );
EXPORT int load_from_buf( ini_dom_handle dom, const char *buf );
EXPORT int save_to( ini_dom_handle dom, const char *file );
/*  Return:     0: Fail, otherwise buf ptr */
EXPORT char * save_to_buf( ini_dom_handle dom, int *len );
EXPORT void free_buf( char *buf );

/*  Return:     0: Success, otherwise Fail */
EXPORT int add_section( ini_dom_handle dom, const char *section );
EXPORT int del_section( ini_dom_handle dom, const char *section );
EXPORT int find_section( ini_dom_handle dom, const char *section );
EXPORT int rename_section( ini_dom_handle dom, const char *section, const char *newsection );

EXPORT int add_keypair( ini_dom_handle dom, const char *section, const char *keyname, const char *value );
EXPORT int del_keypair( ini_dom_handle dom, const char *section, const char *keyname );
EXPORT int find_keypair( ini_dom_handle dom, const char *section, const char *keyname );

/*  Return:     -1: Fail, otherwise Section Count */
EXPORT int section_count( ini_dom_handle dom );
EXPORT int keypair_count( ini_dom_handle dom,  const char *section );

/*  Return:     -1: Fail, otherwise value length */
EXPORT int get_value( ini_dom_handle dom, const char *section, const char *keyname, char *value );

/*  Return:     -1: Fail, otherwise section length */
EXPORT int get_first_section( ini_dom_handle dom, char *section );
EXPORT int get_next_section( ini_dom_handle dom, char *section );

/*  Return:     -1: Fail, otherwise value length */
EXPORT int get_first_keypair( ini_dom_handle dom, const char *section, char *keyname, char *value );
EXPORT int get_next_keypair( ini_dom_handle dom, const char *section, char *keyname, char *value );

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
