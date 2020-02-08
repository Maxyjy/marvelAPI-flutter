class StoriesDataEntity {
	String copyright;
	int code;
	StoriesDataData data;
	String attributionHTML;
	String attributionText;
	String etag;
	String status;

	StoriesDataEntity({this.copyright, this.code, this.data, this.attributionHTML, this.attributionText, this.etag, this.status});

	StoriesDataEntity.fromJson(Map<String, dynamic> json) {
		copyright = json['copyright'];
		code = json['code'];
		data = json['data'] != null ? new StoriesDataData.fromJson(json['data']) : null;
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

class StoriesDataData {
	int total;
	int offset;
	int limit;
	int count;
	List<StoriesDataDataResult> results;

	StoriesDataData({this.total, this.offset, this.limit, this.count, this.results});

	StoriesDataData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		offset = json['offset'];
		limit = json['limit'];
		count = json['count'];
		if (json['results'] != null) {
			results = new List<StoriesDataDataResult>();(json['results'] as List).forEach((v) { results.add(new StoriesDataDataResult.fromJson(v)); });
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

class StoriesDataDataResult {
	dynamic thumbnail;
	StoriesDataDataResultsCreators creators;
	StoriesDataDataResultsComics comics;
	String description;
	String resourceURI;
	String title;
	String type;
	StoriesDataDataResultsCharacters characters;
	StoriesDataDataResultsOriginalissue originalIssue;
	StoriesDataDataResultsSeries series;
	String modified;
	int id;
	StoriesDataDataResultsEvents events;

	StoriesDataDataResult({this.thumbnail, this.creators, this.comics, this.description, this.resourceURI, this.title, this.type, this.characters, this.originalIssue, this.series, this.modified, this.id, this.events});

	StoriesDataDataResult.fromJson(Map<String, dynamic> json) {
		thumbnail = json['thumbnail'];
		creators = json['creators'] != null ? new StoriesDataDataResultsCreators.fromJson(json['creators']) : null;
		comics = json['comics'] != null ? new StoriesDataDataResultsComics.fromJson(json['comics']) : null;
		description = json['description'];
		resourceURI = json['resourceURI'];
		title = json['title'];
		type = json['type'];
		characters = json['characters'] != null ? new StoriesDataDataResultsCharacters.fromJson(json['characters']) : null;
		originalIssue = json['originalIssue'] != null ? new StoriesDataDataResultsOriginalissue.fromJson(json['originalIssue']) : null;
		series = json['series'] != null ? new StoriesDataDataResultsSeries.fromJson(json['series']) : null;
		modified = json['modified'];
		id = json['id'];
		events = json['events'] != null ? new StoriesDataDataResultsEvents.fromJson(json['events']) : null;
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

class StoriesDataDataResultsCreators {
	String collectionURI;
	int available;
	int returned;
	List<StoriesCreatorsItem> items;

	StoriesDataDataResultsCreators({this.collectionURI, this.available, this.returned, this.items});

	StoriesDataDataResultsCreators.fromJson(Map<String, dynamic> json) {
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
      data['items'] =  [];
    }
		return data;
	}
}

class StoriesDataDataResultsComics {
	String collectionURI;
	int available;
	int returned;
	List<StoriesDataDataResultsComicsItem> items;

	StoriesDataDataResultsComics({this.collectionURI, this.available, this.returned, this.items});

	StoriesDataDataResultsComics.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<StoriesDataDataResultsComicsItem>();(json['items'] as List).forEach((v) { items.add(new StoriesDataDataResultsComicsItem.fromJson(v)); });
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

class StoriesDataDataResultsComicsItem {
	String name;
	String resourceURI;

	StoriesDataDataResultsComicsItem({this.name, this.resourceURI});

	StoriesDataDataResultsComicsItem.fromJson(Map<String, dynamic> json) {
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

class StoriesDataDataResultsCharacters {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	StoriesDataDataResultsCharacters({this.collectionURI, this.available, this.returned, this.items});

	StoriesDataDataResultsCharacters.fromJson(Map<String, dynamic> json) {
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

class StoriesDataDataResultsOriginalissue {
	String name;
	String resourceURI;

	StoriesDataDataResultsOriginalissue({this.name, this.resourceURI});

	StoriesDataDataResultsOriginalissue.fromJson(Map<String, dynamic> json) {
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

class StoriesDataDataResultsSeries {
	String collectionURI;
	int available;
	int returned;
	List<StoriesDataDataResultsSeriesItem> items;

	StoriesDataDataResultsSeries({this.collectionURI, this.available, this.returned, this.items});

	StoriesDataDataResultsSeries.fromJson(Map<String, dynamic> json) {
		collectionURI = json['collectionURI'];
		available = json['available'];
		returned = json['returned'];
		if (json['items'] != null) {
			items = new List<StoriesDataDataResultsSeriesItem>();(json['items'] as List).forEach((v) { items.add(new StoriesDataDataResultsSeriesItem.fromJson(v)); });
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

class StoriesDataDataResultsSeriesItem {
	String name;
	String resourceURI;

	StoriesDataDataResultsSeriesItem({this.name, this.resourceURI});

	StoriesDataDataResultsSeriesItem.fromJson(Map<String, dynamic> json) {
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

class StoriesDataDataResultsEvents {
	String collectionURI;
	int available;
	int returned;
	List<Null> items;

	StoriesDataDataResultsEvents({this.collectionURI, this.available, this.returned, this.items});

	StoriesDataDataResultsEvents.fromJson(Map<String, dynamic> json) {
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
