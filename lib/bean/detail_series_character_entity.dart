class DetailSeriesCharacterEntity {
	String copyright;
	int code;
	DetailSeriesCharacterData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailSeriesCharacterEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailSeriesCharacterEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailSeriesCharacterData.fromJson(json['data']) : null;
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

class DetailSeriesCharacterData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailSeriesCharacterDataResult> results;

	DetailSeriesCharacterData({this.total, this.offset, this.limit, this.count, this.results});

	DetailSeriesCharacterData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailSeriesCharacterDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailSeriesCharacterDataResult.fromJson(v)); });
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

class DetailSeriesCharacterDataResult {
	DetailSeriesCharacterDataResultsThumbnail thumbnail;
	List<DetailSeriesCharacterDataResultsUrl> urls;
	DetailSeriesCharacterDataResultsStories stories;
	DetailSeriesCharacterDataResultsSeries series;
	DetailSeriesCharacterDataResultsComics comics;
	String name;
	String description;
	String modified;
	int id;
	String resourceURI;
	DetailSeriesCharacterDataResultsEvents events;

	DetailSeriesCharacterDataResult({this.thumbnail, this.urls, this.stories, this.series, this.comics, this.name, this.description, this.modified, this.id, this.resourceURI, this.events});

	DetailSeriesCharacterDataResult.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'] != null ? new DetailSeriesCharacterDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailSeriesCharacterDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailSeriesCharacterDataResultsUrl.fromJson(v)); });
		}
		stories = json['stories'] != null ? new DetailSeriesCharacterDataResultsStories.fromJson(json['stories']) : null;
		series = json['series'] != null ? new DetailSeriesCharacterDataResultsSeries.fromJson(json['series']) : null;
		comics = json['comics'] != null ? new DetailSeriesCharacterDataResultsComics.fromJson(json['comics']) : null;
		name = json['name'];
		description = json['description'];
		modified = json['modified'];
		id = json['id'];
		resourceURI = json['resourceURI'];
		events = json['events'] != null ? new DetailSeriesCharacterDataResultsEvents.fromJson(json['events']) : null;
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

class DetailSeriesCharacterDataResultsThumbnail {
	String path;
	String extension;

	DetailSeriesCharacterDataResultsThumbnail({this.path, this.extension});

	DetailSeriesCharacterDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesCharacterDataResultsUrl {
	String type;
	String url;

	DetailSeriesCharacterDataResultsUrl({this.type, this.url});

	DetailSeriesCharacterDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesCharacterDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesCharacterDataResultsStoriesItem> items;

	DetailSeriesCharacterDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesCharacterDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesCharacterDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesCharacterDataResultsStoriesItem.fromJson(v)); });
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

class DetailSeriesCharacterDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailSeriesCharacterDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailSeriesCharacterDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesCharacterDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesCharacterDataResultsSeriesItem> items;

	DetailSeriesCharacterDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesCharacterDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesCharacterDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesCharacterDataResultsSeriesItem.fromJson(v)); });
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

class DetailSeriesCharacterDataResultsSeriesItem {
	String name;
	String resourceURI;

	DetailSeriesCharacterDataResultsSeriesItem({this.name, this.resourceURI});

	DetailSeriesCharacterDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesCharacterDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesCharacterDataResultsComicsItem> items;

	DetailSeriesCharacterDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesCharacterDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesCharacterDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesCharacterDataResultsComicsItem.fromJson(v)); });
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

class DetailSeriesCharacterDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailSeriesCharacterDataResultsComicsItem({this.name, this.resourceURI});

	DetailSeriesCharacterDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailSeriesCharacterDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailSeriesCharacterDataResultsEventsItem> items;

	DetailSeriesCharacterDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailSeriesCharacterDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailSeriesCharacterDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailSeriesCharacterDataResultsEventsItem.fromJson(v)); });
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

class DetailSeriesCharacterDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailSeriesCharacterDataResultsEventsItem({this.name, this.resourceURI});

	DetailSeriesCharacterDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
