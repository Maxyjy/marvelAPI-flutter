class DetailCharacterEventEntity {
	String copyright;
	int code;
	DetailCharacterEventData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailCharacterEventEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailCharacterEventEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailCharacterEventData.fromJson(json['data']) : null;
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

class DetailCharacterEventData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailCharacterEventDataResult> results;

	DetailCharacterEventData({this.total, this.offset, this.limit, this.count, this.results});

	DetailCharacterEventData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailCharacterEventDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailCharacterEventDataResult.fromJson(v)); });
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

class DetailCharacterEventDataResult {
	DetailCharacterEventDataResultsNext next;
	DetailCharacterEventDataResultsThumbnail thumbnail;
	DetailCharacterEventDataResultsStories stories;
	DetailCharacterEventDataResultsPrevious previous;
	DetailCharacterEventDataResultsCreators creators;
	DetailCharacterEventDataResultsComics comics;
	int startYear;
	String rating;
	String description;
	String resourceURI;
	String title;
	String type;
	int endYear;
	DetailCharacterEventDataResultsCharacters characters;
	List<DetailCharacterEventDataResultsUrl> urls;
	String modified;
	int id;
	DetailCharacterEventDataResultsEvents events;

	DetailCharacterEventDataResult({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.startYear, this.rating, this.description, this.resourceURI, this.title, this.type, this.endYear, this.characters, this.urls, this.modified, this.id, this.events});

	DetailCharacterEventDataResult.fromJson(Map<String, dynamic> json) {
		next = json['next'] != null ? new DetailCharacterEventDataResultsNext.fromJson(json['next']) : null;
		thumbnail = json['thumbnail'] != null ? new DetailCharacterEventDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new DetailCharacterEventDataResultsStories.fromJson(json['stories']) : null;
		previous = json['previous'] != null ? new DetailCharacterEventDataResultsPrevious.fromJson(json['previous']) : null;
		creators = json['creators'] != null ? new DetailCharacterEventDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new DetailCharacterEventDataResultsComics.fromJson(json['comics']) : null;
		startYear = json['startYear'];
		rating = json['rating'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		endYear = json['endYear'];
		characters = json['characters'] != null ? new DetailCharacterEventDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailCharacterEventDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailCharacterEventDataResultsUrl.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new DetailCharacterEventDataResultsEvents.fromJson(json['events']) : null;
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

class DetailCharacterEventDataResultsNext {
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsNext({this.name, this.resourceURI});

	DetailCharacterEventDataResultsNext.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsThumbnail {
	String path;
	String extension;

	DetailCharacterEventDataResultsThumbnail({this.path, this.extension});

	DetailCharacterEventDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailCharacterEventDataResultsStoriesItem> items;

	DetailCharacterEventDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailCharacterEventDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailCharacterEventDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailCharacterEventDataResultsStoriesItem.fromJson(v)); });
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

class DetailCharacterEventDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailCharacterEventDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailCharacterEventDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsPrevious {
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsPrevious({this.name, this.resourceURI});

	DetailCharacterEventDataResultsPrevious.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<DetailCharacterEventDataResultsCreatorsItem> items;

	DetailCharacterEventDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	DetailCharacterEventDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailCharacterEventDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new DetailCharacterEventDataResultsCreatorsItem.fromJson(v)); });
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

class DetailCharacterEventDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	DetailCharacterEventDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailCharacterEventDataResultsComicsItem> items;

	DetailCharacterEventDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailCharacterEventDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailCharacterEventDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailCharacterEventDataResultsComicsItem.fromJson(v)); });
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

class DetailCharacterEventDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsComicsItem({this.name, this.resourceURI});

	DetailCharacterEventDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<DetailCharacterEventDataResultsCharactersItem> items;

	DetailCharacterEventDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	DetailCharacterEventDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailCharacterEventDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new DetailCharacterEventDataResultsCharactersItem.fromJson(v)); });
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

class DetailCharacterEventDataResultsCharactersItem {
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsCharactersItem({this.name, this.resourceURI});

	DetailCharacterEventDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsUrl {
	String type;
	String url;

	DetailCharacterEventDataResultsUrl({this.type, this.url});

	DetailCharacterEventDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailCharacterEventDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailCharacterEventDataResultsEventsItem> items;

	DetailCharacterEventDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailCharacterEventDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailCharacterEventDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailCharacterEventDataResultsEventsItem.fromJson(v)); });
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

class DetailCharacterEventDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailCharacterEventDataResultsEventsItem({this.name, this.resourceURI});

	DetailCharacterEventDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
