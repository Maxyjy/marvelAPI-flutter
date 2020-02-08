class DetailComicCharacterEntity {
	String copyright;
	int code;
	DetailComicCharacterData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailComicCharacterEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailComicCharacterEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailComicCharacterData.fromJson(json['data']) : null;
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

class DetailComicCharacterData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailComicCharacterDataResult> results;

	DetailComicCharacterData({this.total, this.offset, this.limit, this.count, this.results});

	DetailComicCharacterData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailComicCharacterDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailComicCharacterDataResult.fromJson(v)); });
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

class DetailComicCharacterDataResult {
	DetailComicCharacterDataResultsThumbnail thumbnail;
	List<DetailComicCharacterDataResultsUrl> urls;
	DetailComicCharacterDataResultsStories stories;
	DetailComicCharacterDataResultsSeries series;
	DetailComicCharacterDataResultsComics comics;
	String name;
	String description;
	String modified;
	int id;
	String resourceURI;
	DetailComicCharacterDataResultsEvents events;

	DetailComicCharacterDataResult({this.thumbnail, this.urls, this.stories, this.series, this.comics, this.name, this.description, this.modified, this.id, this.resourceURI, this.events});

	DetailComicCharacterDataResult.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'] != null ? new DetailComicCharacterDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailComicCharacterDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailComicCharacterDataResultsUrl.fromJson(v)); });
		}
		stories = json['stories'] != null ? new DetailComicCharacterDataResultsStories.fromJson(json['stories']) : null;
		series = json['series'] != null ? new DetailComicCharacterDataResultsSeries.fromJson(json['series']) : null;
		comics = json['comics'] != null ? new DetailComicCharacterDataResultsComics.fromJson(json['comics']) : null;
		name = json['name'];
		description = json['description'];
		modified = json['modified'];
		id = json['id'];
		resourceURI = json['resourceURI'];
		events = json['events'] != null ? new DetailComicCharacterDataResultsEvents.fromJson(json['events']) : null;
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

class DetailComicCharacterDataResultsThumbnail {
	String path;
	String extension;

	DetailComicCharacterDataResultsThumbnail({this.path, this.extension});

	DetailComicCharacterDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailComicCharacterDataResultsUrl {
	String type;
	String url;

	DetailComicCharacterDataResultsUrl({this.type, this.url});

	DetailComicCharacterDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailComicCharacterDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicCharacterDataResultsStoriesItem> items;

	DetailComicCharacterDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailComicCharacterDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicCharacterDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicCharacterDataResultsStoriesItem.fromJson(v)); });
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

class DetailComicCharacterDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailComicCharacterDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailComicCharacterDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicCharacterDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicCharacterDataResultsSeriesItem> items;

	DetailComicCharacterDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	DetailComicCharacterDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicCharacterDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicCharacterDataResultsSeriesItem.fromJson(v)); });
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

class DetailComicCharacterDataResultsSeriesItem {
	String name;
	String resourceURI;

	DetailComicCharacterDataResultsSeriesItem({this.name, this.resourceURI});

	DetailComicCharacterDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicCharacterDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicCharacterDataResultsComicsItem> items;

	DetailComicCharacterDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailComicCharacterDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicCharacterDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicCharacterDataResultsComicsItem.fromJson(v)); });
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

class DetailComicCharacterDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailComicCharacterDataResultsComicsItem({this.name, this.resourceURI});

	DetailComicCharacterDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicCharacterDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicCharacterDataResultsEventsItem> items;

	DetailComicCharacterDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailComicCharacterDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicCharacterDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicCharacterDataResultsEventsItem.fromJson(v)); });
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

class DetailComicCharacterDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailComicCharacterDataResultsEventsItem({this.name, this.resourceURI});

	DetailComicCharacterDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
