From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 7/9] libxl: Make killing of device model
 asynchronous
Date: Fri, 30 Nov 2018 16:12:29 +0000
Message-ID: <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-7-george.dunlap@citrix.com>
 <23550.50595.50966.218438@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ngE=OJ=citrix.com=prvs=86598431a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSlP7-0005QX-VA
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:12:33 +0000
In-Reply-To: <23550.50595.50966.218438@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <A7DB624C34AA5A45971EF56C470831CE@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIE5vdiAyOCwgMjAxOCwgYXQgNDo0MyBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IEdlb3JnZSBEdW5sYXAgd3JpdGVzICgiW1BBVENIIDcv
OV0gbGlieGw6IE1ha2Uga2lsbGluZyBvZiBkZXZpY2UgbW9kZWwgYXN5bmNocm9ub3VzIik6Cj4+
IE9yIGF0IGxlYXN0LCBnaXZlIGl0IGFuIGFzeW5jaHJvbm91cyBpbnRlcmZhY2Ugc28gdGhhdCB3
ZSBjYW4gbWFrZSBpdAo+PiBhY3R1YWxseSBhc3luY2hyb25vdXMgaW4gc3Vic2VxdWVudCBwYXRj
aGVzLgo+PiAKPj4gQ3JlYXRlIHN0YXRlIHN0cnVjdHVyZXMgYW5kIGNhbGxiYWNrIGZ1bmN0aW9u
IHNpZ25hdHVyZXMuICBBZGQgdGhlCj4+IHN0YXRlIHN0cnVjdHVyZSB0byBsaWJ4bF9fZGVzdHJv
eV9kb21pZF9zdGF0ZS4gIEJyZWFrCj4+IGxpYnhsX19kZXN0cm95X2RvbWlkIGRvd24gaW50byB0
d28gZnVuY3Rpb25zLgo+IC4uLgo+PiArLyogVXNlZCB0byBkZXRyb3kgdGhlIGRldmljZSBtb2Rl
bCAqLwo+PiArX2hpZGRlbiB2b2lkIGxpYnhsX19kZXN0cm95X2RldmljZV9tb2RlbChsaWJ4bF9f
ZWdjICplZ2MsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxp
YnhsX19kZXN0cm95X2RldmljZW1vZGVsX3N0YXRlICpkZG1zKTsKPiAKPiBJIHRoaW5rIHRoYXQg
Y29tbWVudCBpcyByYXRoZXIgcG9pbnRsZXNzIChidXQgSSB3b24ndCBvYmplY3QgaWYgeW91Cj4g
cmVhbGx5IHdhbnQgdG8ga2VlcCBpdCkuICAKClllczsgdGhhdCBjb21tZW50IGxvb2tzIHJhdGhl
ciB2ZXN0aWdhbC4KCj4gQ29udmVyc2VseSBpdCB3b3VsZCBiZSBuaWNlIHRvIHNheSBzb21ld2hl
cmUKPiB0aGF0IGRkbXMtPmNhbGxiYWNrIG1heSBiZSBjYWxsZWQgcmVlbnRyYW50bHkuCgpXaGF0
IGRvIHlvdSBtZWFuIGJ5IHJlZW50cmFudGx5PyAgVGhhdCBsaWJ4bF9fZGVzdHJveV9kZXZpY2Vf
bW9kZWwoKSBtYXkgZW5kIHVwIGNhbGxpbmcgaXQgZGlyZWN0bHkgKG9uIHRoaXMgZXhlY3V0aW9u
IHN0YWNrKSwgcmF0aGVyIHRoYW4gYXJyYW5naW5nIGZvciBpdCB0byBiZSBjYWxsZWQgYnkgc29t
ZW9uZSBlbHNlIGFmdGVyIHJldHVybmluZz8KCiAtR2VvcmdlCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
