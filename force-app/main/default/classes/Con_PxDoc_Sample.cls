public with sharing class Con_PxDoc_Sample {

    public List<String> lineTexts {get; private set;}
    public String multiLineText {get; private set;}
    public String accSampleName {get; private set;}


    public Con_PxDoc_Sample() {
        String aid = ApexPages.currentPage().getParameters().get('aid');

        init(aid);
    }

    private void init(String aid) {

      lineTexts = new List<String>{
          '半角文字は1,全角文字は2としてカウントして、適当な長さで区切ります。  ダブルスペースで改行します。!"#$%& @" * + ? ¥¥¥¥ (==)<<>>  右端、下端に合わせて出力しています。',
          '上端、下端、中央揃え、左端、右端、中央揃えを指定できます。'
      };

      multiLineText = 'テキストエリアなど、\n改行コードを含むテキストに対する自動改行コンポーネントです。\n適当な長さで切りつつ、自動改行するものになります。また、指定した行数を超えた場合はそれ以上出力しないようになります。';

      accSampleName = '';
      if (String.isNotBlank(aid)) {
          List<Account> accs = [Select Name From Account Where Id = :aid];
          if (!accs.isEmpty()) {
            accSampleName = accs[0].Name;
          }
      }

    }

}
