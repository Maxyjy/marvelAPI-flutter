class CharacterEntity {
	CharacterThumbnail thumbnail;
	List<CharacterUrl> urls;
	CharacterStories stories;
	CharacterSeries series;
	CharacterComics comics;
	String name;
	String description;
	String modified;
	int id;
	String resourceURI;
	CharacterEvents events;

	CharacterEntity({this.thumbnail, this.urls, this.stories, this.series, this.comics, this.name, this.description, this.modified, this.id, this.resourceURI, this.events});

	CharacterEntity.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'] != null ? new CharacterThumbnail.fromJson(json['thumbnail']) : null;
		if (json['urls'] != null) {
			urls = new List<CharacterUrl>();(json['urls'] as List).forEach((v) { urls.add(new CharacterUrl.fromJson(v)); });
		}
		stories = json['stories'] != null ? new CharacterStories.fromJson(json['stories']) : null;
		series = json['series'] != null ? new CharacterSeries.fromJson(json['series']) : null;
		comics = json['comics'] != null ? new CharacterComics.fromJson(json['comics']) : null;
		name = json['name'];
		description = json['description'];
		modified = json['modified'];
		id = json['id'];
		resourceURI = json['resourceURI'];
		events = json['events'] != null ? new CharacterEvents.fromJson(json['events']) : null;
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

class CharacterThumbnail {
	String path;
	String extension;

	CharacterThumbnail({this.path, this.extension});

	CharacterThumbnail.fromJson(Map<String, dynamic> json) {
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

class CharacterUrl {
	String type;
	String url;

	CharacterUrl({this.type, this.url});

	CharacterUrl.fromJson(Map<String, dynamic> json) {
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

class CharacterStories {
	String collectionURI;
	int available;
	int returned;
	List<CharacterStoriesItem> items;

	CharacterStories({this.collectionURI, this.available, this.returned, this.items});

	CharacterStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CharacterStoriesItem>();(json['items'] as List).forEach((v) { items.add(new CharacterStoriesItem.fromJson(v)); });
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

class CharacterStoriesItem {
	String name;
	String resourceURI;
	String type;

	CharacterStoriesItem({this.name, this.resourceURI, this.type});

	CharacterStoriesItem.fromJson(Map<String, dynamic> json) {
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

class CharacterSeries {
	String collectionURI;
	int available;
	int returned;
	List<CharacterSeriesItem> items;

	CharacterSeries({this.collectionURI, this.available, this.returned, this.items});

	CharacterSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CharacterSeriesItem>();(json['items'] as List).forEach((v) { items.add(new CharacterSeriesItem.fromJson(v)); });
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

class CharacterSeriesItem {
	String name;
	String resourceURI;

	CharacterSeriesItem({this.name, this.resourceURI});

	CharacterSeriesItem.fromJson(Map<String, dynamic> json) {
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

class CharacterComics {
	String collectionURI;
	int available;
	int returned;
	List<CharacterComicsItem> items;

	CharacterComics({this.collectionURI, this.available, this.returned, this.items});

	CharacterComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CharacterComicsItem>();(json['items'] as List).forEach((v) { items.add(new CharacterComicsItem.fromJson(v)); });
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

class CharacterComicsItem {
	String name;
	String resourceURI;

	CharacterComicsItem({this.name, this.resourceURI});

	CharacterComicsItem.fromJson(Map<String, dynamic> json) {
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

class CharacterEvents {
	String collectionURI;
	int available;
	int returned;
	List<CharacterEventsItem> items;

	CharacterEvents({this.collectionURI, this.available, this.returned, this.items});

	CharacterEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CharacterEventsItem>();(json['items'] as List).forEach((v) { items.add(new CharacterEventsItem.fromJson(v)); });
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

class CharacterEventsItem {
	String name;
	String resourceURI;

	CharacterEventsItem({this.name, this.resourceURI});

	CharacterEventsItem.fromJson(Map<String, dynamic> json) {
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
