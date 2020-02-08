class ComicEntity {
	ComicCreators creators;
	int issueNumber;
	String isbn;
	String description;
	List<Null> variants;
	String title;
	String diamondCode;
	ComicCharacters characters;
	List<ComicUrl> urls;
	String ean;
	List<Null> collections;
	String modified;
	int id;
	List<ComicPrice> prices;
	ComicEvents events;
	List<Null> collectedIssues;
	int pageCount;
	ComicThumbnail thumbnail;
	List<ComicImage> images;
	ComicStories stories;
	List<ComicTextobject> textObjects;
	int digitalId;
	String format;
	String upc;
	List<ComicDate> dates;
	String resourceURI;
	String variantDescription;
	String issn;
	ComicSeries series;

	ComicEntity({this.creators, this.issueNumber, this.isbn, this.description, this.variants, this.title, this.diamondCode, this.characters, this.urls, this.ean, this.collections, this.modified, this.id, this.prices, this.events, this.collectedIssues, this.pageCount, this.thumbnail, this.images, this.stories, this.textObjects, this.digitalId, this.format, this.upc, this.dates, this.resourceURI, this.variantDescription, this.issn, this.series});

	ComicEntity.fromJson(Map<String, dynamic> json) {
		creators = json['creators'] != null ? new ComicCreators.fromJson(json['creators']) : null;
		issueNumber = json['issueNumber'];
		isbn = json['isbn'];
		description = json['description'];
		if (json['variants'] != null) {
			variants = new List<Null>();
		}
		title = json['title'];
		diamondCode = json['diamondCode'];
		characters = json['characters'] != null ? new ComicCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<ComicUrl>();(json['urls'] as List).forEach((v) { urls.add(new ComicUrl.fromJson(v)); });
		}
		ean = json['ean'];
		if (json['collections'] != null) {
			collections = new List<Null>();
		}
		modified = json['modified'];
		id = json['id'];
		if (json['prices'] != null) {
			prices = new List<ComicPrice>();(json['prices'] as List).forEach((v) { prices.add(new ComicPrice.fromJson(v)); });
		}
		events = json['events'] != null ? new ComicEvents.fromJson(json['events']) : null;
		if (json['collectedIssues'] != null) {
			collectedIssues = new List<Null>();
		}
		pageCount = json['pageCount'];
		thumbnail = json['thumbnail'] != null ? new ComicThumbnail.fromJson(json['thumbnail']) : null;
		if (json['images'] != null) {
			images = new List<ComicImage>();(json['images'] as List).forEach((v) { images.add(new ComicImage.fromJson(v)); });
		}
		stories = json['stories'] != null ? new ComicStories.fromJson(json['stories']) : null;
		if (json['textObjects'] != null) {
			textObjects = new List<ComicTextobject>();(json['textObjects'] as List).forEach((v) { textObjects.add(new ComicTextobject.fromJson(v)); });
		}
		digitalId = json['digitalId'];
		format = json['format'];
		upc = json['upc'];
		if (json['dates'] != null) {
			dates = new List<ComicDate>();(json['dates'] as List).forEach((v) { dates.add(new ComicDate.fromJson(v)); });
		}
		resourceURI = json['resourceURI'];
		variantDescription = json['variantDescription'];
		issn = json['issn'];
		series = json['series'] != null ? new ComicSeries.fromJson(json['series']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
		data['issueNumber'] = this.issueNumber;
		data['isbn'] = this.isbn;
		data['description'] = this.description;
		if (this.variants != null) {
      data['variants'] =  [];
    }
		data['title'] = this.title;
		data['diamondCode'] = this.diamondCode;
		if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		data['ean'] = this.ean;
		if (this.collections != null) {
      data['collections'] =  [];
    }
		data['modified'] = this.modified;
		data['id'] = this.id;
		if (this.prices != null) {
      data['prices'] =  this.prices.map((v) => v.toJson()).toList();
    }
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		if (this.collectedIssues != null) {
      data['collectedIssues'] =  [];
    }
		data['pageCount'] = this.pageCount;
		if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
		if (this.images != null) {
      data['images'] =  this.images.map((v) => v.toJson()).toList();
    }
		if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
		if (this.textObjects != null) {
      data['textObjects'] =  this.textObjects.map((v) => v.toJson()).toList();
    }
		data['digitalId'] = this.digitalId;
		data['format'] = this.format;
		data['upc'] = this.upc;
		if (this.dates != null) {
      data['dates'] =  this.dates.map((v) => v.toJson()).toList();
    }
		data['resourceURI'] = this.resourceURI;
		data['variantDescription'] = this.variantDescription;
		data['issn'] = this.issn;
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		return data;
	}
}

class ComicCreators {
	String collectionURI;
	int available;
	int returned;
	List<ComicCreatorsItem> items;

	ComicCreators({this.collectionURI, this.available, this.returned, this.items});

	ComicCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new ComicCreatorsItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['collectionURI'] = this.collectionURI;
		data['available'] = this.available;
		data['returned'] = this.returned;
		if (this.items != null) {
      data['items'] =  this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ComicCreatorsItem {
	String role;
	String name;
	String resourceURI;

	ComicCreatorsItem({this.role, this.name, this.resourceURI});

	ComicCreatorsItem.fromJson(Map<String, dynamic> json) {
		role = json['role'];
		name = json['name'];
		resourceURI = json['resourceURI'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['role'] = this.role;
		data['name'] = this.name;
		data['resourceURI'] = this.resourceURI;
		return data;
	}
}

class ComicCharacters {
	String collectionURI;
	int available;
	int returned;
	List<ComicCharactersItem> items;

	ComicCharacters({this.collectionURI, this.available, this.returned, this.items});

	ComicCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicCharactersItem>();(json['items'] as List).forEach((v) { items.add(new ComicCharactersItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['collectionURI'] = this.collectionURI;
		data['available'] = this.available;
		data['returned'] = this.returned;
		if (this.items != null) {
      data['items'] =  this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ComicCharactersItem {
	String name;
	String resourceURI;

	ComicCharactersItem({this.name, this.resourceURI});

	ComicCharactersItem.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		resourceURI = json['resourceURI'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['resourceURI'] = this.resourceURI;
		return data;
	}
}

class ComicUrl {
	String type;
	String url;

	ComicUrl({this.type, this.url});

	ComicUrl.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this.type;
		data['url'] = this.url;
		return data;
	}
}

class ComicPrice {
	int price;
	String type;

	ComicPrice({this.price, this.type});

	ComicPrice.fromJson(Map<String, dynamic> json) {
		price = json['price'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['price'] = this.price;
		data['type'] = this.type;
		return data;
	}
}

class ComicEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	ComicEvents({this.collectionURI, this.available, this.returned, this.items});

	ComicEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['collectionURI'] = this.collectionURI;
		data['available'] = this.available;
		data['returned'] = this.returned;
		if (this.items != null) {
      data['items'] =  [];
    }
		return data;
	}
}

class ComicThumbnail {
	String path;
	String extension;

	ComicThumbnail({this.path, this.extension});

	ComicThumbnail.fromJson(Map<String, dynamic> json) {
		path = json['path'];
		extension = json['extension'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['path'] = this.path;
		data['extension'] = this.extension;
		return data;
	}
}

class ComicImage {
	String path;
	String extension;

	ComicImage({this.path, this.extension});

	ComicImage.fromJson(Map<String, dynamic> json) {
		path = json['path'];
		extension = json['extension'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['path'] = this.path;
		data['extension'] = this.extension;
		return data;
	}
}

class ComicStories {
	String collectionURI;
	int available;
	int returned;
	List<ComicStoriesItem> items;

	ComicStories({this.collectionURI, this.available, this.returned, this.items});

	ComicStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicStoriesItem>();(json['items'] as List).forEach((v) { items.add(new ComicStoriesItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['collectionURI'] = this.collectionURI;
		data['available'] = this.available;
		data['returned'] = this.returned;
		if (this.items != null) {
      data['items'] =  this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ComicStoriesItem {
	String name;
	String resourceURI;
	String type;

	ComicStoriesItem({this.name, this.resourceURI, this.type});

	ComicStoriesItem.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		resourceURI = json['resourceURI'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['resourceURI'] = this.resourceURI;
		data['type'] = this.type;
		return data;
	}
}

class ComicTextobject {
	String language;
	String text;
	String type;

	ComicTextobject({this.language, this.text, this.type});

	ComicTextobject.fromJson(Map<String, dynamic> json) {
		language = json['language'];
		text = json['text'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['language'] = this.language;
		data['text'] = this.text;
		data['type'] = this.type;
		return data;
	}
}

class ComicDate {
	String date;
	String type;

	ComicDate({this.date, this.type});

	ComicDate.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['type'] = this.type;
		return data;
	}
}

class ComicSeries {
	String name;
	String resourceURI;

	ComicSeries({this.name, this.resourceURI});

	ComicSeries.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		resourceURI = json['resourceURI'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['resourceURI'] = this.resourceURI;
		return data;
	}
}
