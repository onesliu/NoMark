//---------------------------------------------------------------------------

#ifndef GPrinterUnitH
#define GPrinterUnitH
//---------------------------------------------------------------------------
class IPrinter {
public:
    enum { ALIGN_LEFT, ALIGN_CENTER, ALIGN_RIGHT };

    IPrinter() : gp(-1), linewidth(32) {}

    virtual bool OpenPrinter();
    virtual void ClosePrinter();
    virtual void PrintBin( char c );
    virtual void ResetPrinter();
	virtual void PrintStr( AnsiString str );
    virtual void PrintStr( AnsiString str, int width, int align = ALIGN_LEFT);
	virtual void PrintLine( AnsiString str );
	virtual void PrintCharLine( char c );
    virtual void PrintTab();
	virtual void PrintReturn();
    virtual void FeedPaper(int line);
	virtual void PrintItem( AnsiString name, AnsiString value );
    virtual void SetAlign(int align);
    virtual void SetColumn(int col[], int num);

	virtual void PrintLogo(AnsiString sPrintLogo);
	virtual void PrintTail(AnsiString sPrintTail);
    virtual void KickOut();

	virtual void SetBigWord() {}
	virtual void ClrBigWord() {}

protected:
	int gp;
    int linewidth;
};

class GPrinter : public IPrinter {
public:
	void SetBigWord();
	void ClrBigWord();
};

class GiChengPrinter : public IPrinter {
};

#endif
