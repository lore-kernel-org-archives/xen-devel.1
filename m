From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: Access I2C bus from guest/DomU on ARM board
Date: Wed, 31 Jan 2018 17:06:10 +0200
Message-ID: <74fb0cae-875a-d93b-233c-8819b3d89d8e@epam.com>
References: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
 <37217807-7f20-bdbf-f852-033fcae1bd01@epam.com>
 <CAONE6OCM9wEd6zJCH5147vTMWyt4CGH9uXbBX0y29di9cC3QaQ@mail.gmail.com>
 <bc345300-7e46-367f-4e16-db1ffa4e56d0@epam.com>
 <CAONE6OAUJ+SjvYkiAaT-0Y_8av4T0dX60R8o2OZum6g8Ucg+1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+8su=e2=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1egtxz-0002u4-Jg
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 15:06:27 +0000
In-Reply-To: <CAONE6OAUJ+SjvYkiAaT-0Y_8av4T0dX60R8o2OZum6g8Ucg+1w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Saumya Rajesh <saumyarajesh93@gmail.com>
Cc: xen-devel@lists.xenproject.org, embedded-pv-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU2F1bXlhLAoKCk9uIDE4LjAxLjE4IDA5OjUwLCBTYXVteWEgUmFqZXNoIHdyb3RlOgo+
IEFjdHVhbGx5IEkgYW0gcGxhbm5pbmcgdG8gc2V0IHVwIEFuZHJvaWQgYXMgZ3Vlc3QgaW4gWGVu
LgpJIHNlZS4KCj4gSW4gb3JkZXIgdG8gZW5hYmxlIHNvdW5kIGluIHRoZSBBbmRyb2lkIGd1ZXN0
LCBJIG5lZWQgdG8gcGFzc3Rocm91Z2ggCj4gdGhlIGF1ZGlvIGNvZGVjIGRldmljZSB3aGljaCBj
b21tdW5pY2F0ZXMgdGhyb3VnaCB0aGUgSTJDIGJ1cy4gRm9yIAo+IEJFL0ZFIHNjaGVtZSwgSSB0
aGluayBzaGFyaW5nIHRoZSBpbnRlcm5hbCBETUEgYW5kIGNsb2NrIHdvdWxkIHBvc2UgCj4gcHJv
YmxlbXMuIFNvIEknbSBnb2luZyB0byBnbyBhaGVhZCB3aXRoIHRoZSBkZXZpY2UgcGFzc3Rocm91
Z2ggd2F5LgpQYXNzaW5nIHRocm91Z2ggSTJDIGJ1cyB0byBndWVzdCBkb21haW4gd291bGQgbm90
IGJlIGVub3VnaCB0byBnZXQgc291bmQgCmluIEFuZHJvaWQuIFlvdSB3b3VsZCBmYWNlIG1vcmUg
ZGVwZW5kZW5jaWVzLCBhbmQgdGhleSBtYXkgYXBwZWFyIG5vdCAKc29sdmFibGUuCgo+IEFueSB0
aG91Z2h0cyBvciBpbnB1dHMgeW91IGNhbiBwb3NzaWJseSBnaXZlIHJlZ2FyZGluZyB0aGlzIHVz
ZSBjYXNlIAo+IHdpbGwgYmUgdmVyeSBoZWxwZnVsIGFuZCB2YWx1YWJsZS4KV2UgYXJlIHVzaW5n
IFBWIEF1ZGlvIHNvbHV0aW9uIGZvciBzdWNoIGEgdGFzazoKCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0wMy9tc2cwMjQyOC5odG1sCmh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE3LzgvNy8xMTUKCi0tIAoKKkFuZHJpaSBBbmlzb3YqCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
