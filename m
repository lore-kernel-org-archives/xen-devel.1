From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 8/9] viridian: add implementation of
 synthetic timers
Date: Thu, 31 Jan 2019 14:46:04 +0000
Message-ID: <20190131144604.rl46qldaehbqnwlw@zion.uk.xensource.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UmBj=QH=citrix.com=prvs=927d2e39f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpDbU-0002Bv-Mr
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:46:08 +0000
Content-Disposition: inline
In-Reply-To: <20190131104730.2085-9-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTA6NDc6MjlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU1RJ
TUVSMC0xNV9DT05GSUcvQ09VTlQgTVNScwo+IGFuZCBoZW5jZSBhIHRoZSBmaXJzdCBTeW5JQyBt
ZXNzYWdlIHNvdXJjZS4KPiAKPiBUaGUgbmV3IChhbmQgZG9jdW1lbnRlZCkgJ3N0aW1lcicgdmly
aWRpYW4gZW5saWdodGVubWVudCBncm91cCBtYXkgYmUKPiBzcGVjaWZpZWQgdG8gZW5hYmxlIHRo
aXMgZmVhdHVyZS4KPiAKPiBOT1RFOiBJdCBpcyBuZWNlc3NhcnkgZm9yIGNvcnJlY3Qgb3BlcmF0
aW9uIHRoYXQgdGltZXIgZXhwaXJhdGlvbiBhbmQKPiAgICAgICBtZXNzYWdlIGRlbGl2ZXJ5IHRp
bWUtc3RhbXBpbmcgdXNlIHRoZSBzYW1lIHRpbWUgc291cmNlIGFzIHRoZSBndWVzdC4KPiAgICAg
ICBUaGUgc3BlY2lmaWNhdGlvbiBpcyBhbWJpZ3VvdXMgYnV0IHRlc3Rpbmcgd2l0aCBhIFdpbmRv
d3MgMTAgMTgwMwo+ICAgICAgIGd1ZXN0IGhhcyBzaG93biB0aGF0IHVzaW5nIHRoZSBwYXJ0aXRp
b24gcmVmZXJlbmNlIGNvdW50ZXIgYXMgYQo+ICAgICAgIHNvdXJjZSB3aGlsc3QgdGhlIGd1ZXN0
IGlzIHVzaW5nIFJEVFNDIGFuZCB0aGUgcmVmZXJlbmNlIHRzYyBwYWdlCj4gICAgICAgZG9lcyBu
b3Qgd29yayBjb3JyZWN0bHkuIFRoZXJlZm9yZSB0aGUgdGltZV9ub3coKSBmdW5jdGlvbiBpcyB1
c2VkLgo+ICAgICAgIFRoaXMgaW1wbGVtZW50cyB0aGUgYWxnb3JpdGhtIGZvciBhY3F1aXJpbmcg
cGFydGl0aW9uIHJlZmVyZW5jZSB0aW1lCj4gICAgICAgdGhhdCBpcyBkb2N1bWVudGVkIGluIHRo
ZSBzcGVjaWZpY3Rpb24uIFRoaXMgcmVxdWlyZXMgdXNlIG9mIDEyOC1iaXQKPiAgICAgICBhcml0
aG1ldGljIGFuZCBoZW5jZSBfX2ludDEyOF90IHZhbHVlcyBhcmUgdXNlZCBpbiB0aGUgY2FsY3Vs
YXRpb24sCj4gICAgICAgYWx0aG91Z2ggdGhlIHJlc3VsdCBpcyBhIHNpZ25lZCA2NC1iaXQgdmFs
dWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KPiAtLS0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5E
dW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogVGltIERlZWdhbiA8dGltQHhl
bi5vcmc+Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
Cj4gdjM6Cj4gIC0gUmUtd29ya2VkIG1pc3NlZCB0aWNrcyBjYWxjdWxhdGlvbgo+IC0tLQo+ICBk
b2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgICB8ICAxMiArLQo+ICB0b29scy9s
aWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gIHRvb2xzL2xpYnhsL2xp
YnhsX2RvbS5jICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgdG9vbHMvbGlieGwvbGlieGxfdHlw
ZXMuaWRsICAgICAgICAgICAgfCAgIDEgKwoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
