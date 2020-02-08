class SeriesEntity {
	dynamic next;
	SeriesThumbnail thumbnail;
	SeriesStories stories;
	dynamic previous;
	SeriesCreators creators;
	SeriesComics comics;
	int startYear;
	String rating;
	dynamic description;
	String resourceURI;
	String title;
	String type;
	int endYear;
	SeriesCharacters characters;
	List<SeriesUrl> urls;
	String modified;
	int id;
	SeriesEvents events;

	SeriesEntity({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.startYear, this.rating, this.description, this.resourceURI, this.title, this.type, this.endYear, this.characters, this.urls, this.modified, this.id, this.events});

	SeriesEntity.fromJson(Map<String, dynamic> json) {
		next = json['next'];
		thumbnail = json['thumbnail'] != null ? new SeriesThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new SeriesStories.fromJson(json['stories']) : null;
		previous = json['previous'];
		creators = json['creators'] != null ? new SeriesCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new SeriesComics.fromJson(json['comics']) : null;
		startYear = json['startYear'];
		rating = json['rating'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		endYear = json['endYear'];
		characters = json['characters'] != null ? new SeriesCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<SeriesUrl>();(json['urls'] as List).forEach((v) { urls.add(new SeriesUrl.fromJson(v)); });
		}
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new SeriesEvents.fromJson(json['events']) : null;
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

class SeriesThumbnail {
	String path;
	String extension;

	SeriesThumbnail({this.path, this.extension});

	SeriesThumbnail.fromJson(Map<String, dynamic> json) {
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

class SeriesStories {
	String collectionURI;
	int available;
	int returned;
	List<SeriesStoriesItem> items;

	SeriesStories({this.collectionURI, this.available, this.returned, this.items});

	SeriesStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesStoriesItem>();(json['items'] as List).forEach((v) { items.add(new SeriesStoriesItem.fromJson(v)); });
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

class SeriesStoriesItem {
	String name;
	String resourceURI;
	String type;

	SeriesStoriesItem({this.name, this.resourceURI, this.type});

	SeriesStoriesItem.fromJson(Map<String, dynamic> json) {
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

class SeriesCreators {
	String collectionURI;
	int available;
	int returned;
	List<SeriesCreatorsItem> items;

	SeriesCreators({this.collectionURI, this.available, this.returned, this.items});

	SeriesCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new SeriesCreatorsItem.fromJson(v)); });
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

class SeriesCreatorsItem {
	String role;
	String name;
	String resourceURI;

	SeriesCreatorsItem({this.role, this.name, this.resourceURI});

	SeriesCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class SeriesComics {
	String collectionURI;
	int available;
	int returned;
	List<SeriesComicsItem> items;

	SeriesComics({this.collectionURI, this.available, this.returned, this.items});

	SeriesComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesComicsItem>();(json['items'] as List).forEach((v) { items.add(new SeriesComicsItem.fromJson(v)); });
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

class SeriesComicsItem {
	String name;
	String resourceURI;

	SeriesComicsItem({this.name, this.resourceURI});

	SeriesComicsItem.fromJson(Map<String, dynamic> json) {
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

class SeriesCharacters {
	String collectionURI;
	int available;
	int returned;
	List<SeriesCharactersItem> items;

	SeriesCharacters({this.collectionURI, this.available, this.returned, this.items});

	SeriesCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<SeriesCharactersItem>();(json['items'] as List).forEach((v) { items.add(new SeriesCharactersItem.fromJson(v)); });
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

class SeriesCharactersItem {
	String name;
	String resourceURI;

	SeriesCharactersItem({this.name, this.resourceURI});

	SeriesCharactersItem.fromJson(Map<String, dynamic> json) {
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

class SeriesUrl {
	String type;
	String url;

	SeriesUrl({this.type, this.url});

	SeriesUrl.fromJson(Map<String, dynamic> json) {
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

class SeriesEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	SeriesEvents({this.collectionURI, this.available, this.returned, this.items});

	SeriesEvents.fromJson(Map<String, dynamic> json) {
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
