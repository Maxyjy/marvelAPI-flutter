class DetailEventSeriesEntity {
	String copyright;
	int code;
	DetailEventSeriesData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailEventSeriesEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailEventSeriesEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailEventSeriesData.fromJson(json['data']) : null;
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

class DetailEventSeriesData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailEventSeriesDataResult> results;

	DetailEventSeriesData({this.total, this.offset, this.limit, this.count, this.results});

	DetailEventSeriesData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailEventSeriesDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailEventSeriesDataResult.fromJson(v)); });
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

class DetailEventSeriesDataResult {
	DetailEventSeriesDataResultsNext next;
	DetailEventSeriesDataResultsThumbnail thumbnail;
	DetailEventSeriesDataResultsStories stories;
	DetailEventSeriesDataResultsPrevious previous;
	DetailEventSeriesDataResultsCreators creators;
	DetailEventSeriesDataResultsComics comics;
	int startYear;
	String rating;
	String description;
	String resourceURI;
	String title;
	String type;
	int endYear;
	DetailEventSeriesDataResultsCharacters characters;
	List<DetailEventSeriesDataResultsUrl> urls;
	String modified;
	int id;
	DetailEventSeriesDataResultsEvents events;

	DetailEventSeriesDataResult({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.startYear, this.rating, this.description, this.resourceURI, this.title, this.type, this.endYear, this.characters, this.urls, this.modified, this.id, this.events});

	DetailEventSeriesDataResult.fromJson(Map<String, dynamic> json) {
		next = json['next'] != null ? new DetailEventSeriesDataResultsNext.fromJson(json['next']) : null;
		thumbnail = json['thumbnail'] != null ? new DetailEventSeriesDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new DetailEventSeriesDataResultsStories.fromJson(json['stories']) : null;
		previous = json['previous'] != null ? new DetailEventSeriesDataResultsPrevious.fromJson(json['previous']) : null;
		creators = json['creators'] != null ? new DetailEventSeriesDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new DetailEventSeriesDataResultsComics.fromJson(json['comics']) : null;
		startYear = json['startYear'];
		rating = json['rating'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		endYear = json['endYear'];
		characters = json['characters'] != null ? new DetailEventSeriesDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailEventSeriesDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailEventSeriesDataResultsUrl.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new DetailEventSeriesDataResultsEvents.fromJson(json['events']) : null;
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

class DetailEventSeriesDataResultsNext {
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsNext({this.name, this.resourceURI});

	DetailEventSeriesDataResultsNext.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsThumbnail {
	String path;
	String extension;

	DetailEventSeriesDataResultsThumbnail({this.path, this.extension});

	DetailEventSeriesDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventSeriesDataResultsStoriesItem> items;

	DetailEventSeriesDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailEventSeriesDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventSeriesDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventSeriesDataResultsStoriesItem.fromJson(v)); });
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

class DetailEventSeriesDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailEventSeriesDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailEventSeriesDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsPrevious {
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsPrevious({this.name, this.resourceURI});

	DetailEventSeriesDataResultsPrevious.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventSeriesDataResultsCreatorsItem> items;

	DetailEventSeriesDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	DetailEventSeriesDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventSeriesDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventSeriesDataResultsCreatorsItem.fromJson(v)); });
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

class DetailEventSeriesDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	DetailEventSeriesDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventSeriesDataResultsComicsItem> items;

	DetailEventSeriesDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailEventSeriesDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventSeriesDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventSeriesDataResultsComicsItem.fromJson(v)); });
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

class DetailEventSeriesDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsComicsItem({this.name, this.resourceURI});

	DetailEventSeriesDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventSeriesDataResultsCharactersItem> items;

	DetailEventSeriesDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	DetailEventSeriesDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventSeriesDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventSeriesDataResultsCharactersItem.fromJson(v)); });
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

class DetailEventSeriesDataResultsCharactersItem {
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsCharactersItem({this.name, this.resourceURI});

	DetailEventSeriesDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsUrl {
	String type;
	String url;

	DetailEventSeriesDataResultsUrl({this.type, this.url});

	DetailEventSeriesDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailEventSeriesDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<DetailEventSeriesDataResultsEventsItem> items;

	DetailEventSeriesDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailEventSeriesDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailEventSeriesDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new DetailEventSeriesDataResultsEventsItem.fromJson(v)); });
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

class DetailEventSeriesDataResultsEventsItem {
	String name;
	String resourceURI;

	DetailEventSeriesDataResultsEventsItem({this.name, this.resourceURI});

	DetailEventSeriesDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
