From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 09:52:57 +0100
Message-ID: <20180831085257.y2gdmrfa65oo5bqc@zion.uk.xensource.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
 <5B88FF3A02000078001E3C75@prv1-mh.provo.novell.com>
 <ee5f404d-c8b3-7f7f-b188-a9097fae65ec@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ya8d=lo=citrix.com=prvs=77401f9b1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fvfAr-0003Oi-Bv
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:53:01 +0000
Content-Disposition: inline
In-Reply-To: <ee5f404d-c8b3-7f7f-b188-a9097fae65ec@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMDk6NTE6NTBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMS8wOC8xOCAwOTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiBPbiAz
MS4wOC4xOCBhdCAxMDozMiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IE9uIEZy
aSwgQXVnIDMxLCAyMDE4IGF0IDEwOjI5OjIxQU0gKzAyMDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+
ID4+PiBDcmVhdGluZyBkZWJ1ZyBpbmZvIGR1cmluZyBidWlsZCBpcyBub3Qgc3RyaWN0bHkgcmVx
dWlyZWQgYXQgcnVudGltZS4KPiA+Pj4gTWFrZSBpdCBvcHRpb25hbCBieSBpbnRyb2R1Y2luZyBh
IG5ldyBLY29uZmlnIGtub2IgIkRFQlVHX0lORk8iLgo+ID4+PiBUaGlzIHNsaWdodGx5IHJlZHVj
ZXMgYnVpbGQgdGltZSBhbmQgZGlza3VzYWdlLCBpZiBkaXNhYmxlZC4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+ID4+PiAtLS0KPiA+Pj4g
IHhlbi9LY29uZmlnLmRlYnVnIHwgNyArKysrKysrCj4gPj4+ICB4ZW4vUnVsZXMubWsgICAgICB8
IDUgKysrKy0KPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4v
S2NvbmZpZy5kZWJ1Zwo+ID4+PiBpbmRleCAzODBjNGU4ZDc1Li4xZDhjMmM5NGE5IDEwMDY0NAo+
ID4+PiAtLS0gYS94ZW4vS2NvbmZpZy5kZWJ1Zwo+ID4+PiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1
Zwo+ID4+PiBAQCAtMTEsNiArMTEsMTMgQEAgY29uZmlnIERFQlVHCj4gPj4+ICAKPiA+Pj4gIAkg
IFlvdSBwcm9iYWJseSB3YW50IHRvIHNheSAnTicgaGVyZS4KPiA+Pj4gIAo+ID4+PiArY29uZmln
IERFQlVHX0lORk8KPiA+Pj4gKwlib29sICJDb21waWxlIFhlbiB3aXRoIGRlYnVnIGluZm8iCj4g
Pj4+ICsJZGVmYXVsdCB5Cj4gPj4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgYmUgZGVm
YXVsdCBERUJVRwo+ID4gSSBkaXNhZ3JlZSAtIC1nIGlzIGJlaW5nIHBhc3NlZCB0byB0aGUgY29t
cGlsZXIgdW5jb25kaXRpb25hbGx5IGF0Cj4gPiBwcmVzZW50Lgo+IAo+ICsxCj4gCj4gRGlzdHJv
IHBhY2thZ2VycyBuZWVkIHRvIGJ1aWxkIGRlYnVnaW5mbyBwYWNrYWdlcywgYW5kIGhhdmluZyBh
IHJlbGVhc2UKPiBidWlsZCBvZiBYZW4gd2l0aCB4ZW4tc3ltcyBsYWNraW5nIGFsbCB0aGUgZGVi
dWcgc3ltYm9scyBpcyBxdWl0ZSB1c2VsZXNzLgoKSSBzZWUuIEkgbWlzdW5kZXJzdG9vZCB0aGUg
aW50ZW50LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
