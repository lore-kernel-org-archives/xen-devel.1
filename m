From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
Date: Wed, 24 Apr 2019 16:28:52 +0100
Message-ID: <465a455c-d809-2dc1-8e28-ed0ddb3bc7f2@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
 <20190418114627.GC30543@zion.uk.xensource.com>
 <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJJpS-0007jb-4Y
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:28:58 +0000
In-Reply-To: <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpASWFuLCBAV2VpOiBHZW50bGUgcGluZy4KCk9uIDE4LzA0LzIwMTkgMTY6MDksIEp1bGll
biBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAxOC8wNC8yMDE5IDEyOjQ2LCBXZWkgTGl1IHdy
b3RlOgo+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAwNjo0Mjo0N1BNICswMTAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBAV2VpLCBASWFuOiBEbyB5b3UgaGF2ZSBhbnkg
aW5wdXQ/Cj4+Cj4+IFNvcnJ5IEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyB0aGlzIGNsb3NlbHks
IGJ1dCBzaG91bGRuJ3Qgd2UgZml4IHRoZQo+PiBpbnRlcmZhY2UgdG8gcmV0dXJuIGdmbiBpbnN0
ZWFkPyBBbmQgdGhlbiB0aGUgbWFwcGluZyBvZiBpdCBzaG91bGQKPj4gaW50ZXJwcmV0IHRoZSB2
YWx1ZSBwcm9wZXJseSBwZXIgZ3Vlc3QgdHlwZS4KPiAKPiBXZSBhbHJlYWR5IHJldHVybiBhIEdG
TiB0b2RheS4gVGhlIHByb2JsZW0gaXMgd2Ugb25seSBob2xkIGFuIE1GTiBhdCB0aGF0IHRpbWUu
Cj4gCj4gQXQgdGhlIG1vbWVudCwgd2UgcmVseSBvbiB0aGUgTTJQIHRvIGZpbmQgdGhlIGNvcnJl
c3BvbmRpbmcgR0ZOLiBBcyB3ZSBkb24ndCAKPiBoYXZlIGFuIE0yUCBvbiBBcm0sIHdlIHdvdWxk
IGhhdmUgdG8gc3RvcmUgdGhlIGFzc29jaWF0ZWQgR0ZOLgo+IAo+IEJ1dCBhbGwgdGhpcyBsb2dp
YyBpcyBhIGJpdCBicm9rZW4uIEl0IHJlbGllcyBvbiB0aGUgdG9vbHN0YWNrIChvciB0aGUgZ3Vl
c3QpIHRvIAo+IGhhdmUgbWFwcGVkIHRoZSBzaGFyZWQgaW5mbyBmcmFtZSBpbiB0aGUgUDJNIHVz
aW5nIHRoZSBwaHlzbWFwIGh5cGVydmlzb3Igd2l0aCAKPiBYRU5NQVBTUEFDRV9zaGFyZWRfaW5m
byBiZWZvcmVoYW5kLiBUaGlzIGlzIGFsc28gcmFjeSBhcyB5b3UgbWF5IHJldHVybiBhIEdGTiAK
PiB0aGF0IHdhcyB1bm1hcHBlZC9yZW1hcHBlZCB0byBzb21ldGhpbmcgZWxzZSBiZWZvcmUgdGhl
IHRvb2xzdGFjayBoYXMgYSBjaGFuY2UgCj4gdG8gbWFwIGluIGl0cyBhZGRyZXNzIHNwYWNlIHRo
ZSBwYWdlLgo+IAo+IFRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHBoYXNlIG91dCB0
aGUgZmllbGQgc2hhcmVkX2luZm9fZnJhbWUgYW5kIHVzZSAKPiBYRU5NRU1fYWNxdWlyZV9yZXNv
dXJjZSBpbnN0ZWFkLiBIb3dldmVyLCB0aGlzIHJlcXVpcmVzIHRoZSBhc3NvY2lhdGVkIGlvY3Rs
IHRvIAo+IGJlIGltcGxlbWVudGVkIGluIExpbnV4Lgo+IAo+Pgo+PiBJIGRvbid0IHNlZSBpbW1l
ZGlhdGVseSBob3cgdXNlciBzcGFjZSBwcm9ncmFtIHdpbGwgbmVlZCB0byBhY2Nlc3MgdGhpcwo+
PiBwYWdlIGZvciBhdXRvdHJhbnNsYXRlZCBndWVzdHMgdGhvdWdoLgo+IAo+IElmIHRoZXJlIGFy
ZSBubyB1c2UsIHRoZW4gSSBhbSBub3QgY29udmluY2VkIGl0IGlzIHdvcnRoIHRyeWluZyB0byBt
YWtlIAo+IHNoYXJlZF9pbmZvX2ZyYW1lIHdvcmtpbmcgb24gQXJtLgo+IAo+IENoZWVycywKPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
