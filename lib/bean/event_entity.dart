class EventEntity {
	EventNext next;
	EventThumbnail thumbnail;
	EventStories stories;
	EventPrevious previous;
	EventCreators creators;
	EventComics comics;
	String start;
	String description;
	String resourceURI;
	String title;
	EventCharacters characters;
	List<EventUrl> urls;
	EventSeries series;
	String modified;
	String end;
	int id;

	EventEntity({this.next, this.thumbnail, this.stories, this.previous, this.creators, this.comics, this.start, this.description, this.resourceURI, this.title, this.characters, this.urls, this.series, this.modified, this.end, this.id});

	EventEntity.fromJson(Map<String, dynamic> json) {
		next = json['next'] != null ? new EventNext.fromJson(json['next']) : null;
		thumbnail = json['thumbnail'] != null ? new EventThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new EventStories.fromJson(json['stories']) : null;
		previous = json['previous'] != null ? new EventPrevious.fromJson(json['previous']) : null;
		creators = json['creators'] != null ? new EventCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new EventComics.fromJson(json['comics']) : null;
		start = json['start'];
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		characters = json['characters'] != null ? new EventCharacters.fromJson(json['characters']) : null;
		if (json['urls'] != null) {
			urls = new List<EventUrl>();(json['urls'] as List).forEach((v) { urls.add(new EventUrl.fromJson(v)); });
		}
		series = json['series'] != null ? new EventSeries.fromJson(json['series']) : null;
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

class EventNext {
	String name;
	String resourceURI;

	EventNext({this.name, this.resourceURI});

	EventNext.fromJson(Map<String, dynamic> json) {
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

class EventThumbnail {
	String path;
	String extension;

	EventThumbnail({this.path, this.extension});

	EventThumbnail.fromJson(Map<String, dynamic> json) {
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

class EventStories {
	String collectionURI;
	int available;
	int returned;
	List<EventStoriesItem> items;

	EventStories({this.collectionURI, this.available, this.returned, this.items});

	EventStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventStoriesItem>();(json['items'] as List).forEach((v) { items.add(new EventStoriesItem.fromJson(v)); });
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

class EventStoriesItem {
	String name;
	String resourceURI;
	String type;

	EventStoriesItem({this.name, this.resourceURI, this.type});

	EventStoriesItem.fromJson(Map<String, dynamic> json) {
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

class EventPrevious {
	String name;
	String resourceURI;

	EventPrevious({this.name, this.resourceURI});

	EventPrevious.fromJson(Map<String, dynamic> json) {
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

class EventCreators {
	String collectionURI;
	int available;
	int returned;
	List<EventCreatorsItem> items;

	EventCreators({this.collectionURI, this.available, this.returned, this.items});

	EventCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new EventCreatorsItem.fromJson(v)); });
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

class EventCreatorsItem {
	String role;
	String name;
	String resourceURI;

	EventCreatorsItem({this.role, this.name, this.resourceURI});

	EventCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class EventComics {
	String collectionURI;
	int available;
	int returned;
	List<EventComicsItem> items;

	EventComics({this.collectionURI, this.available, this.returned, this.items});

	EventComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventComicsItem>();(json['items'] as List).forEach((v) { items.add(new EventComicsItem.fromJson(v)); });
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

class EventComicsItem {
	String name;
	String resourceURI;

	EventComicsItem({this.name, this.resourceURI});

	EventComicsItem.fromJson(Map<String, dynamic> json) {
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

class EventCharacters {
	String collectionURI;
	int available;
	int returned;
	List<EventCharactersItem> items;

	EventCharacters({this.collectionURI, this.available, this.returned, this.items});

	EventCharacters.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventCharactersItem>();(json['items'] as List).forEach((v) { items.add(new EventCharactersItem.fromJson(v)); });
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

class EventCharactersItem {
	String name;
	String resourceURI;

	EventCharactersItem({this.name, this.resourceURI});

	EventCharactersItem.fromJson(Map<String, dynamic> json) {
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

class EventUrl {
	String type;
	String url;

	EventUrl({this.type, this.url});

	EventUrl.fromJson(Map<String, dynamic> json) {
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

class EventSeries {
	String collectionURI;
	int available;
	int returned;
	List<EventSeriesItem> items;

	EventSeries({this.collectionURI, this.available, this.returned, this.items});

	EventSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<EventSeriesItem>();(json['items'] as List).forEach((v) { items.add(new EventSeriesItem.fromJson(v)); });
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

class EventSeriesItem {
	String name;
	String resourceURI;

	EventSeriesItem({this.name, this.resourceURI});

	EventSeriesItem.fromJson(Map<String, dynamic> json) {
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
