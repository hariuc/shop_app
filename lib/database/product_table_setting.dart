class ProductTableSetting {
  static const String tableName = 'product';

  static const String id = 'id';
  static const String name = 'name';
  static const String details = 'details';
  static const String size = 'size';
  static const String colour = 'colour';
  static const String price = 'price';
  static const String sold_count = 'sold_count';
  static const String category = 'category';
  static const String images = 'images';

  static String createProductTable() {
    final strBuffer = StringBuffer();

    strBuffer.write("CREATE TABLE $tableName (");
    strBuffer.write("${id} INTEGER PRIMARY KEY NOT NULL, ");
    strBuffer.write("${name} VARCHAR(500) NOT NULL, ");
    strBuffer.write("${details} TEXT NOT NULL, ");
    strBuffer.write("${size} VARCHAR(50) NOT NULL, ");
    strBuffer.write("${colour} VARCHAR(100) NOT NULL, ");
    strBuffer.write("${price} REAL NOT NULL, ");
    strBuffer.write("${images} TEXT, ");
    strBuffer.write("${category} TEXT, ");
    strBuffer.write("${sold_count} INTEGER NOT NULL )");

    return strBuffer.toString();
  }

  //SELECT * FROM product
  static String getAllProduct() => 'SELECT * FROM $tableName';
}
