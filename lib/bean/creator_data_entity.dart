class CreatorDataEntity {
	String copyright;
	int code;
	CreatorDataData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	CreatorDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	CreatorDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new CreatorDataData.fromJson(json['data']) : null;
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

class CreatorDataData {
	int total;
	int offset;
	int limit;
	int count;
	List<CreatorDataDataResult> results;

	CreatorDataData({this.total, this.offset, this.limit, this.count, this.results});

	CreatorDataData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<CreatorDataDataResult>();(json['results'] as List).forEach((v) { results.add(new CreatorDataDataResult.fromJson(v)); });
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

class CreatorDataDataResult {
	String lastName;
	CreatorDataDataResultsThumbnail thumbnail;
	CreatorDataDataResultsStories stories;
	CreatorDataDataResultsComics comics;
	String fullName;
	String resourceURI;
	String suffix;
	String firstName;
	List<CreatorDataDataResultsUrl> urls;
	CreatorDataDataResultsSeries series;
	String modified;
	String middleName;
	int id;
	CreatorDataDataResultsEvents events;

	CreatorDataDataResult({this.lastName, this.thumbnail, this.stories, this.comics, this.fullName, this.resourceURI, this.suffix, this.firstName, this.urls, this.series, this.modified, this.middleName, this.id, this.events});

	CreatorDataDataResult.fromJson(Map<String, dynamic> json) {
		lastName = json['lastName'];
		thumbnail = json['thumbnail'] != null ? new CreatorDataDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new CreatorDataDataResultsStories.fromJson(json['stories']) : null;
		comics = json['comics'] != null ? new CreatorDataDataResultsComics.fromJson(json['comics']) : null;
		fullName = json['fullName'];
		resourceURI = json['resourceURI'];
		suffix = json['suffix'];
		firstName = json['firstName'];
		if (json['urls'] != null) {
			urls = new List<CreatorDataDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new CreatorDataDataResultsUrl.fromJson(v)); });
		}
		series = json['series'] != null ? new CreatorDataDataResultsSeries.fromJson(json['series']) : null;
		modified = json['modified'];
		middleName = json['middleName'];
		id = json['id'];
		events = json['events'] != null ? new CreatorDataDataResultsEvents.fromJson(json['events']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastName'] = this.lastName;
		if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
		if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['fullName'] = this.fullName;
		data['resourceURI'] = this.resourceURI;
		data['suffix'] = this.suffix;
		data['firstName'] = this.firstName;
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		data['modified'] = this.modified;
		data['middleName'] = this.middleName;
		data['id'] = this.id;
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		return data;
	}
}

class CreatorDataDataResultsThumbnail {
	String path;
	String extension;

	CreatorDataDataResultsThumbnail({this.path, this.extension});

	CreatorDataDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class CreatorDataDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<CreatorDataDataResultsStoriesItem> items;

	CreatorDataDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	CreatorDataDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorDataDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new CreatorDataDataResultsStoriesItem.fromJson(v)); });
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

class CreatorDataDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	CreatorDataDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	CreatorDataDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class CreatorDataDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<CreatorDataDataResultsComicsItem> items;

	CreatorDataDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	CreatorDataDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorDataDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new CreatorDataDataResultsComicsItem.fromJson(v)); });
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

class CreatorDataDataResultsComicsItem {
	String name;
	String resourceURI;

	CreatorDataDataResultsComicsItem({this.name, this.resourceURI});

	CreatorDataDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class CreatorDataDataResultsUrl {
	String type;
	String url;

	CreatorDataDataResultsUrl({this.type, this.url});

	CreatorDataDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class CreatorDataDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<CreatorDataDataResultsSeriesItem> items;

	CreatorDataDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	CreatorDataDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorDataDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new CreatorDataDataResultsSeriesItem.fromJson(v)); });
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

class CreatorDataDataResultsSeriesItem {
	String name;
	String resourceURI;

	CreatorDataDataResultsSeriesItem({this.name, this.resourceURI});

	CreatorDataDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class CreatorDataDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	CreatorDataDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	CreatorDataDataResultsEvents.fromJson(Map<String, dynamic> json) {
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
