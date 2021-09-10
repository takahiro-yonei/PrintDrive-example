/**
 * PxDoc起動用Apexコントローラ
 */
public with sharing class ConBootPxDoc_Sample {

    public String pxdocUrl {get; private set;}
    public String pxdocToken {get; private set;}
    public String pxdocLicEndPoint {get; private set;}


    public ConBootPxDoc_Sample(ApexPages.StandardController stdCon) {}

    /**
     * サンプル(1)
     */
    public Pagereference doBootPxDoc_01() {
        // pxdocLicEndPoint, pxdocToken はPxDoc3を起動する上で必要な接続情報になります
        pxdocLicEndPoint = printdrive.ServiceCreatePxDocLicUrl.generate();
        pxdocToken = printdrive.ServiceCreatePxDocToken.generate();

        String url = ApexPages.currentPage().getParameters().get('url');
        pxdocUrl = EncodingUtil.urlDecode(url, 'utf-8');

        return null;
    }

    /**
     * サンプル(2)
     */
    public Pagereference doBootPxDoc_02() {
        // pxdocLicEndPoint, pxdocToken はPxDoc3を起動する上で必要な接続情報になります
        pxdocLicEndPoint = printdrive.ServiceCreatePxDocLicUrl.generate();
        pxdocToken = printdrive.ServiceCreatePxDocToken.generate();

        List<Account> accs = [Select Name From Account limit 1];
        if (accs.isEmpty()) {
            pxdocUrl = '/apex/PxDoc_Sample';
        } else {
            pxdocUrl = '/apex/PxDoc_Sample?aid=' + accs[0].Id;
        }

        return null;
    }



}
