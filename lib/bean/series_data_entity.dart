class SeriesDataEntity {
	String copyright;
	int code;
	SeriesDataData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	SeriesDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	SeriesDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new SeriesDataData.fromJson(json['data']) : null;
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

class SeriesDataData {
	int total;
	int offset;
	int limit;
	int count;
	List<SeriesDataDataResult> results;

	SeriesDataData({this.total, this.offset, this.limit, this.count, this.results});

	SeriesDataData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<SeriesDataDataResult>();(json['results'] as List).forEach((v) { results.add(new SeriesDataDataResult.fromJson(v)); });
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

class SeriesDataDataResult {
	SeriesDataDataResultsNext next;
	SeriesDataDataResultsThumbnail thumbnail;
	SeriesDataDataResultsStories stories;
	dynamic previous;
	SeriesDataDataResultsCreators creators;
	SeriesDataDataResultsComics comics;
	int startYear;
	String rating;
	String description;
	String resourceURI;
	String title;
	String type;
	int endYear;
	SeriesDataDataResultsCharacters characters;
	List<SeriesDataDataResultsUrl> urls;
	String modified;
	int id;
	SeriesDataDataResultsEvents events;

	SeriesDataDataResult({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.startYear, this.rating, this.description, this.resourceURI, this.title, this.type, this.endYear, this.characters, this.urls, this.modified, this.id, this.events});

	SeriesDataDataResult.fromJson(Map<String, dynamic> json) {
		next = json['next'] != null ? new SeriesDataDataResultsNext.fromJson(json['next']) : null;
		thumbnail = json['thumbnail'] != null ? new SeriesDataDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new SeriesDataDataResultsStories.fromJson(json['stories']) : null;
		previous = json['previous'];
		creators = json['creators'] != null ? new SeriesDataDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new SeriesDataDataResultsComics.fromJson(json['comics']) : null;
		startYear = json['startYear'];
		rating = json['rating'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		endYear = json['endYear'];
		characters = json['characters'] != null ? new SeriesDataDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<SeriesDataDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new SeriesDataDataResultsUrl.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new SeriesDataDataResultsEvents.fromJson(json['events']) : null;
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
		data['previous'] = this.previous;
		if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['startYear'] = this.startYear;
		data['rating'] = this.rating;
		data['description'] = this.description;
		data['resourceURI'] = this.resourceURI;
		data['title'] = this.title;
		data['type'] = this.type;
		data['endYear'] = this.endYear;
		if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		data['modified'] = this.modified;
		data['id'] = this.id;
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		return data;
	}
}

class SeriesDataDataResultsNext {
	String name;
	String resourceURI;

	SeriesDataDataResultsNext({this.name, this.resourceURI});

	SeriesDataDataResultsNext.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsThumbnail {
	String path;
	String extension;

	SeriesDataDataResultsThumbnail({this.path, this.extension});

	SeriesDataDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<SeriesDataDataResultsStoriesItem> items;

	SeriesDataDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	SeriesDataDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesDataDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new SeriesDataDataResultsStoriesItem.fromJson(v)); });
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

class SeriesDataDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	SeriesDataDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	SeriesDataDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<SeriesDataDataResultsCreatorsItem> items;

	SeriesDataDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	SeriesDataDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesDataDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new SeriesDataDataResultsCreatorsItem.fromJson(v)); });
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

class SeriesDataDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	SeriesDataDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	SeriesDataDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<SeriesDataDataResultsComicsItem> items;

	SeriesDataDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	SeriesDataDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesDataDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new SeriesDataDataResultsComicsItem.fromJson(v)); });
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

class SeriesDataDataResultsComicsItem {
	String name;
	String resourceURI;

	SeriesDataDataResultsComicsItem({this.name, this.resourceURI});

	SeriesDataDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	SeriesDataDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	SeriesDataDataResultsCharacters.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsUrl {
	String type;
	String url;

	SeriesDataDataResultsUrl({this.type, this.url});

	SeriesDataDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class SeriesDataDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	SeriesDataDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	SeriesDataDataResultsEvents.fromJson(Map<String, dynamic> json) {
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
