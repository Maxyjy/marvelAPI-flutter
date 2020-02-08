class DetailEventCharacterEntity {
	String copyright;
	int code;
	DetailEventCharacterData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailEventCharacterEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailEventCharacterEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailEventCharacterData.fromJson(json['data']) : null;
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

class DetailEventCharacterData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailEventCharacterDataResult> results;

	DetailEventCharacterData({this.total, this.offset, this.limit, this.count, this.results});

	DetailEventCharacterData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailEventCharacterDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailEventCharacterDataResult.fromJson(v)); });
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

class DetailEventCharacterDataResult {
	DetailEventCharacterDataResultsThumbnail thumbnail;
	List<DetailEventCharacterDataResultsUrl> urls;
	DetailEventCharacterDataResultsStories stories;
	DetailEventCharacterDataResultsSeries series;
	DetailEventCharacterDataResultsComics comics;
	String name;
	String description;
	String modified;
	int id;
	String resourceURI;
	DetailEventCharacterDataResultsEvents events;

	DetailEventCharacterDataResult({this.thumbnail, this.urls, this.stories, this.series, this.comics, this.name, this.description, this.modified, this.id, this.resourceURI, this.events});

	DetailEventCharacterDataResult.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'] != null ? new DetailEventCharacterDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailEventCharacterDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailEventCharacterDataResultsUrl.fromJson(v)); });
		}
		stories = json['stories'] != null ? new DetailEventCharacterDataResultsStories.fromJson(json['stories']) : null;
		series = json['series'] != null ? new DetailEventCharacterDataResultsSeries.fromJson(json['series']) : null;
		comics = json['comics'] != null ? new DetailEventCharacterDataResultsComics.fromJson(json['comics']) : null;
		name = json['name'];
		description = json['description'];
		modified = json['modified'];
		id = json['id'];
		resourceURI = json['resourceURI'];
		events = json['events'] != null ? new DetailEventCharacterDataResultsEvents.fromJson(json['events']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['name'] = this.name;
		data['description'] = this.description;
		data['modified'] = this.modified;
		data['id'] = this.id;
		data['resourceURI'] = this.resourceURI;
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		return data;
	}
}

class DetailEventCharacterDataResultsThumbnail {
	String path;
	String extension;

	DetailEventCharacterDataResultsThumbnail({this.path, this.extension});

	DetailEventCharacterDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailEventCharacterDataResultsUrl {
	String type;
	String url;

	DetailEventCharacterDataResultsUrl({this.type, this.url});

	DetailEventCharacterDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailEventCharacterDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventCharacterDataResultsStoriesItem> items;

	DetailEventCharacterDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailEventCharacterDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventCharacterDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventCharacterDataResultsStoriesItem.fromJson(v)); });
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

class DetailEventCharacterDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailEventCharacterDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailEventCharacterDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventCharacterDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventCharacterDataResultsSeriesItem> items;

	DetailEventCharacterDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	DetailEventCharacterDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventCharacterDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventCharacterDataResultsSeriesItem.fromJson(v)); });
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

class DetailEventCharacterDataResultsSeriesItem {
	String name;
	String resourceURI;

	DetailEventCharacterDataResultsSeriesItem({this.name, this.resourceURI});

	DetailEventCharacterDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventCharacterDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventCharacterDataResultsComicsItem> items;

	DetailEventCharacterDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailEventCharacterDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventCharacterDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventCharacterDataResultsComicsItem.fromJson(v)); });
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

class DetailEventCharacterDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailEventCharacterDataResultsComicsItem({this.name, this.resourceURI});

	DetailEventCharacterDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventCharacterDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventCharacterDataResultsEventsItem> items;

	DetailEventCharacterDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailEventCharacterDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventCharacterDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventCharacterDataResultsEventsItem.fromJson(v)); });
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

class DetailEventCharacterDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailEventCharacterDataResultsEventsItem({this.name, this.resourceURI});

	DetailEventCharacterDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
