class CategoryFeed {
  String? lang;
  String? id;
  String? title;
  String? updated;
  String? icon;
  Author? author;
  List<Link>? link;
  String? totalResults;
  String? itemsPerPage;
  String? startIndex;
  List<Entry>? entry;

  CategoryFeed(
      {this.lang,
        this.id,
        this.title,
        this.updated,
        this.icon,
        this.author,
        this.link,
        this.totalResults,
        this.itemsPerPage,
        this.startIndex,
        this.entry});

  CategoryFeed.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    id = json['id'];
    title = json['title'];
    updated = json['updated'];
    icon = json['icon'];
    author =
    json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['link'] != null) {
      link = <Link>[];
      json['link'].forEach((v) {
        link!.add(Link.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    itemsPerPage = json['itemsPerPage'];
    startIndex = json['startIndex'];
    if (json['entry'] != null) {
      entry = <Entry>[];
      json['entry'].forEach((v) {
        entry!.add(Entry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lang'] = lang;
    data['id'] = id;
    data['title'] = title;
    data['updated'] = updated;
    data['icon'] = icon;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (link != null) {
      data['link'] = link!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = totalResults;
    data['itemsPerPage'] = itemsPerPage;
    data['startIndex'] = startIndex;
    if (entry != null) {
      data['entry'] = entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String? name;
  String? uri;
  String? email;

  Author({this.name, this.uri, this.email});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uri = json['uri'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uri'] = uri;
    data['email'] = email;
    return data;
  }
}

class Link {
  String? rel;
  String? type;
  String? href;
  String? title;
  String? activeFacet;
  String? facetGroup;
  String? count;

  Link(
      {this.rel,
        this.type,
        this.href,
        this.title,
        this.activeFacet,
        this.facetGroup,
        this.count});

  Link.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
    title = json['title'];
    activeFacet = json['activeFacet'];
    facetGroup = json['facetGroup'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rel'] = rel;
    data['type'] = type;
    data['href'] = href;
    data['title'] = title;
    data['activeFacet'] = activeFacet;
    data['facetGroup'] = facetGroup;
    data['count'] = count;
    return data;
  }
}

class Entry {
  String? title;
  String? id;
  Author1? author;
  String? published;
  String? updated;
  String? language;
  String? publisher;
  String? issued;
  String? summary;
  List<Category>? category;
  List<LinkEntry>? link;
  Series? series;

  Entry(
      {this.title,
        this.id,
        this.author,
        this.published,
        this.updated,
        this.language,
        this.publisher,
        this.issued,
        this.summary,
        this.category,
        this.link,
        this.series});

  Entry.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    author =
    json['author'] != null ? Author1.fromJson(json['author']) : null;
    published = json['published'];
    updated = json['updated'];
    language = json['language'];
    publisher = json['publisher'];
    issued = json['issued'];
    summary = json['summary'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['link'] != null) {
      link = <LinkEntry>[];
      json['link'].forEach((v) {
        link!.add(LinkEntry.fromJson(v));
      });
    }
    series =
    json['Series'] != null ? Series.fromJson(json['Series']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['published'] = published;
    data['updated'] = updated;
    data['language'] = language;
    data['publisher'] = publisher;
    data['issued'] = issued;
    data['summary'] = summary;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (link != null) {
      data['link'] = link!.map((v) => v.toJson()).toList();
    }
    if (series != null) {
      data['Series'] = series!.toJson();
    }
    return data;
  }
}

class Author1 {
  String? name;
  String? uri;

  Author1({this.name, this.uri});

  Author1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uri'] = uri;
    return data;
  }
}

class Category {
  String? label;
  String? term;
  String? scheme;

  Category({this.label, this.term, this.scheme});

  Category.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    term = json['term'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['term'] = term;
    data['scheme'] = scheme;
    return data;
  }
}

class LinkEntry {
  String? type;
  String? rel;
  String? title;
  String? href;

  LinkEntry({this.type, this.rel, this.title, this.href});

  LinkEntry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    rel = json['rel'];
    title = json['title'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['rel'] = rel;
    data['title'] = title;
    data['href'] = href;
    return data;
  }
}

class Series {
  String? position;
  String? name;
  String? url;

  Series({this.position, this.name, this.url});

  Series.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}