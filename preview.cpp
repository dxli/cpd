#include "preview.h"
#include <poppler/qt5/poppler-qt5.h>
#include <iostream>

using namespace std;

QImage pdf_preview::requestImage(const QString &id, QSize *size, const QSize &requested_size){
    Poppler::Document* document = Poppler::Document::load("/tmp/test.pdf");
    if (!document || document->isLocked() || document == 0 )
    {
        cout << "ERROR" << endl;
    }

    Poppler::Page* page = document->page(0);
    if (page == 0)
    {
        cout << "ERROR" << endl;
    }

    QImage image = page->renderToImage(72.0,72.0,0,0,page->pageSize().width(),page->pageSize().height());
    if (image.isNull())
    {
        cout << "ERROR" << endl;
    }

    return image;
    delete page;
    delete document;
}
