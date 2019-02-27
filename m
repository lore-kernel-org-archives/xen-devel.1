From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Wed, 27 Feb 2019 03:25:22 -0700
Message-ID: <5C766592020000780021AA17@prv1-mh.provo.novell.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gywP2-0003pD-IP
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 10:25:28 +0000
In-Reply-To: <20190226230351.12882-1-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDAwOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFmdGVyIHVwZ3JhZGluZyBEZWJpYW4gdG8gQnVzdGVyLCBJIHN0YXJ0ZWQgbm90aWNpbmcgY29u
c29sZSBtYW5nbGluZwo+IHdoZW4gdXNpbmcgenNoLiBUaGlzIGlzIGhhcHBlbm5pbmcgYmVjYXVz
ZSBvdXRwdXQgc2VudCBieSB6c2ggdG8gdGhlCj4gY29uc29sZSBtYXkgY29udGFpbiBOVUwgY2hh
cmFjdGVyIGluIHRoZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlci4KPiAKPiBMaW51eCBpcyBzZW5kaW5n
IHRoZSBidWZmZXIgYXMgaXQgaXMgdG8gWGVuIGNvbnNvbGUgdmlhIENPTlNPTEVJT193cml0ZS4K
PiBIb3dldmVyLCB0aGUgaW1wbGVtZW50YXRpb24gaW4gWGVuIGNvbnNpZGVycyBOVUwgY2hhcmFj
dGVyIGlzIHVzZWQgdG8KPiB0ZXJtaW5hdGUgdGhlIGJ1ZmZlciBhbmQgdGhlcmVmb3JlIHdpbGwg
aWdub3JlIGFueXRoaW5nIGFmdGVyIGl0Lgo+IAo+IFRoZSBhY3R1YWwgZG9jdW1lbnRhdGlvbiBv
ZiBDT05TT0xFSU9fd3JpdGUgaXMgcHJldHR5IGxpbWl0ZWQuIEZyb20gdGhlCj4gZGVjbGFyYXRp
b24sIHRoZSBoeXBlcmNhbGwgdGFrZXMgYSBidWZmZXIgYW5kIHNpemUuIFNvIHRoaXMgY291bGQg
bGVhZAo+IHRvIHRoaW5rIHRoZSBOVUwgY2hhcmFjdGVyIGlzIGFsbG93ZWQgaW4gdGhlIG1pZGRs
ZSBvZiB0aGUgYnVmZmVyLgo+IAo+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgY29uc29sZSBBUEkg
dG8gcGFzcyB0aGUgc2l6ZSBhbG9uZyB0aGUgYnVmZmVyCj4gZG93biBzbyB3ZSBjYW4gcmVtb3Zl
IHRoZSByZWxpYW5jZSBvbiBidWZmZXIgdGVybWluYXRpbmcgYnkgYSBOVUwKPiBjaGFyYWN0ZXIu
CgpXZSBkb24ndCBuZWVkIHRoZSBiZWhhdmlvciBmb3IgaW50ZXJuYWwgcHJvZHVjZXJzLCBzbyBJ
IHRoaW5rIHRoZSBjaGFuZ2UKdG91Y2hlcyB3YXkgdG9vIG11Y2ggY29kZS4gSSB0aGluayBhbGwg
eW91IG5lZWQgdG8gZG8gaXMgbWFrZSB0aGUKaHlwZXJjYWxsIGhhbmRsZXIgc2Vuc2UgbnVsbCBj
aGFyYWN0ZXJzLCBhbmQgcGVyaGFwcyBzaW1wbHkgaW52b2tlIGxvd2VyCmxldmVsIGhhbmRsZXJz
IG11bHRpcGxlIHRpbWVzLiBPciByZXBsYWNlIHRoZW0gYnkgc29tZXRoaW5nIGVsc2UgKGUuZy4g
YQpibGFuaykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
