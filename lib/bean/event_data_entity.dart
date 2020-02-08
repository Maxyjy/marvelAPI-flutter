class EventDataEntity {
	String copyright;
	int code;
	EventDataData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	EventDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	EventDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new EventDataData.fromJson(json['data']) : null;
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

class EventDataData {
	int total;
	int offset;
	int limit;
	int count;
	List<EventDataDataResult> results;

	EventDataData({this.total, this.offset, this.limit, this.count, this.results});

	EventDataData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<EventDataDataResult>();(json['results'] as List).forEach((v) { results.add(new EventDataDataResult.fromJson(v)); });
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

class EventDataDataResult {
	EventDataDataResultsNext next;
	EventDataDataResultsThumbnail thumbnail;
	EventDataDataResultsStories stories;
	EventDataDataResultsPrevious previous;
	EventDataDataResultsCreators creators;
	EventDataDataResultsComics comics;
	String start;
	String description;
	String resourceURI;
	String title;
	EventDataDataResultsCharacters characters;
	List<EventDataDataResultsUrl> urls;
	EventDataDataResultsSeries series;
	String modified;
	String end;
	int id;

	EventDataDataResult({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.start, this.description, this.resourceURI, this.title, this.characters, this.urls, this.series, this.modified, this.end, this.id});

	EventDataDataResult.fromJson(Map<String, dynamic> json) {
		next = json['next'] != null ? new EventDataDataResultsNext.fromJson(json['next']) : null;
		thumbnail = json['thumbnail'] != null ? new EventDataDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new EventDataDataResultsStories.fromJson(json['stories']) : null;
		previous = json['previous'] != null ? new EventDataDataResultsPrevious.fromJson(json['previous']) : null;
		creators = json['creators'] != null ? new EventDataDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new EventDataDataResultsComics.fromJson(json['comics']) : null;
		start = json['start'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		characters = json['characters'] != null ? new EventDataDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<EventDataDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new EventDataDataResultsUrl.fromJson(v)); });
		}
		series = json['series'] != null ? new EventDataDataResultsSeries.fromJson(json['series']) : null;
		modified = json['modified'];
		end = json['end'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.next != null) {
      data['next'] = this.next.toJson();
    }
		if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
		if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
		if (this.previous != null) {
      data['previous'] = this.previous.toJson();
    }
		if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['start'] = this.start;
		data['description'] = this.description;
		data['resourceURI'] = this.resourceURI;
		data['title'] = this.title;
		if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		data['modified'] = this.modified;
		data['end'] = this.end;
		data['id'] = this.id;
		return data;
	}
}

class EventDataDataResultsNext {
	String name;
	String resourceURI;

	EventDataDataResultsNext({this.name, this.resourceURI});

	EventDataDataResultsNext.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsThumbnail {
	String path;
	String extension;

	EventDataDataResultsThumbnail({this.path, this.extension});

	EventDataDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<EventDataDataResultsStoriesItem> items;

	EventDataDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	EventDataDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventDataDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new EventDataDataResultsStoriesItem.fromJson(v)); });
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

class EventDataDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	EventDataDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	EventDataDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsPrevious {
	String name;
	String resourceURI;

	EventDataDataResultsPrevious({this.name, this.resourceURI});

	EventDataDataResultsPrevious.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<EventDataDataResultsCreatorsItem> items;

	EventDataDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	EventDataDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventDataDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new EventDataDataResultsCreatorsItem.fromJson(v)); });
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

class EventDataDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	EventDataDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	EventDataDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<EventDataDataResultsComicsItem> items;

	EventDataDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	EventDataDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventDataDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new EventDataDataResultsComicsItem.fromJson(v)); });
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

class EventDataDataResultsComicsItem {
	String name;
	String resourceURI;

	EventDataDataResultsComicsItem({this.name, this.resourceURI});

	EventDataDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<EventDataDataResultsCharactersItem> items;

	EventDataDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	EventDataDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventDataDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new EventDataDataResultsCharactersItem.fromJson(v)); });
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

class EventDataDataResultsCharactersItem {
	String name;
	String resourceURI;

	EventDataDataResultsCharactersItem({this.name, this.resourceURI});

	EventDataDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsUrl {
	String type;
	String url;

	EventDataDataResultsUrl({this.type, this.url});

	EventDataDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class EventDataDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<EventDataDataResultsSeriesItem> items;

	EventDataDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	EventDataDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventDataDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new EventDataDataResultsSeriesItem.fromJson(v)); });
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

class EventDataDataResultsSeriesItem {
	String name;
	String resourceURI;

	EventDataDataResultsSeriesItem({this.name, this.resourceURI});

	EventDataDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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
