From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Wed, 27 Feb 2019 12:55:47 +0000
Message-ID: <20190227125547.ab6hlrexbqnhhvew@zion.uk.xensource.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <5C766592020000780021AA17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wyqt=RC=citrix.com=prvs=954d42a2d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gyykd-00035t-WC
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 12:55:56 +0000
Content-Disposition: inline
In-Reply-To: <5C766592020000780021AA17@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgMDM6MjU6MjJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjAyLjE5IGF0IDAwOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdy
b3RlOgo+ID4gQWZ0ZXIgdXBncmFkaW5nIERlYmlhbiB0byBCdXN0ZXIsIEkgc3RhcnRlZCBub3Rp
Y2luZyBjb25zb2xlIG1hbmdsaW5nCj4gPiB3aGVuIHVzaW5nIHpzaC4gVGhpcyBpcyBoYXBwZW5u
aW5nIGJlY2F1c2Ugb3V0cHV0IHNlbnQgYnkgenNoIHRvIHRoZQo+ID4gY29uc29sZSBtYXkgY29u
dGFpbiBOVUwgY2hhcmFjdGVyIGluIHRoZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlci4KPiA+IAo+ID4g
TGludXggaXMgc2VuZGluZyB0aGUgYnVmZmVyIGFzIGl0IGlzIHRvIFhlbiBjb25zb2xlIHZpYSBD
T05TT0xFSU9fd3JpdGUuCj4gPiBIb3dldmVyLCB0aGUgaW1wbGVtZW50YXRpb24gaW4gWGVuIGNv
bnNpZGVycyBOVUwgY2hhcmFjdGVyIGlzIHVzZWQgdG8KPiA+IHRlcm1pbmF0ZSB0aGUgYnVmZmVy
IGFuZCB0aGVyZWZvcmUgd2lsbCBpZ25vcmUgYW55dGhpbmcgYWZ0ZXIgaXQuCj4gPiAKPiA+IFRo
ZSBhY3R1YWwgZG9jdW1lbnRhdGlvbiBvZiBDT05TT0xFSU9fd3JpdGUgaXMgcHJldHR5IGxpbWl0
ZWQuIEZyb20gdGhlCj4gPiBkZWNsYXJhdGlvbiwgdGhlIGh5cGVyY2FsbCB0YWtlcyBhIGJ1ZmZl
ciBhbmQgc2l6ZS4gU28gdGhpcyBjb3VsZCBsZWFkCj4gPiB0byB0aGluayB0aGUgTlVMIGNoYXJh
Y3RlciBpcyBhbGxvd2VkIGluIHRoZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlci4KPiA+IAo+ID4gVGhp
cyBwYXRjaCB1cGRhdGVzIHRoZSBjb25zb2xlIEFQSSB0byBwYXNzIHRoZSBzaXplIGFsb25nIHRo
ZSBidWZmZXIKPiA+IGRvd24gc28gd2UgY2FuIHJlbW92ZSB0aGUgcmVsaWFuY2Ugb24gYnVmZmVy
IHRlcm1pbmF0aW5nIGJ5IGEgTlVMCj4gPiBjaGFyYWN0ZXIuCj4gCj4gV2UgZG9uJ3QgbmVlZCB0
aGUgYmVoYXZpb3IgZm9yIGludGVybmFsIHByb2R1Y2Vycywgc28gSSB0aGluayB0aGUgY2hhbmdl
Cj4gdG91Y2hlcyB3YXkgdG9vIG11Y2ggY29kZS4gSSB0aGluayBhbGwgeW91IG5lZWQgdG8gZG8g
aXMgbWFrZSB0aGUKPiBoeXBlcmNhbGwgaGFuZGxlciBzZW5zZSBudWxsIGNoYXJhY3RlcnMsIGFu
ZCBwZXJoYXBzIHNpbXBseSBpbnZva2UgbG93ZXIKPiBsZXZlbCBoYW5kbGVycyBtdWx0aXBsZSB0
aW1lcy4gT3IgcmVwbGFjZSB0aGVtIGJ5IHNvbWV0aGluZyBlbHNlIChlLmcuIGEKPiBibGFuayku
CgpJIGRvbid0IHRoaW5rIHJlcGxhY2luZyBOVUxzIHdpdGggYmxhbmsgaXMgdGhlIHJpZ2h0IHRo
aW5nIHRvIGRvLiBJdCdzCm5vdCBvbmx5IGFib3V0IGhvdyBodW1hbiBwZXJjZWl2ZXMgdGhlIG91
dHB1dCwgYnV0IGFsc28gYWJvdXQgc2NyaXB0aW5nLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
