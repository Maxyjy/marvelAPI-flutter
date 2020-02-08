class CharacterDataEntity {
	String copyright;
	int code;
	TestData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	CharacterDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	CharacterDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new TestData.fromJson(json['data']) : null;
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

class TestData {
	int total;
	int offset;
	int limit;
	int count;
	List<TestDataResult> results;

	TestData({this.total, this.offset, this.limit, this.count, this.results});

	TestData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<TestDataResult>();(json['results'] as List).forEach((v) { results.add(new TestDataResult.fromJson(v)); });
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

class TestDataResult {
	TestDataResultsThumbnail thumbnail;
	List<TestDataResultsUrl> urls;
	TestDataResultsStories stories;
	TestDataResultsSeries series;
	TestDataResultsComics comics;
	String name;
	String description;
	String modified;
	int id;
	String resourceURI;
	TestDataResultsEvents events;

	TestDataResult({this.thumbnail, this.urls, this.stories, this.series, this.comics, this.name, this.description, this.modified, this.id, this.resourceURI, this.events});

	TestDataResult.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'] != null ? new TestDataResultsThumbnail.fromJson(json['thumbnail']) : null;
		if (json['urls'] != null) {
			urls = new List<TestDataResultsUrl>();(json['urls'] as List).forEach((v) { urls.add(new TestDataResultsUrl.fromJson(v)); });
		}
		stories = json['stories'] != null ? new TestDataResultsStories.fromJson(json['stories']) : null;
		series = json['series'] != null ? new TestDataResultsSeries.fromJson(json['series']) : null;
		comics = json['comics'] != null ? new TestDataResultsComics.fromJson(json['comics']) : null;
		name = json['name'];
		description = json['description'];
		modified = json['modified'];
		id = json['id'];
		resourceURI = json['resourceURI'];
		events = json['events'] != null ? new TestDataResultsEvents.fromJson(json['events']) : null;
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

class TestDataResultsThumbnail {
	String path;
	String extension;

	TestDataResultsThumbnail({this.path, this.extension});

	TestDataResultsThumbnail.fromJson(Map<String, dynamic> json) {
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

class TestDataResultsUrl {
	String type;
	String url;

	TestDataResultsUrl({this.type, this.url});

	TestDataResultsUrl.fromJson(Map<String, dynamic> json) {
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

class TestDataResultsStories {
	String collectionURI;
	int available;
	int returned;
	List<TestDataResultsStoriesItem> items;

	TestDataResultsStories({this.collectionURI, this.available, this.returned, this.items});

	TestDataResultsStories.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<TestDataResultsStoriesItem>();(json['items'] as List).forEach((v) { items.add(new TestDataResultsStoriesItem.fromJson(v)); });
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

class TestDataResultsStoriesItem {
	String name;
	String resourceURI;
	String type;

	TestDataResultsStoriesItem({this.name, this.resourceURI, this.type});

	TestDataResultsStoriesItem.fromJson(Map<String, dynamic> json) {
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

class TestDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<TestDataResultsSeriesItem> items;

	TestDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	TestDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<TestDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new TestDataResultsSeriesItem.fromJson(v)); });
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

class TestDataResultsSeriesItem {
	String name;
	String resourceURI;

	TestDataResultsSeriesItem({this.name, this.resourceURI});

	TestDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class TestDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<TestDataResultsComicsItem> items;

	TestDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	TestDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<TestDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new TestDataResultsComicsItem.fromJson(v)); });
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

class TestDataResultsComicsItem {
	String name;
	String resourceURI;

	TestDataResultsComicsItem({this.name, this.resourceURI});

	TestDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class TestDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<TestDataResultsEventsItem> items;

	TestDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	TestDataResultsEvents.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<TestDataResultsEventsItem>();(json['items'] as List).forEach((v) { items.add(new TestDataResultsEventsItem.fromJson(v)); });
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

class TestDataResultsEventsItem {
	String name;
	String resourceURI;

	TestDataResultsEventsItem({this.name, this.resourceURI});

	TestDataResultsEventsItem.fromJson(Map<String, dynamic> json) {
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
