From: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [Qemu-devel] [PATCH v3] xen/pt: allow passthrough
 of devices with bogus interrupt pin
Date: Tue, 4 Dec 2018 23:59:24 -0500
Message-ID: <20181205045924.GA12364__27314.9757566445$1543986241$gmane$org@joy-OptiPlex-7040>
References: <20181204075049.10285-1-yan.y.zhao@intel.com>
 <20181204093018.d6vhfdwg276pf7ja@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bgwp=oo=intel.com=yan.y.zhao@srs-us1.protection.inumbo.net>)
 id 1gUPMm-0006ik-4P
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 05:04:56 +0000
Content-Disposition: inline
In-Reply-To: <20181204093018.d6vhfdwg276pf7ja@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMDQsIDIwMTggYXQgMTA6MzA6MThBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIERlYyAwNCwgMjAxOCBhdCAwMjo1MDo0OUFNIC0wNTAwLCBaaGFv
IFlhbiB3cm90ZToKPiA+IEZvciBzb21lIHBjaSBkZXZpY2UsIGV2ZW4gaXRzIFBDSV9JTlRFUlJV
UFRfUElOIGlzIG5vdCAwLCBpdCBhY3R1YWxseQo+ID4gZG9lc24ndCBzdXBwb3J0IElOVHggbW9k
ZSwgc28gaXRzIG1hY2hpbmUgaXJxIHJlYWQgZnJvbSBob3N0IHN5c2ZzIGlzIDAuCj4gPiBJbiB0
aGF0IGNhc2UsIHJlcG9ydCBQQ0lfSU5URVJSVVBUX1BJTiBhcyAwIHRvIGd1ZXN0IGFuZCBsZXQg
cGFzc3Rocm91Z2gKPiA+IGNvbnRpbnVlLgo+ID4gCj4gPiBDYzogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBDYzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbyBZYW4gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+
IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiAKPiBPbmUgbml0IGJlbG93LgpHb3QgaXQuIFRoYW5rIHlvdSEKOikKPiAKPiA+IAo+ID4gLS0t
Cj4gPiB2MjogZml4IHNvbWUgY29kaW5nIHN0eWxlIGlzc3VlCj4gPiB2MzoKPiA+ICAgIDEuIGxl
dCBzdWJqZWN0IGJlIG1vcmUgZGVzY3JpcHRpdmUgKHJvZ2VyKQo+ID4gICAgMi4gZGlzYWJsZSBJ
TlR4IGFzc2VydGlvbiBpZiBtYWNoaW5lIGlycSBpcyAwLihyb2dlcikKPiA+ICAgIDMuIGluIHhl
bl9wdF9pcnFwaW5fcmVnX2luaXQoKSwgZHJvcCB0aGUgZWxzZSBicmFuY2ggYXMgdGhlIGRlZmF1
bHQKPiA+IHZhbHVlIGZvciAqZGF0YSBpcyAwLiAocm9nZXIpCj4gPiAtLS0KPiA+ICBody94ZW4v
eGVuX3B0LmMgICAgICAgICAgICAgfCA3ICsrKysrKysKPiA+ICBody94ZW4veGVuX3B0X2NvbmZp
Z19pbml0LmMgfCA0ICsrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5fcHQuYyBiL2h3
L3hlbi94ZW5fcHQuYwo+ID4gaW5kZXggZTVhNmVmZi4uYjU2MzgzNyAxMDA2NDQKPiA+IC0tLSBh
L2h3L3hlbi94ZW5fcHQuYwo+ID4gKysrIGIvaHcveGVuL3hlbl9wdC5jCj4gPiBAQCAtODQ3LDYg
Kzg0NywxMyBAQCBzdGF0aWMgdm9pZCB4ZW5fcHRfcmVhbGl6ZShQQ0lEZXZpY2UgKmQsIEVycm9y
ICoqZXJycCkKPiA+ICAgICAgfQo+ID4gIAo+ID4gICAgICBtYWNoaW5lX2lycSA9IHMtPnJlYWxf
ZGV2aWNlLmlycTsKPiA+ICsgICAgaWYgKG1hY2hpbmVfaXJxID09IDApIHsKPiA+ICsgICAgICAg
IFhFTl9QVF9MT0coZCwgIm1hY2hpbmUgaXJxIGlzIDBcbiIpOwo+ID4gKyAgICAgICAgY21kIHw9
IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsKPiA+ICsgICAgICAgIHMtPm1hY2hpbmVfaXJxID0g
MDsKPiAKPiBBRkFJQ1QgdGhpcyBpcyBhbHJlYWR5IGluaXRpYWxpemVkIHRvIDAsIHNvIHlvdSBj
YW4gZHJvcCBzZXR0aW5nCj4gbWFjaGluZV9pcnEuCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
