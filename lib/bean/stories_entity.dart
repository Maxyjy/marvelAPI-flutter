class StoriesEntity {
	dynamic thumbnail;
	StoriesCreators creators;
	StoriesComics comics;
	String description;
	String resourceURI;
	String title;
	String type;
	StoriesCharacters characters;
	StoriesOriginalissue originalIssue;
	StoriesSeries series;
	String modified;
	int id;
	StoriesEvents events;

	StoriesEntity({this.thumbnail, this.creators, this.comics, this.description, this.resourceURI, this.title, this.type, this.characters, this.originalIssue, this.series, this.modified, this.id, this.events});

	StoriesEntity.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'];
		creators = json['creators'] != null ? new StoriesCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new StoriesComics.fromJson(json['comics']) : null;
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		characters = json['characters'] != null ? new StoriesCharacters.fromJson(json['characters']) : null;
		originalIssue = json['originalIssue'] != null ? new StoriesOriginalissue.fromJson(json['originalIssue']) : null;
		series = json['series'] != null ? new StoriesSeries.fromJson(json['series']) : null;
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new StoriesEvents.fromJson(json['events']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['thumbnail'] = this.thumbnail;
		if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['description'] = this.description;
		data['resourceURI'] = this.resourceURI;
		data['title'] = this.title;
		data['type'] = this.type;
		if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
		if (this.originalIssue != null) {
      data['originalIssue'] = this.originalIssue.toJson();
    }
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		data['modified'] = this.modified;
		data['id'] = this.id;
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		return data;
	}
}

class StoriesCreators {
	String collectionURI;
	int available;
	int returned;
	List<StoriesCreatorsItem> items;

	StoriesCreators({this.collectionURI, this.available, this.returned, this.items});

	StoriesCreators.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<StoriesCreatorsItem>();(json['items'] as List).forEach((v) { items.add(new StoriesCreatorsItem.fromJson(v)); });
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

class StoriesCreatorsItem {
	String role;
	String name;
	String resourceURI;

	StoriesCreatorsItem({this.role, this.name, this.resourceURI});

	StoriesCreatorsItem.fromJson(Map<String, dynamic> json) {
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

class StoriesComics {
	String collectionURI;
	int available;
	int returned;
	List<StoriesComicsItem> items;

	StoriesComics({this.collectionURI, this.available, this.returned, this.items});

	StoriesComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<StoriesComicsItem>();(json['items'] as List).forEach((v) { items.add(new StoriesComicsItem.fromJson(v)); });
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

class StoriesComicsItem {
	String name;
	String resourceURI;

	StoriesComicsItem({this.name, this.resourceURI});

	StoriesComicsItem.fromJson(Map<String, dynamic> json) {
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

class StoriesCharacters {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	StoriesCharacters({this.collectionURI, this.available, this.returned, this.items});

	StoriesCharacters.fromJson(Map<String, dynamic> json) {
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

class StoriesOriginalissue {
	String name;
	String resourceURI;

	StoriesOriginalissue({this.name, this.resourceURI});

	StoriesOriginalissue.fromJson(Map<String, dynamic> json) {
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

class StoriesSeries {
	String collectionURI;
	int available;
	int returned;
	List<StoriesSeriesItem> items;

	StoriesSeries({this.collectionURI, this.available, this.returned, this.items});

	StoriesSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<StoriesSeriesItem>();(json['items'] as List).forEach((v) { items.add(new StoriesSeriesItem.fromJson(v)); });
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

class StoriesSeriesItem {
	String name;
	String resourceURI;

	StoriesSeriesItem({this.name, this.resourceURI});

	StoriesSeriesItem.fromJson(Map<String, dynamic> json) {
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

class StoriesEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	StoriesEvents({this.collectionURI, this.available, this.returned, this.items});

	StoriesEvents.fromJson(Map<String, dynamic> json) {
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
