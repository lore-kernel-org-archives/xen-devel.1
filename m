From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 16:23:24 +0100
Message-ID: <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5uc4-0000zj-AX
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:23:28 +0000
Content-Disposition: inline
In-Reply-To: <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
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

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDk6MTk6NTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA5LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIFNlcCAyOCwgMjAxOCBhdCAwOTowODozNEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjguMDkuMTggYXQgMTA6MjQsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
Pj4gPiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+ID4+ID4gQEAgLTkxLDcgKzkx
LDggQEAgc3RhdGljIHVpbnQzMl90IGNvbnJpbmdjLCBjb25yaW5ncDsKPiA+PiA+ICBzdGF0aWMg
aW50IF9fcmVhZF9tb3N0bHkgc2VyY29uX2hhbmRsZSA9IC0xOwo+ID4+ID4gIAo+ID4+ID4gICNp
ZmRlZiBDT05GSUdfWDg2Cj4gPj4gPiAtc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfY29u
c29sZV94ZW47IC8qIGNvbnNvbGU9eGVuICovCj4gPj4gPiArLyogU2V0IHRvIHRydWUgYXQgc3Rh
cnQgb2YgZGF5IHRvIGNhdGNoIGVhcmx5IGJvb3QgaXNzdWVzICovCj4gPj4gPiArc3RhdGljIGJv
b2wgX19yZWFkX21vc3RseSBvcHRfY29uc29sZV94ZW4gPSB0cnVlOyAvKiBjb25zb2xlPXhlbiAq
Lwo+ID4+IAo+ID4+IFdoZW4gQW5kcmV3IHN1Z2dlc3RlZCB0aGlzLCBpaXJjIGhlIHNhaWQgdG8g
bWFrZSB0aGUgdmFyaWFibGUKPiA+PiB0cmlzdGF0ZS4gT3RoZXJ3aXNlIC4uLgo+ID4gCj4gPiBJ
IGZpZ3VyZSBpdCBkb2Vzbid0IG5lZWQgdG8gYmUgdHJpc3RhdGUuCj4gPiAKPiA+PiAKPiA+PiA+
IEBAIC04MjEsNiArODIyLDEwIEBAIHZvaWQgX19pbml0IGNvbnNvbGVfaW5pdF9wcmVpcnEodm9p
ZCkKPiA+PiA+ICAKPiA+PiA+ICAgICAgc2VyaWFsX2luaXRfcHJlaXJxKCk7Cj4gPj4gPiAgCj4g
Pj4gPiArI2lmZGVmIENPTkZJR19YODYKPiA+PiA+ICsgICAgb3B0X2NvbnNvbGVfeGVuID0gZmFs
c2U7Cj4gPj4gPiArI2VuZGlmCj4gPj4gCj4gPj4gLi4uIHlvdSBwb3NzaWJseSBvdmVycmlkZSBh
IHVzZXIgc3BlY2lmaWVkICJ0cnVlIiBoZXJlLgo+ID4gCj4gPiBEbyBJPyBUaGlzIGlzIHJpZ2h0
IGJlZm9yZSBvcHRpb24gcGFyc2luZywgZHVyaW5nIHdoaWNoIG9wdF9jb25zb2xlX3hlbgo+ID4g
aXMgc2V0Lgo+IAo+IEhtbSwgSSBzZWUgLSBJIGRpZG4ndCByZWNhbGwgd2Ugc3RpbGwgaGF2ZSB0
aGlzIGFkIGhvYyBwYXJzaW5nIGluCj4gcGxhY2UsIGluc3RlYWQgb2YgdXNpbmcgY3VzdG9tX3Bh
cmFtKCkuIEJ1dCBpc24ndCB0aGlzIHRvbyBlYXJseSB0aGVuLAo+IGFzIG1lc3NhZ2VzIGlzc3Vl
ZCBmcm9tIHRoZSBwYXJzaW5nIGNvZGUgdGhlbiB3b3VsZCBub3QgYmUgdmlzaWJsZT8KClRvIG1l
IGl0IGRvZXNuJ3QgbWFrZSBhbnl0aGluZyB3b3JzZSB0aGFuIGJlZm9yZS4gQnV0IEkgc2VlIHlv
dXIgcG9pbnQuCkkgd2lsbCBzZWUgaWYgdGhlcmUgaXMgYW4gZWFzeSB3YXkgdG8gZml4IHRoaXMu
CgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
