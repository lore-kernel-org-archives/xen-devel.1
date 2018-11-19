From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Mon, 19 Nov 2018 12:03:31 +0000
Message-ID: <20181119120330.GA2448@perard.uk.xensource.com>
References: <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
 <20181017160559.GB2755@mail-itl>
 <23515.12398.298018.490061@mariner.uk.xensource.com>
 <20181101173207.GB1638@mail-itl>
 <20181115174144.GM1302@perard.uk.xensource.com>
 <20181115185708.GI781@mail-itl>
 <20181116103907.GN1302@perard.uk.xensource.com>
 <20181118172553.GN781@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yqkT=N6=citrix.com=prvs=854a4b331=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gOiH9-0005qH-J5
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:03:35 +0000
Content-Disposition: inline
In-Reply-To: <20181118172553.GN781@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBOb3YgMTgsIDIwMTggYXQgMDY6MjU6NTNQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIEZyaSwgTm92IDE2LCAyMDE4IGF0IDEwOjM5OjA3QU0g
KzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gVGhlICdndWVzdC1zeW5jLWRlbGltaXRl
ZCcgY29tbWFuZCBkb2Vzbid0IHNlZW1zIHRvIGJlIGF2YWlsYWJsZSBvbiB0aGUKPiA+IG1vbml0
b3Igc29ja2V0LiBJIHNob3VsZCBoYXZlIGNoZWNrZWQgdGhhdCAuLi4gYnV0IHRoYXQgd291bGQg
anVzdCBtZWFuCj4gPiB0aGF0IGxpYnhsIHdvdWxkIG5lZWQgdG8gdG9sZXJhdGUgdGhlIGZpcnN0
IHJlYWQgdG8gYmUgYW4gaW5jb21wbGV0ZWQKPiA+IGpzb24tb2JqZWN0LiBUaGVuIHdlIGNhbiB1
c2UgdGhlICdpZCcgdGhhdCBldmVyeSByZXNwb25zZSBoYXZlIHRvIGZpZ3VyZQo+ID4gb3V0IGlm
IGl0IHdhcyBhIHJlcGx5IHNlbnQgdG8gYSBwcmV2aW91cyBsaWJ4bCBydW4uIFdlIGNhbiBtYXli
ZSBlbmNvZGUKPiA+IHRoZSBwaWQgaW50byB0aGUgaWQuCj4gCj4gSXQgbWF5IGJlIHRyaWNreSB0
byBmaWd1cmUgb3V0IHdoZXJlIGlzIHRoZSBlbmQgb2Ygc3VjaCBpbmNvbXBsZXRlIGpzb24KPiBv
YmplY3QuLi4gU3VwcG9zZSB5b3UgcmVhZDoKPiAKPiB7ICJ4IjogeyAieSI6IDEgfSB9IH0KPiAK
PiBJZiB5b3UgcmVhZCB0aGlzIGZyb20gdGhlIGJlZ2lubmluZyBsb29raW5nIGZvciBqc29uLCB5
b3UnbGwgZ2V0IHZhbGlkCj4ganNvbiBvYmplY3QgdW5sZXNzIHlvdSBlbmNvdW50ZXIgdGhlIGxh
c3QgIn0iICh3aGljaCB5b3UgbWF5IHJlY2VpdmUgaW4KPiBzZXBhcmF0ZSByZWFkKCkgY2FsbCwg
aWYgeW91J3JlIHVubHVja3kpLiBJJ20gYWZyYWlkIHRoZSBsb2dpYyBmb3IKPiBza2lwcGluZyBp
bml0aWFsIChwb3NzaWJseSBpbmNvbXBsZXRlKSBvYmplY3QocykgbWF5IGJlIHF1aXRlIGNvbXBs
ZXguCgpJdCdzIG5vdCB0aGF0IGNvbXBsZXgsIGFsbCBtZXNzYWdlcyBzZW50IGJ5IFFFTVUgYXJl
IHRlcm1pbmF0ZWQgYnkgQ1JMRiwKdGhhdCBwYXJ0IG9mIHRoZSBwcm90b2NvbC4gU28gSSB0aGlu
ayB0aGF0IGxpYnhsIGFscmVhZHkgcmV0dXJuIGFuIGVycm9yCmlmIGl0IGdldCBzb21ldGhpbmcg
bGlrZTogJ3sgInoiOiAyIH0gfVxyXG4nLCBiZWNhdXNlIG9mIHRoYXQgZXh0cmEgfQp0aGF0IHNo
b3VsZCBub3QgYmUgdGhlcmUuCgo+IE1heWJlIGJldHRlciBwcm9wb3NlIHVwc3RyZWFtIHRvIGlu
Y2x1ZGUgJ2d1ZXN0LXN5bmMtZGVsaW1pdGVkJyBhbHNvIG9uCj4gbW9uaXRvciBzb2NrZXQgdG9v
PyBJbiB0aGF0IGNhc2UsIHRoZSBjb21tYW5kIG5hbWluZyB3aWxsIGJlIGF3a3dhcmQsCj4gYnV0
IHN0aWxsLCBzaW1pbGFyIGNvbW1hbmQgd291bGQgYmUgdXNlZnVsIGluIHRoYXQgY29udGV4dC4K
Ckl0IG1pZ2h0IGJlIHVzZWZ1bGwgdG8gaGF2ZS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
