class Module {
  List<MainModul>? mainModul;

  Module({this.mainModul});

  Module.fromJson(Map<String, dynamic> json) {
    if (json['main_modul'] != null) {
      mainModul = <MainModul>[];
      json['main_modul'].forEach((v) {
        mainModul!.add(new MainModul.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainModul != null) {
      data['main_modul'] = this.mainModul!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainModul {
  List<MainStickyMenu>? mainStickyMenu;
  List<OfferCodeBanner>? offerCodeBanner;
  String? status;
  String? message;
  List<Category>? category;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  List<RangeOfPattern>? rangeOfPattern;
  List<DesignOccasion>? designOccasion;

  MainModul(
      {this.mainStickyMenu,
      this.offerCodeBanner,
      this.status,
      this.message,
      this.category,
      this.unstitched,
      this.boutiqueCollection,
      this.rangeOfPattern,
      this.designOccasion});

  MainModul.fromJson(Map<String, dynamic> json) {
    if (json['main_sticky_menu'] != null) {
      mainStickyMenu = <MainStickyMenu>[];
      json['main_sticky_menu'].forEach((v) {
        mainStickyMenu!.add(new MainStickyMenu.fromJson(v));
      });
    }
    if (json['offer_code_banner'] != null) {
      offerCodeBanner = <OfferCodeBanner>[];
      json['offer_code_banner'].forEach((v) {
        offerCodeBanner!.add(new OfferCodeBanner.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['Unstitched'] != null) {
      unstitched = <Unstitched>[];
      json['Unstitched'].forEach((v) {
        unstitched!.add(new Unstitched.fromJson(v));
      });
    }
    if (json['boutique_collection'] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json['boutique_collection'].forEach((v) {
        boutiqueCollection!.add(new BoutiqueCollection.fromJson(v));
      });
    }
    if (json['range_of_pattern'] != null) {
      rangeOfPattern = <RangeOfPattern>[];
      json['range_of_pattern'].forEach((v) {
        rangeOfPattern!.add(new RangeOfPattern.fromJson(v));
      });
    }
    if (json['design_occasion'] != null) {
      designOccasion = <DesignOccasion>[];
      json['design_occasion'].forEach((v) {
        designOccasion!.add(new DesignOccasion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainStickyMenu != null) {
      data['main_sticky_menu'] =
          this.mainStickyMenu!.map((v) => v.toJson()).toList();
    }
    if (this.offerCodeBanner != null) {
      data['offer_code_banner'] =
          this.offerCodeBanner!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.unstitched != null) {
      data['Unstitched'] = this.unstitched!.map((v) => v.toJson()).toList();
    }
    if (this.boutiqueCollection != null) {
      data['boutique_collection'] =
          this.boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    if (this.rangeOfPattern != null) {
      data['range_of_pattern'] =
          this.rangeOfPattern!.map((v) => v.toJson()).toList();
    }
    if (this.designOccasion != null) {
      data['design_occasion'] =
          this.designOccasion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainStickyMenu {
  String? title;
  String? image;
  String? sortOrder;
  List<SliderImages>? sliderImages;

  MainStickyMenu({this.title, this.image, this.sortOrder, this.sliderImages});

  MainStickyMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(new SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    if (this.sliderImages != null) {
      data['slider_images'] =
          this.sliderImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderImages {
  String? title;
  String? image;
  String? sortOrder;
  String? cta;

  SliderImages({this.title, this.image, this.sortOrder, this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    data['cta'] = this.cta;
    return data;
  }
}

class OfferCodeBanner {
  String? bannerImage;
  String? type;

  OfferCodeBanner({this.bannerImage, this.type});

  OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['type'] = this.type;
    return data;
  }
}

class Category {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  Category(
      {this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['tint_color'] = this.tintColor;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}

class Unstitched {
  String? rangeId;
  String? name;
  String? image;

  Unstitched({this.rangeId, this.name, this.image});

  Unstitched.fromJson(Map<String, dynamic> json) {
    rangeId = json['range_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_id'] = this.rangeId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class BoutiqueCollection {
  String? bannerImage;
  String? bannerType;
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.bannerType, this.bannerId});

  BoutiqueCollection.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    bannerType = json['banner_type'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['banner_type'] = this.bannerType;
    data['banner_id'] = this.bannerId;
    return data;
  }
}

class RangeOfPattern {
  String? productId;
  String? image;
  String? name;

  RangeOfPattern({this.productId, this.image, this.name});

  RangeOfPattern.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class DesignOccasion {
  String? productId;
  String? name;
  String? image;
  String? subName;
  String? cta;

  DesignOccasion(
      {this.productId, this.name, this.image, this.subName, this.cta});

  DesignOccasion.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    subName = json['sub_name'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sub_name'] = this.subName;
    data['cta'] = this.cta;
    return data;
  }
}
