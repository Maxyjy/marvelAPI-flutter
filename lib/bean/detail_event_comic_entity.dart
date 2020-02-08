class DetailEventComicEntity {
	String copyright;
	int code;
	DetailEventComicData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailEventComicEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailEventComicEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailEventComicData.fromJson(json['data']) : null;
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

class DetailEventComicData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailEventComicDataResult> results;

	DetailEventComicData({this.total, this.offset, this.limit, this.count, this.results});

	DetailEventComicData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailEventComicDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailEventComicDataResult.fromJson(v)); });
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

class DetailEventComicDataResult {
	DetailEventComicDataResultsCreators creators;
	var issueNumber;
	String isbn;
	String description;
	List<Null> variants;
	String title;
	String diamondCode;
	DetailEventComicDataResultsCharacters characters;
	List<DetailEventComicDataResultsUrl> urls;
	String ean;
	List<DetailEventComicDataResultsCollection> collections;
	String modified;
	int id;
	List<DetailEventComicDataResultsPrice> prices;
	DetailEventComicDataResultsEvents events;
	List<Null> collectedIssues;
	int pageCount;
	DetailEventComicDataResultsThumbnail thumbnail;
	List<DetailEventComicDataResultsImage> images;
	DetailEventComicDataResultsStories stories;
	List<DetailEventComicDataResultsTextobject> textObjects;
	int digitalId;
	String format;
	String upc;
	List<DetailEventComicDataResultsDate> dates;
	String resourceURI;
	String variantDescription;
	String issn;
	DetailEventComicDataResultsSeries series;

	DetailEventComicDataResult({this.creators, this.issueNumber, this.isbn, this.description, this.variants, this.title, this.diamondCode, this.characters, this.urls, this.ean, this.collections, this.modified, this.id, this.prices, this.events, this.collectedIssues, this.pageCount, this.thumbnail, this.images, this.stories, this.textObjects, this.digitalId, this.format, this.upc, this.dates, this.resourceURI, this.variantDescription, this.issn, this.series});

	DetailEventComicDataResult.fromJson(Map<String, dynamic> json) {
		creators = json['creators'] != null ? new DetailEventComicDataResultsCreators.fromJson(json['creators']) : null;
		issueNumber = json['issueNumber'];
		isbn = json['isbn'];
		description = json['description'];
		if (json['variants'] != null) {
			variants = new List<Null>();
		}
		title = json['title'];
		diamondCode = json['diamondCode'];
		characters = json['characters'] != null ? new DetailEventComicDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailEventComicDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailEventComicDataResultsUrl.fromJson(v)); });
		}
		ean = json['ean'];
		if (json['collections'] != null) {
			collections = new List<DetailEventComicDataResultsCollection>();(json['collections'] as List).forEach((v) { collections.add(new DetailEventComicDataResultsCollection.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		if (json['prices'] != null) {
			prices = new List<DetailEventComicDataResultsPrice>();(json['prices'] as List).forEach((v) { prices.add(new DetailEventComicDataResultsPrice.fromJson(v)); });
		}
		events = json['events'] != null ? new DetailEventComicDataResultsEvents.fromJson(json['events']) : null;
		if (json['collectedIssues'] != null) {
			collectedIssues = new List<Null>();
		}
		pageCount = json['pageCount'];
		thumbnail = json['thumbnail'] != null ? new DetailEventComicDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['images'] != null) {
			images = new List<DetailEventComicDataResultsImage>();(json['images'] as List).forEach((v) { images.add(new DetailEventComicDataResultsImage.fromJson(v)); });
		}
		stories = json['stories'] != null ? new DetailEventComicDataResultsStories.fromJson(json['stories']) : null;
		if (json['textObjects'] != null) {
			textObjects = new List<DetailEventComicDataResultsTextobject>();(json['textObjects'] as List).forEach((v) { textObjects.add(new DetailEventComicDataResultsTextobject.fromJson(v)); });
		}
		digitalId = json['digitalId'];
		format = json['format'];
		upc = json['upc'];
		if (json['dates'] != null) {
			dates = new List<DetailEventComicDataResultsDate>();(json['dates'] as List).forEach((v) { dates.add(new DetailEventComicDataResultsDate.fromJson(v)); });
		}
		resourceURI = json['resourceURI'];
		variantDescription = json['variantDescription'];
		issn = json['issn'];
		series = json['series'] != null ? new DetailEventComicDataResultsSeries.fromJson(json['series']) : null;
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
      data['collections'] =  this.collections.map((v) => v.toJson()).toList();
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

class DetailEventComicDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventComicDataResultsCreatorsItem> items;

	DetailEventComicDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	DetailEventComicDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventComicDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventComicDataResultsCreatorsItem.fromJson(v)); });
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

class DetailEventComicDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	DetailEventComicDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	DetailEventComicDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventComicDataResultsCharactersItem> items;

	DetailEventComicDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	DetailEventComicDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventComicDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventComicDataResultsCharactersItem.fromJson(v)); });
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

class DetailEventComicDataResultsCharactersItem {
	String name;
	String resourceURI;

	DetailEventComicDataResultsCharactersItem({this.name, this.resourceURI});

	DetailEventComicDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsUrl {
	String type;
	String url;

	DetailEventComicDataResultsUrl({this.type, this.url});

	DetailEventComicDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsCollection {
	String name;
	String resourceURI;

	DetailEventComicDataResultsCollection({this.name, this.resourceURI});

	DetailEventComicDataResultsCollection.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsPrice {
	var price;
	String type;

	DetailEventComicDataResultsPrice({this.price, this.type});

	DetailEventComicDataResultsPrice.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventComicDataResultsEventsItem> items;

	DetailEventComicDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailEventComicDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventComicDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventComicDataResultsEventsItem.fromJson(v)); });
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

class DetailEventComicDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailEventComicDataResultsEventsItem({this.name, this.resourceURI});

	DetailEventComicDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsThumbnail {
	String path;
	String extension;

	DetailEventComicDataResultsThumbnail({this.path, this.extension});

	DetailEventComicDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsImage {
	String path;
	String extension;

	DetailEventComicDataResultsImage({this.path, this.extension});

	DetailEventComicDataResultsImage.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventComicDataResultsStoriesItem> items;

	DetailEventComicDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailEventComicDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventComicDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventComicDataResultsStoriesItem.fromJson(v)); });
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

class DetailEventComicDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailEventComicDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailEventComicDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsTextobject {
	String language;
	String text;
	String type;

	DetailEventComicDataResultsTextobject({this.language, this.text, this.type});

	DetailEventComicDataResultsTextobject.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsDate {
	String date;
	String type;

	DetailEventComicDataResultsDate({this.date, this.type});

	DetailEventComicDataResultsDate.fromJson(Map<String, dynamic> json) {
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

class DetailEventComicDataResultsSeries {
	String name;
	String resourceURI;

	DetailEventComicDataResultsSeries({this.name, this.resourceURI});

	DetailEventComicDataResultsSeries.fromJson(Map<String, dynamic> json) {
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
