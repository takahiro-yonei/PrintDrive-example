public with sharing class ConPxDoc_Image {

    private static Map<String, Blob> staticResourceMap = new Map<String, Blob>();

    private String resourceName;
    private Decimal x;
    private Decimal y;
    private Decimal width;
    private String id;


    public void setResourceBodyByBase64(String str) {
        resourceName = str;
    }
    public String getResourceBodyByBase64() {

        if(String.isBlank(resourceName)){
            return '';
        }

        Blob retval = null;
        if(staticResourceMap.containsKey(resourceName)) {
            retval = staticResourceMap.get(resourceName);
        } else {
            List<StaticResource> srs = [Select Body From StaticResource Where Name = :resourceName];
            if(srs.isEmpty()){
                retval = null;
            } else {
                StaticResource sr = srs[0];
                retval = sr.Body;
            }
            staticResourceMap.put(resourceName, retval);
        }

        if(retval == null) {
            return '';
        }

        return EncodingUtil.base64Encode(retval);
    }

    public void setBaseX(Decimal d) {
        x = (d == null) ? 0 : d;
    }
    public Decimal getBaseX() {
        return x;
    }
    public void setBaseY(Decimal d) {
        y = (d == null) ? 0 : d;
    }
    public Decimal getBaseY() {
        return y;
    }
    public void setBaseWidth(Decimal d) {
        width = (d == null) ? 0 : d;
    }
    public Decimal getBaseWidth() {
        return width;
    }

    public void setBaseId(String s) {
        id = s;
    }
    public String getBaseId() {
        return id;
    }
}
