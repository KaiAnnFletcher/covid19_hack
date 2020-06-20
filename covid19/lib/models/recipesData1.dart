class RecipesData {
  List<Recipes> recipes;

  RecipesData({this.recipes});

  RecipesData.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = new List<Recipes>();
      json['recipes'].forEach((v) {
        recipes.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  bool ketogenic;
  bool whole30;
  int servings;
  int preparationMinutes;
  int cookingMinutes;
  String sourceUrl;
  String spoonacularSourceUrl;
  int aggregateLikes;
  String creditText;
  String sourceName;
  List<ExtendedIngredients> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  String image;
  String imageType;
  String instructions;

  Recipes(
      {this.vegetarian,
      this.vegan,
      this.glutenFree,
      this.dairyFree,
      this.veryHealthy,
      this.cheap,
      this.veryPopular,
      this.sustainable,
      this.weightWatcherSmartPoints,
      this.gaps,
      this.lowFodmap,
      this.ketogenic,
      this.whole30,
      this.servings,
      this.preparationMinutes,
      this.cookingMinutes,
      this.sourceUrl,
      this.spoonacularSourceUrl,
      this.aggregateLikes,
      this.creditText,
      this.sourceName,
      this.extendedIngredients,
      this.id,
      this.title,
      this.readyInMinutes,
      this.image,
      this.imageType,
      this.instructions});

  Recipes.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    lowFodmap = json['lowFodmap'];
    ketogenic = json['ketogenic'];
    whole30 = json['whole30'];
    servings = json['servings'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    sourceUrl = json['sourceUrl'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
    aggregateLikes = json['aggregateLikes'];
    creditText = json['creditText'];
    sourceName = json['sourceName'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = new List<ExtendedIngredients>();
      json['extendedIngredients'].forEach((v) {
        extendedIngredients.add(new ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    image = json['image'];
    imageType = json['imageType'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vegetarian'] = this.vegetarian;
    data['vegan'] = this.vegan;
    data['glutenFree'] = this.glutenFree;
    data['dairyFree'] = this.dairyFree;
    data['veryHealthy'] = this.veryHealthy;
    data['cheap'] = this.cheap;
    data['veryPopular'] = this.veryPopular;
    data['sustainable'] = this.sustainable;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['gaps'] = this.gaps;
    data['lowFodmap'] = this.lowFodmap;
    data['ketogenic'] = this.ketogenic;
    data['whole30'] = this.whole30;
    data['servings'] = this.servings;
    data['preparationMinutes'] = this.preparationMinutes;
    data['cookingMinutes'] = this.cookingMinutes;
    data['sourceUrl'] = this.sourceUrl;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    data['aggregateLikes'] = this.aggregateLikes;
    data['creditText'] = this.creditText;
    data['sourceName'] = this.sourceName;
    if (this.extendedIngredients != null) {
      data['extendedIngredients'] =
          this.extendedIngredients.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['instructions'] = this.instructions;
    return data;
  }
}

class ExtendedIngredients {
  int id;
  String aisle;
  String image;
  String name;
  double amount;
  String unit;
  String unitShort;
  String unitLong;
  String originalString;
  List<String> metaInformation;

  ExtendedIngredients(
      {this.id,
      this.aisle,
      this.image,
      this.name,
      this.amount,
      this.unit,
      this.unitShort,
      this.unitLong,
      this.originalString,
      this.metaInformation});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aisle = json['aisle'];
    image = json['image'];
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
    originalString = json['originalString'];
    metaInformation = json['metaInformation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aisle'] = this.aisle;
    data['image'] = this.image;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['unitShort'] = this.unitShort;
    data['unitLong'] = this.unitLong;
    data['originalString'] = this.originalString;
    data['metaInformation'] = this.metaInformation;
    return data;
  }
}

// Future<RecipesData> fetchRecipesData() async {
//   final response = await http.get('https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?diet=vegetarian&excludeIngredients=coconut&intolerances=egg%252C%20gluten&number=10&offset=0&type=main%20course&query=burger',
//   headers: {HttpHeaders.authorizationHeader: "0b6d4040a6msh8925aeab92fa3b4p142c2ajsnc82bcee5674c"},
//   );

//   print(json.decode(response.body).cast<Map<String, dynamic>>());
//   debugPrint(response.body[1]);
//   if (response.statusCode == 200) {
//     return RecipesData.fromJson(json.decode(response.body[1]));
//   }
//   else {
//     throw Exception('Failed to load Recipes data');
//   }
//   }
