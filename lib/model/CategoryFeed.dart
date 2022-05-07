class CategoryFeed {
  String? version;
  String? encoding;
  Feed? feed;

  CategoryFeed({this.version, this.encoding, this.feed});

  CategoryFeed.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    encoding = json['encoding'];
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['encoding'] = encoding;
    if (feed != null) {
      data['feed'] = feed!.toJson();
    }
    return data;
  }
}

class Feed {
  String? xmlLang;
  String? xmlns;
  String? xmlnsDcterms;
  String? xmlnsThr;
  String? xmlnsApp;
  String? xmlnsOpensearch;
  String? xmlnsOpds;
  String? xmlnsXsi;
  String? xmlnsOdl;
  String? xmlnsSchema;
  Id? id;
  Id? title;
  Id? updated;
  Id? icon;
  Author? author;
  List<Link>? link;
  Id? opensearchTotalResults;
  Id? opensearchItemsPerPage;
  Id? opensearchStartIndex;
  List<Entry>? entry;

  Feed(
      {this.xmlLang,
        this.xmlns,
        this.xmlnsDcterms,
        this.xmlnsThr,
        this.xmlnsApp,
        this.xmlnsOpensearch,
        this.xmlnsOpds,
        this.xmlnsXsi,
        this.xmlnsOdl,
        this.xmlnsSchema,
        this.id,
        this.title,
        this.updated,
        this.icon,
        this.author,
        this.link,
        this.opensearchTotalResults,
        this.opensearchItemsPerPage,
        this.opensearchStartIndex,
        this.entry});

  Feed.fromJson(Map<String, dynamic> json) {
    xmlLang = json['xml:lang'];
    xmlns = json[r'xmlns'];
    xmlnsDcterms = json[r'xmlns$dcterms'];
    xmlnsThr = json[r'xmlns$thr'];
    xmlnsApp = json[r'xmlns$app'];
    xmlnsOpensearch = json[r'xmlns$opensearch'];
    xmlnsOpds = json[r'xmlns$opds'];
    xmlnsXsi = json[r'xmlns$xsi'];
    xmlnsOdl = json[r'xmlns$odl'];
    xmlnsSchema = json[r'xmlns$schema'];
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    title = json['title'] != null ? Id.fromJson(json['title']) : null;
    updated = json['updated'] != null ? Id.fromJson(json['updated']) : null;
    icon = json['icon'] != null ? Id.fromJson(json['icon']) : null;
    author =
    json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['link'] != null) {
      link = <Link>[];
      json['link'].forEach((v) {
        link!.add(Link.fromJson(v));
      });
    }
    opensearchTotalResults = json[r'opensearch$totalResults'] != null
        ? Id.fromJson(json[r'opensearch$totalResults'])
        : null;
    opensearchItemsPerPage = json[r'opensearch$itemsPerPage'] != null
        ? Id.fromJson(json[r'opensearch$itemsPerPage'])
        : null;
    opensearchStartIndex = json[r'opensearch$startIndex'] != null
        ? Id.fromJson(json[r'opensearch$startIndex'])
        : null;
    if (json['entry'] != null) {
      String? t = json['entry'].runtimeType.toString();
      if (t == 'List<dynamic>' || t == '_GrowableList<dynamic>') {
        entry = <Entry>[];
        json['entry'].forEach((v) {
          entry!.add(Entry.fromJson(v));
        });
      } else {
        entry = <Entry>[];
        entry!.add(Entry.fromJson(json['entry']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xml:lang'] = xmlLang;
    data[r'xmlns'] = xmlns;
    data[r'xmlns$dcterms'] = xmlnsDcterms;
    data[r'xmlns$thr'] = xmlnsThr;
    data[r'xmlns$app'] = xmlnsApp;
    data[r'xmlns$opensearch'] = xmlnsOpensearch;
    data[r'xmlns$opds'] = xmlnsOpds;
    data[r'xmlns$xsi'] = xmlnsXsi;
    data[r'xmlns$odl'] = xmlnsOdl;
    data[r'xmlns$schema'] = xmlnsSchema;
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (updated != null) {
      data['updated'] = updated!.toJson();
    }
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (link != null) {
      data['link'] = link!.map((v) => v.toJson()).toList();
    }
    if (opensearchTotalResults != null) {
      data[r'opensearch$totalResults'] = opensearchTotalResults!.toJson();
    }
    if (opensearchItemsPerPage != null) {
      data[r'opensearch$itemsPerPage'] = opensearchItemsPerPage!.toJson();
    }
    if (opensearchStartIndex != null) {
      data[r'opensearch$startIndex'] = opensearchStartIndex!.toJson();
    }
    if (entry != null) {
      data['entry'] = entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Id {
  String? t;

  Id({this.t});

  Id.fromJson(Map<String, dynamic> json) {
    t = json[r'$t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[r'$t'] = t;
    return data;
  }
}

class Author {
  Id? name;
  Id? uri;
  Id? email;

  Author({this.name, this.uri, this.email});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Id.fromJson(json['name']) : null;
    uri = json['uri'] != null ? Id.fromJson(json['uri']) : null;
    email = json['email'] != null ? Id.fromJson(json['email']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (uri != null) {
      data['uri'] = uri!.toJson();
    }
    if (email != null) {
      data['email'] = email!.toJson();
    }
    return data;
  }
}

class Link {
  String? rel;
  String? type;
  String? href;
  String? title;
  String? opdsActiveFacet;
  String? opdsFacetGroup;
  String? thrCount;

  Link(
      {this.rel,
        this.type,
        this.href,
        this.title,
        this.opdsActiveFacet,
        this.opdsFacetGroup,
        this.thrCount});

  Link.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
    title = json['title'];
    opdsActiveFacet = json['opds:activeFacet'];
    opdsFacetGroup = json['opds:facetGroup'];
    thrCount = json['thr:count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rel'] = rel;
    data['type'] = type;
    data['href'] = href;
    if(title != null){
      data['title'] = title;
    }
    data['opds:activeFacet'] = opdsActiveFacet;
    data['opds:facetGroup'] = opdsFacetGroup;
    data['thr:count'] = thrCount;
    return data;
  }
}

class Entry {
  Id? title;
  Id? id;
  Author1? author;
  Id? published;
  Id? updated;
  Id? dctermsLanguage;
  Id? dctermsPublisher;
  Id? dctermsIssued;
  Id? summary;
  List<Category>? category;
  List<Link1>? link;
  SchemaSeries? schemaSeries;

  Entry(
      {this.title,
        this.id,
        this.author,
        this.published,
        this.updated,
        this.dctermsLanguage,
        this.dctermsPublisher,
        this.dctermsIssued,
        this.summary,
        this.category,
        this.link,
        this.schemaSeries});

  Entry.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Id.fromJson(json['title']) : null;
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    if (json['author'] != null) {
      if (json['author'].runtimeType.toString() == 'List<dynamic>') {
        author = Author1.fromJson(json['author'][0]);
      } else {
        author = Author1.fromJson(json['author']);
      }
    }

    published =
    json['published'] != null ? Id.fromJson(json['published']) : null;
    updated = json['updated'] != null ? Id.fromJson(json['updated']) : null;
    dctermsLanguage = json[r'dcterms$language'] != null
        ? Id.fromJson(json[r'dcterms$language'])
        : null;
    dctermsPublisher = json[r'dcterms$publisher'] != null
        ? Id.fromJson(json[r'dcterms$publisher'])
        : null;
    dctermsIssued = json[r'dcterms$issued'] != null
        ? Id.fromJson(json[r'dcterms$issued'])
        : null;
    summary = json['summary'] != null ? Id.fromJson(json['summary']) : null;
    if (json['category'] != null) {
      String? t = json['category'].runtimeType.toString();
      if (t == 'List<dynamic>' || t == '_GrowableList<dynamic>') {
        category = <Category>[];
        json['category'].forEach((v) {
          category!.add(Category.fromJson(v));
        });
      } else {
        category = <Category>[];
        category!.add(Category.fromJson(json['category']));
      }
    }
    if (json['link'] != null) {
      link = <Link1>[];
      json['link'].forEach((v) {
        link!.add(Link1.fromJson(v));
      });
    }
    schemaSeries = json[r'schema$Series'] != null
        ? SchemaSeries.fromJson(json[r'schema$Series'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (published != null) {
      data['published'] = published!.toJson();
    }
    if (updated != null) {
      data['updated'] = updated!.toJson();
    }
    if (dctermsLanguage != null) {
      data[r'dcterms$language'] = dctermsLanguage!.toJson();
    }
    if (dctermsPublisher != null) {
      data[r'dcterms$publisher'] = dctermsPublisher!.toJson();
    }
    if (dctermsIssued != null) {
      data[r'dcterms$issued'] = dctermsIssued!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (link != null) {
      data['link'] = link!.map((v) => v.toJson()).toList();
    }
    if (schemaSeries != null) {
      data[r'schema$Series'] = schemaSeries!.toJson();
    }
    return data;
  }
}

class Author1 {
  Id? name;
  Id? uri;

  Author1({this.name, this.uri});

  Author1.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Id.fromJson(json['name']) : null;
    uri = json['uri'] != null ? Id.fromJson(json['uri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (uri != null) {
      data['uri'] = uri!.toJson();
    }
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

class Link1 {
  String? type;
  String? rel;
  String? title;
  String? href;

  Link1({this.type, this.rel, this.title, this.href});

  Link1.fromJson(Map<String, dynamic> json) {
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

class SchemaSeries {
  String? schemaPosition;
  String? schemaName;
  String? schemaUrl;

  SchemaSeries({this.schemaPosition, this.schemaName, this.schemaUrl});

  SchemaSeries.fromJson(Map<String, dynamic> json) {
    schemaPosition = json[r'schema:position'];
    schemaName = json[r'schema:name'];
    schemaUrl = json[r'schema:url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[r'schema:position'] = schemaPosition;
    data[r'schema:name'] = schemaName;
    data[r'schema:url'] = schemaUrl;
    return data;
  }
}
