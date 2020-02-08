class ComicDataEntity {
	String copyright;
	int code;
	ComicDataData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	ComicDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	ComicDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new ComicDataData.fromJson(json['data']) : null;
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

class ComicDataData {
	int total;
	int offset;
	int limit;
	int count;
	List<ComicDataDataResult> results;

	ComicDataData({this.total, this.offset, this.limit, this.count, this.results});

	ComicDataData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<ComicDataDataResult>();(json['results'] as List).forEach((v) { results.add(new ComicDataDataResult.fromJson(v)); });
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

class ComicDataDataResult {
	ComicDataDataResultsCreators creators;
	var issueNumber;
	String isbn;
	String description;
	List<Null> variants;
	String title;
	String diamondCode;
	ComicDataDataResultsCharacters characters;
	List<ComicDataDataResultsUrl> urls;
	String ean;
	List<Null> collections;
	String modified;
	int id;
	List<ComicDataDataResultsPrice> prices;
	ComicDataDataResultsEvents events;
	List<Null> collectedIssues;
	int pageCount;
	ComicDataDataResultsThumbnail thumbnail;
	List<ComicDataDataResultsImage> images;
	ComicDataDataResultsStories stories;
	List<ComicDataDataResultsTextobject> textObjects;
	int digitalId;
	String format;
	String upc;
	List<ComicDataDataResultsDate> dates;
	String resourceURI;
	String variantDescription;
	String issn;
	ComicDataDataResultsSeries series;

	ComicDataDataResult({this.creators, this.issueNumber, this.isbn, this.description, this.variants, this.title, this.diamondCode, this.characters, this.urls, this.ean, this.collections, this.modified, this.id, this.prices, this.events, this.collectedIssues, this.pageCount, this.thumbnail, this.images, this.stories, this.textObjects, this.digitalId, this.format, this.upc, this.dates, this.resourceURI, this.variantDescription, this.issn, this.series});

	ComicDataDataResult.fromJson(Map<String, dynamic> json) {
		creators = json['creators'] != null ? new ComicDataDataResultsCreators.fromJson(json['creators']) : null;
		issueNumber = json['issueNumber'];
		isbn = json['isbn'];
		if(json['description']!=null) {
			description = json['description'];
		}else{
			description ='';
		}
		if (json['variants'] != null) {
			variants = new List<Null>();
		}
		title = json['title'];
		diamondCode = json['diamondCode'];
		characters = json['characters'] != null ? new ComicDataDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<ComicDataDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new ComicDataDataResultsUrl.fromJson(v)); });
		}
		ean = json['ean'];
		if (json['collections'] != null) {
			collections = new List<Null>();
		}
		modified = json['modified'];
		id = json['id'];
		if (json['prices'] != null) {
			prices = new List<ComicDataDataResultsPrice>();(json['prices'] as List).forEach((v) { prices.add(new ComicDataDataResultsPrice.fromJson(v)); });
		}
		events = json['events'] != null ? new ComicDataDataResultsEvents.fromJson(json['events']) : null;
		if (json['collectedIssues'] != null) {
			collectedIssues = new List<Null>();
		}
		pageCount = json['pageCount'];
		thumbnail = json['thumbnail'] != null ? new ComicDataDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['images'] != null) {
			images = new List<ComicDataDataResultsImage>();(json['images'] as List).forEach((v) { images.add(new ComicDataDataResultsImage.fromJson(v)); });
		}
		stories = json['stories'] != null ? new ComicDataDataResultsStories.fromJson(json['stories']) : null;
		if (json['textObjects'] != null) {
			textObjects = new List<ComicDataDataResultsTextobject>();(json['textObjects'] as List).forEach((v) { textObjects.add(new ComicDataDataResultsTextobject.fromJson(v)); });
		}
		digitalId = json['digitalId'];
		format = json['format'];
		upc = json['upc'];
		if (json['dates'] != null) {
			dates = new List<ComicDataDataResultsDate>();(json['dates'] as List).forEach((v) { dates.add(new ComicDataDataResultsDate.fromJson(v)); });
		}
		resourceURI = json['resourceURI'];
		variantDescription = json['variantDescription'];
		issn = json['issn'];
		series = json['series'] != null ? new ComicDataDataResultsSeries.fromJson(json['series']) : null;
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

class ComicDataDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<ComicDataDataResultsCreatorsItem> items;

	ComicDataDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	ComicDataDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicDataDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new ComicDataDataResultsCreatorsItem.fromJson(v)); });
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

class ComicDataDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	ComicDataDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	ComicDataDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<ComicDataDataResultsCharactersItem> items;

	ComicDataDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	ComicDataDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicDataDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new ComicDataDataResultsCharactersItem.fromJson(v)); });
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

class ComicDataDataResultsCharactersItem {
	String name;
	String resourceURI;

	ComicDataDataResultsCharactersItem({this.name, this.resourceURI});

	ComicDataDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsUrl {
	String type;
	String url;

	ComicDataDataResultsUrl({this.type, this.url});

	ComicDataDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsPrice {
	var price;
	String type;

	ComicDataDataResultsPrice({this.price, this.type});

	ComicDataDataResultsPrice.fromJson(Map<String, dynamic> json) {

		price= json['price'];

		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['price'] = this.price;
		data['type'] = this.type;
		return data;
	}
}

class ComicDataDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	ComicDataDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	ComicDataDataResultsEvents.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsThumbnail {
	String path;
	String extension;

	ComicDataDataResultsThumbnail({this.path, this.extension});

	ComicDataDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsImage {
	String path;
	String extension;

	ComicDataDataResultsImage({this.path, this.extension});

	ComicDataDataResultsImage.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<ComicDataDataResultsStoriesItem> items;

	ComicDataDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	ComicDataDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<ComicDataDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new ComicDataDataResultsStoriesItem.fromJson(v)); });
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

class ComicDataDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	ComicDataDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	ComicDataDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsTextobject {
	String language;
	String text;
	String type;

	ComicDataDataResultsTextobject({this.language, this.text, this.type});

	ComicDataDataResultsTextobject.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsDate {
	String date;
	String type;

	ComicDataDataResultsDate({this.date, this.type});

	ComicDataDataResultsDate.fromJson(Map<String, dynamic> json) {
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

class ComicDataDataResultsSeries {
	String name;
	String resourceURI;

	ComicDataDataResultsSeries({this.name, this.resourceURI});

	ComicDataDataResultsSeries.fromJson(Map<String, dynamic> json) {
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
