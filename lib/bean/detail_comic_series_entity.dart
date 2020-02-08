class DetailComicSeriesEntity {
	String copyright;
	int code;
	DetailComicSeriesData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	DetailComicSeriesEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	DetailComicSeriesEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new DetailComicSeriesData.fromJson(json['data']) : null;
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

class DetailComicSeriesData {
	int total;
	int offset;
	int limit;
	int count;
	List<DetailComicSeriesDataResult> results;

	DetailComicSeriesData({this.total, this.offset, this.limit, this.count, this.results});

	DetailComicSeriesData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<DetailComicSeriesDataResult>();(json['results'] as List).forEach((v) { results.add(new DetailComicSeriesDataResult.fromJson(v)); });
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

class DetailComicSeriesDataResult {
	dynamic next;
	DetailComicSeriesDataResultsThumbnail thumbnail;
	DetailComicSeriesDataResultsStories stories;
	dynamic previous;
	DetailComicSeriesDataResultsCreators creators;
	DetailComicSeriesDataResultsComics comics;
	int startYear;
	String rating;
	dynamic description;
	String resourceURI;
	String title;
	String type;
	int endYear;
	DetailComicSeriesDataResultsCharacters characters;
	List<DetailComicSeriesDataResultsUrl> urls;
	String modified;
	int id;
	DetailComicSeriesDataResultsEvents events;

	DetailComicSeriesDataResult({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.startYear, this.rating, this.description, this.resourceURI, this.title, this.type, this.endYear, this.characters, this.urls, this.modified, this.id, this.events});

	DetailComicSeriesDataResult.fromJson(Map<String, dynamic> json) {
		next = json['next'];
		thumbnail = json['thumbnail'] != null ? new DetailComicSeriesDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new DetailComicSeriesDataResultsStories.fromJson(json['stories']) : null;
		previous = json['previous'];
		creators = json['creators'] != null ? new DetailComicSeriesDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new DetailComicSeriesDataResultsComics.fromJson(json['comics']) : null;
		startYear = json['startYear'];
		rating = json['rating'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		endYear = json['endYear'];
		characters = json['characters'] != null ? new DetailComicSeriesDataResultsCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<DetailComicSeriesDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new DetailComicSeriesDataResultsUrl.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new DetailComicSeriesDataResultsEvents.fromJson(json['events']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['next'] = this.next;
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

class DetailComicSeriesDataResultsThumbnail {
	String path;
	String extension;

	DetailComicSeriesDataResultsThumbnail({this.path, this.extension});

	DetailComicSeriesDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicSeriesDataResultsStoriesItem> items;

	DetailComicSeriesDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	DetailComicSeriesDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicSeriesDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicSeriesDataResultsStoriesItem.fromJson(v)); });
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

class DetailComicSeriesDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	DetailComicSeriesDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	DetailComicSeriesDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicSeriesDataResultsCreatorsItem> items;

	DetailComicSeriesDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	DetailComicSeriesDataResultsCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicSeriesDataResultsCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicSeriesDataResultsCreatorsItem.fromJson(v)); });
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

class DetailComicSeriesDataResultsCreatorsItem {
	String role;
	String name;
	String resourceURI;

	DetailComicSeriesDataResultsCreatorsItem({this.role, this.name, this.resourceURI});

	DetailComicSeriesDataResultsCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicSeriesDataResultsComicsItem> items;

	DetailComicSeriesDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	DetailComicSeriesDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicSeriesDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicSeriesDataResultsComicsItem.fromJson(v)); });
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

class DetailComicSeriesDataResultsComicsItem {
	String name;
	String resourceURI;

	DetailComicSeriesDataResultsComicsItem({this.name, this.resourceURI});

	DetailComicSeriesDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<DetailComicSeriesDataResultsCharactersItem> items;

	DetailComicSeriesDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	DetailComicSeriesDataResultsCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<DetailComicSeriesDataResultsCharactersItem>();(json['items'] as List).forEach((v) { items.add(new DetailComicSeriesDataResultsCharactersItem.fromJson(v)); });
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

class DetailComicSeriesDataResultsCharactersItem {
	String name;
	String resourceURI;

	DetailComicSeriesDataResultsCharactersItem({this.name, this.resourceURI});

	DetailComicSeriesDataResultsCharactersItem.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsUrl {
	String type;
	String url;

	DetailComicSeriesDataResultsUrl({this.type, this.url});

	DetailComicSeriesDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class DetailComicSeriesDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	DetailComicSeriesDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	DetailComicSeriesDataResultsEvents.fromJson(Map<String, dynamic> json) {
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
