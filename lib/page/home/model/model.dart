class JumbotronModel {
  final String jumbotronImg;
  final String jumbotronText;

  JumbotronModel(this.jumbotronImg, this.jumbotronText);
}

class ProdukPopulerModel {
  final String ProdukPopulerImg;
  final String ProdukPopulertext;
  final String ProdukPopulerSubText;
  final int ProdukPopulerHarga;

  ProdukPopulerModel(
    this.ProdukPopulerImg,
    this.ProdukPopulertext,
    this.ProdukPopulerSubText,
    this.ProdukPopulerHarga,
  );
}

class KoleksiModel {
  final String KoleksiImg;
  final int KoleksiColor;
  final String KoleksiText;
  final String KoleksiSubText;

  KoleksiModel(
    this.KoleksiImg,
    this.KoleksiColor,
    this.KoleksiText,
    this.KoleksiSubText,
  );
}
