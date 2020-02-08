class CreatorEntity {
	String lastName;
	CreatorThumbnail thumbnail;
	CreatorStories stories;
	CreatorComics comics;
	String fullName;
	String resourceURI;
	String suffix;
	String firstName;
	List<CreatorUrl> urls;
	CreatorSeries series;
	String modified;
	String middleName;
	int id;
	CreatorEvents events;

	CreatorEntity({this.lastName, this.thumbnail, this.stories, this.comics, this.fullName, this.resourceURI, this.suffix, this.firstName, this.urls, this.series, this.modified, this.middleName, this.id, this.events});

	CreatorEntity.fromJson(Map<String, dynamic> json) {
		lastName = json['lastName'];
		thumbnail = json['thumbnail'] != null ? new CreatorThumbnail.fromJson(json['thumbnail']) : null;
		stories = json['stories'] != null ? new CreatorStories.fromJson(json['stories']) : null;
		comics = json['comics'] != null ? new CreatorComics.fromJson(json['comics']) : null;
		fullName = json['fullName'];
		resourceURI = json['resourceURI'];
		suffix = json['suffix'];
		firstName = json['firstName'];
		if (json['urls'] != null) {
			urls = new List<CreatorUrl>();(json['urls'] as List).forEach((v) { urls.add(new CreatorUrl.fromJson(v)); });
		}
		series = json['series'] != null ? new CreatorSeries.fromJson(json['series']) : null;
		modified = json['modified'];
		middleName = json['middleName'];
		id = json['id'];
		events = json['events'] != null ? new CreatorEvents.fromJson(json['events']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastName'] = this.lastName;
		if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
		if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
		if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
		data['fullName'] = this.fullName;
		data['resourceURI'] = this.resourceURI;
		data['suffix'] = this.suffix;
		data['firstName'] = this.firstName;
		if (this.urls != null) {
      data['urls'] =  this.urls.map((v) => v.toJson()).toList();
    }
		if (this.series != null) {
      data['series'] = this.series.toJson();
    }
		data['modified'] = this.modified;
		data['middleName'] = this.middleName;
		data['id'] = this.id;
		if (this.events != null) {
      data['events'] = this.events.toJson();
    }
		return data;
	}
}

class CreatorThumbnail {
	String path;
	String extension;

	CreatorThumbnail({this.path, this.extension});

	CreatorThumbnail.fromJson(Map<String, dynamic> json) {
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

class CreatorStories {
	String collectionURI;
	int available;
	int returned;
	List<CreatorStoriesItem> items;

	CreatorStories({this.collectionURI, this.available, this.returned, this.items});

	CreatorStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorStoriesItem>();(json['items'] as List).forEach((v) { items.add(new CreatorStoriesItem.fromJson(v)); });
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

class CreatorStoriesItem {
	String name;
	String resourceURI;
	String type;

	CreatorStoriesItem({this.name, this.resourceURI, this.type});

	CreatorStoriesItem.fromJson(Map<String, dynamic> json) {
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

class CreatorComics {
	String collectionURI;
	int available;
	int returned;
	List<CreatorComicsItem> items;

	CreatorComics({this.collectionURI, this.available, this.returned, this.items});

	CreatorComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorComicsItem>();(json['items'] as List).forEach((v) { items.add(new CreatorComicsItem.fromJson(v)); });
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

class CreatorComicsItem {
	String name;
	String resourceURI;

	CreatorComicsItem({this.name, this.resourceURI});

	CreatorComicsItem.fromJson(Map<String, dynamic> json) {
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

class CreatorUrl {
	String type;
	String url;

	CreatorUrl({this.type, this.url});

	CreatorUrl.fromJson(Map<String, dynamic> json) {
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

class CreatorSeries {
	String collectionURI;
	int available;
	int returned;
	List<CreatorSeriesItem> items;

	CreatorSeries({this.collectionURI, this.available, this.returned, this.items});

	CreatorSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<CreatorSeriesItem>();(json['items'] as List).forEach((v) { items.add(new CreatorSeriesItem.fromJson(v)); });
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

class CreatorSeriesItem {
	String name;
	String resourceURI;

	CreatorSeriesItem({this.name, this.resourceURI});

	CreatorSeriesItem.fromJson(Map<String, dynamic> json) {
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

class CreatorEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	CreatorEvents({this.collectionURI, this.available, this.returned, this.items});

	CreatorEvents.fromJson(Map<String, dynamic> json) {
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
