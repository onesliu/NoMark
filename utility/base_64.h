//---------------------------------------------------------------------------

#ifndef base_64H
#define base_64H
//---------------------------------------------------------------------------
/* Return:          0       Success
 *                  -1      Params error
 *                  -2      Crypt buffer overflow
 */
int base64_encode(const unsigned char *in,  unsigned long len,
                        unsigned char *out, unsigned long *outlen);

/* Return:          0       Success
 *                  -1      Params error
 *                  -2      Invalid packet
 */
int base64_decode(const unsigned char *in,  unsigned long len,
                        unsigned char *out, unsigned long *outlen);

#endif
