//
//  Article.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation

struct Article: Identifiable, Decodable {
    var id = UUID()
    
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let publishedAt: Date
    let content: String
    
    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    init(source: Source, author: String?, title: String, description: String?, url: URL, urlToImage: URL?, publishedAt: Date, content: String) {
        self.id = UUID()
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        source = try values.decode(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decode(URL.self, forKey: .url)
        do {
            urlToImage = try values.decodeIfPresent(URL.self, forKey: .urlToImage)
        } catch {
            urlToImage = nil
        }
        publishedAt = try values.decode(Date.self, forKey: .publishedAt)
        content = try values.decode(String.self, forKey: .content)
    }
    
    static var exampleArticle = Article(
        source: Source.exampleSource,
        author: "Justin Calma",
        title: "Can banks push Bitcoin to clean up its act?",
        description: "Banks and asset managers have a big stake in Bitcoin, so Greenpeace wants them to crack down on the cryptocurrency’s pollution.",
        url: URL(string: "https://www.theverge.com/2023/7/11/23778688/bitcoin-energy-emissions-climate-change-banks-asset-managers-greenpeace")!,
        urlToImage: URL(string: "https://cdn.vox-cdn.com/thumbor/ODx_QBV2qCE_dfhHtwtaZ8W6J8I=/0x0:7144x4743/1200x628/filters:focal(3572x2372:3573x2373)/cdn.vox-cdn.com/uploads/chorus_asset/file/24763884/1235926940.jpg") ?? nil,
        publishedAt: Date(),
        content: "Can banks push Bitcoin to clean up its act?\r\nCan banks push Bitcoin to clean up its act?\r\n / Banks and asset managers have a big stake in Bitcoin, so Greenpeace wants them to crack down on the crypto… [+4372 chars]")
}
