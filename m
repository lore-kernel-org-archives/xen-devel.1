From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
Date: Fri, 10 May 2019 08:19:31 -0600
Message-ID: <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
 <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
 <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP6N5-0001SP-0j
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:19:35 +0000
In-Reply-To: <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE2OjA0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4x
OSBhdCAxNTo0MSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IFRoZSBwb2ludCBo
ZXJlLCB3ZSBrZWVwIHdpdGhpbiB0aGUgaHlwZXJ2aXNvciB0aGUgaWRlYSBvZiB3aGF0J3MgdmFs
aWQgb3IKPj4+IGludmFsaWQuIFRoaXMgYWxsb3dzIHVzIG1vcmUgZmxleGliaWxpdHkgb24gdGhl
IHZhbHVlIGhlcmUgKGltYWdpbmUgd2UgZGVjaWRlIHRvCj4+PiBjaGFuZ2UgdGhlIHZhbHVlIG9m
IEdGTl9JTlZBTElEIGluIHRoZSBmdXR1cmUuLi4pLgo+PiAKPj4gRXhhY3RseSwgYW5kIGhlbmNl
IElOVkFMSURfR0ZOIHNob3VsZCBub3QgYmVjb21lIHZpc2libGUgdG8gdGhlCj4+IG91dHNpZGUu
IEhlbmNlIG15IHJlcXVlc3QgdG8gdXNlIGFuIGFsbC1vbmVzIHZhbHVlIGhlcmUuCj4gSXQgaXMg
b25seSB2aXNpYmxlIGlmIHlvdSBwdXQgYW4gZXhhY3QgdmFsdWUgaW4gdGhlIGRvY3VtZW50YXRp
b24uIFlvdXIgCj4gc3VnZ2VzdGlvbiBpcyB0byBwdXQgYSBleGFjdGx5IHZhbHVlIGFuZCBJIHdv
dWxkIHJhdGhlciBub3Qgc2VlIHRoYXQuCgpJIGRpZCBzcGVjaWZpY2FsbHkgc3VnZ2VzdCB0byBf
bm90XyBzdG9yZSBJTlZBTElEX0dGTiBoZXJlLCBidXQgdG8Kc3RvcmUgNjQtYml0IGJpdHMgb2Yg
b25lcy4gTm90ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gb24KMzItYml0IEFybS4K
Cj4+Pj4+IFdlbGwsIGl0IGF0IGxlYXN0IHRlbGwgeW91IHRoZSBmdW5jdGlvbiBjYW4ndCB3b3Jr
LiBTbyBJIHRoaW5rIGl0IGlzIHN0aWxsIG1ha2VzCj4+Pj4+IHNlbnNlIHRvIGhhdmUgaXQuCj4+
Pj4KPj4+PiBJIGRpc2FncmVlLgo+Pj4gWW91IGRpc2FncmVlIGJlY2F1c2UuLi4/Cj4+IAo+PiBC
ZWNhdXNlIG9mIHdoYXQgSSd2ZSBzYWlkIGluIG15IGluaXRpYWwgcmVwbHkgKHN0aWxsIHF1b3Rl
ZCBhYm92ZSkuCj4gCj4gSSBzdGlsbCBkb24ndCBzZWUgdGhlIHByb2JsZW0gb2YgdW5jb25kaXRp
b25hbCBsb2cgbWVzc2FnZS4gSXQgaXMgbm90IHJlYWxseSB0aGUgCj4gZmlyc3QgcGxhY2Ugd2Ug
aGF2ZSB0aGF0Lgo+IAo+PiAKPj4+IEkgaG9wZSB5b3UgYXJlIGF3YXJlLCB0aGlzIGlzIHVubGlr
ZWx5IGdvaW5nIHRvIGJlIHByaW50ZWQgYXMgdGhlIGNvZGUgc2hvdWxkCj4+PiBub3QgYmUgY2Fs
bGVkLgo+PiAKPj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgdGhlbj8KPiAKPiBBbmQgc3RpbGwgYXZv
aWRpbmcgdGhlIHByaW50az8KClByZWZlcmFibHkgeWVzOyBkZXBlbmRzIG9uIGhvdyBleGFjdGx5
IHlvdSBjb2RlIHRoZSBhc3NlcnRpb24uCklmIHlvdSBmb2xsb3cgdGhlIGlmKCktQVNTRVJUX1VO
UkVBQ0hBQkxFKCktcmV0dXJuIHN0eWxlIHdlJ3ZlCmJlZW4gdXNpbmcgZWxzZXdoZXJlLCB0aGVu
IG5vIG1hdHRlciBob3cgeW91IHBsYWNlIHRoZSAjZWxzZQpvciAjZW5kaWYgdGhlIHByaW50aygp
IHdpbGwgYmUgY29tcGlsZWQgb3V0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
