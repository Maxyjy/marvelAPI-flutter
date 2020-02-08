class DetailSeriesComicEntity {
	String copyright;
	int code;
	DetailSeriesComicData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailSeriesComicEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailSeriesComicEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailSeriesComicData.fromJson(json['data']) : null;
		attributionHTML = json['attributionHTML'];
		attributionText = json['attributionText'];
		etag = json['etag'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['copyright'] = this.copyright;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['attributionHTML'] = this.attributionHTML;
		data['attributionText'] = this.attributionText;
		data['etag'] = this.etag;
		data['status'] = this.status;
		return data;
	}
}

class DetailSeriesComicData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailSeriesComicDataResult> results;

	DetailSeriesComicData({this.total, this.offset, this.limit, this.count, this.results});

	DetailSeriesComicData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailSeriesComicDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailSeriesComicDataResult.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['offset'] = this.offset;
		data['limit'] = this.limit;
		data['count'] = this.count;
		if (this.results != null) {
      data['results'] =  this.results.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class DetailSeriesComicDataResult {
	DetailSeriesComicDataResultsCreators creators;
	var issueNumber;
	String isbn;
	String description;
	List<Null> variants;
	String title;
	String diamondCode;
	DetailSeriesComicDataResultsCharacters characters;
	List<DetailSeriesComicDataResultsUrl> urls;
	String ean;
	List<Null> collections;
	String modified;
	int id;
	List<DetailSeriesComicDataResultsPrice> prices;
	DetailSeriesComicDataResultsEvents events;
	List<Null> collectedIssues;
	int pageCount;
	DetailSeriesComicDataResultsThumbnail thumbnail;
	List<DetailSeriesComicDataResultsImage> images;
	DetailSeriesComicDataResultsStories stories;
	List<DetailSeriesComicDataResultsTextobject> textObjects;
	int digitalId;
	String format;
	String upc;
	List<DetailSeriesComicDataResultsDate> dates;
	String resourceURI;
	String variantDescription;
	String issn;
	DetailSeriesComicDataResultsSeries series;

	DetailSeriesComicDataResult({this.creators, this.issueNumber, this.isbn, this.description, this.variants, this.title, this.diamondCode, this.characters, this.urls, this.ean, this.collections, this.modified, this.id, this.prices, this.events, this.collectedIssues, this.pageCount, this.thumbnail, this.images, this.stories, this.textObjects, this.digitalId, this.format, this.upc, this.dates, this.resourceURI, this.variantDescription, this.issn, this.series});

	DetailSeriesComicDataResult.fromJson(Map<String, dynamic> json) {
		creators = json['creators'] != null ? new DetailSeriesComicDataResultsCreators.fromJson(json['creators']) : null;
		issueNumber = json['issueNumber'];
		isbn = json['isbn'];
		description = json['description'];
		if (json['variants'] != null) {
			variants = new List<Null>();
		}
		title = json['title'];
		diamondCode = json['diamondCode'];
		characters = json['characters'] != null ? new DetailSeriesComicDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailSeriesComicDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailSeriesComicDataResultsUrl.fromJson(v)); });
		}
		ean = json['ean'];
		if (json['collections'] != null) {
			collections = new List<Null>();
		}
		modified = json['modified'];
		id = json['id'];
		if (json['prices'] != null) {
			prices = new List<DetailSeriesComicDataResultsPrice>();(json['prices'] as List).forEach((v) { prices.add(new DetailSeriesComicDataResultsPrice.fromJson(v)); });
		}
		events = json['events'] != null ? new DetailSeriesComicDataResultsEvents.fromJson(json['events']) : null;
		if (json['collectedIssues'] != null) {
			collectedIssues = new List<Null>();
		}
		pageCount = json['pageCount'];
		thumbnail = json['thumbnail'] != null ? new DetailSeriesComicDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['images'] != null) {
			images = new List<DetailSeriesComicDataResultsImage>();(json['images'] as List).forEach((v) { images.add(new DetailSeriesComicDataResultsImage.fromJson(v)); });
		}
		stories = json['stories'] != null ? new DetailSeriesComicDataResultsStories.fromJson(json['stories']) : null;
		if (json['textObjects'] != null) {
			textObjects = new List<DetailSeriesComicDataResultsTextobject>();(json['textObjects'] as List).forEach((v) { textObjects.add(new DetailSeriesComicDataResultsTextobject.fromJson(v)); });
		}
		digitalId = json['digitalId'];
		format = json['format'];
		upc = json['upc'];
		if (json['dates'] != null) {
			dates = new List<DetailSeriesComicDataResultsDate>();(json['dates'] as List).forEach((v) { dates.add(new DetailSeriesComicDataResultsDate.fromJson(v)); });
		}
		resourceURI = json['resourceURI'];
		variantDescription = json['variantDescription'];
		issn = json['issn'];
		series = json['series'] != null ? new DetailSeriesComicDataResultsSeries.fromJson(json['series']) : null;
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

class DetailSeriesComicDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	DetailSeriesComicDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesComicDataResultsCreators.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesComicDataResultsCharactersItem> items;

	DetailSeriesComicDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesComicDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesComicDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesComicDataResultsCharactersItem.fromJson(v)); });
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

class DetailSeriesComicDataResultsCharactersItem {
	String name;
	String resourceURI;

	DetailSeriesComicDataResultsCharactersItem({this.name, this.resourceURI});

	DetailSeriesComicDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsUrl {
	String type;
	String url;

	DetailSeriesComicDataResultsUrl({this.type, this.url});

	DetailSeriesComicDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsPrice {
	var price;
	String type;

	DetailSeriesComicDataResultsPrice({this.price, this.type});

	DetailSeriesComicDataResultsPrice.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	DetailSeriesComicDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesComicDataResultsEvents.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsThumbnail {
	String path;
	String extension;

	DetailSeriesComicDataResultsThumbnail({this.path, this.extension});

	DetailSeriesComicDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsImage {
	String path;
	String extension;

	DetailSeriesComicDataResultsImage({this.path, this.extension});

	DetailSeriesComicDataResultsImage.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesComicDataResultsStoriesItem> items;

	DetailSeriesComicDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesComicDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesComicDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesComicDataResultsStoriesItem.fromJson(v)); });
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

class DetailSeriesComicDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailSeriesComicDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailSeriesComicDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsTextobject {
	String language;
	String text;
	String type;

	DetailSeriesComicDataResultsTextobject({this.language, this.text, this.type});

	DetailSeriesComicDataResultsTextobject.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsDate {
	String date;
	String type;

	DetailSeriesComicDataResultsDate({this.date, this.type});

	DetailSeriesComicDataResultsDate.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesComicDataResultsSeries {
	String name;
	String resourceURI;

	DetailSeriesComicDataResultsSeries({this.name, this.resourceURI});

	DetailSeriesComicDataResultsSeries.fromJson(Map<String, dynamic> json) {
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
