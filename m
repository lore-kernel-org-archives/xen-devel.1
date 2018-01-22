From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/shim: stash RSDP address for ACPI driver
Date: Mon, 22 Jan 2018 13:47:37 +0000
Message-ID: <20180122134737.3tpsl4g7cdefdrs3@citrix.com>
References: <20180122124710.29590-1-wei.liu2@citrix.com>
 <20180122130314.gcxwlpgrhm323qdp@MacBook-Pro-de-Roger.local>
 <20180122132136.72f4gpv3fduofn3a@citrix.com>
 <5A65F6A202000078001A11C6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wfn3=er=citrix.com=prvs=55302b5eb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1edcSG-0008OF-3M
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 13:48:08 +0000
Content-Disposition: inline
In-Reply-To: <5A65F6A202000078001A11C6@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMDY6MzU6MTRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjAxLjE4IGF0IDE0OjIxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIEphbiAyMiwgMjAxOCBhdCAwMTowMzoxNFBNICswMDAwLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+ID4+IE9uIE1vbiwgSmFuIDIyLCAyMDE4IGF0IDEyOjQ3OjEwUE0g
KzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gPiAtLS0gYS94ZW4vZHJpdmVycy9hY3BpL29zbC5j
Cj4gPj4gPiArKysgYi94ZW4vZHJpdmVycy9hY3BpL29zbC5jCj4gPj4gPiBAQCAtMzgsNiArMzgs
MTAgQEAKPiA+PiA+ICAjaW5jbHVkZSA8eGVuL2VmaS5oPgo+ID4+ID4gICNpbmNsdWRlIDx4ZW4v
dm1hcC5oPgo+ID4+ID4gIAo+ID4+ID4gKyNpZmRlZiBDT05GSUdfUFZIX0dVRVNUCj4gPj4gPiAr
I2luY2x1ZGUgPGFzbS9ndWVzdC9wdmgtYm9vdC5oPgo+ID4+ID4gKyNlbmRpZgo+ID4+ID4gKwo+
ID4+ID4gICNkZWZpbmUgX0NPTVBPTkVOVAkJQUNQSV9PU19TRVJWSUNFUwo+ID4+ID4gIEFDUElf
TU9EVUxFX05BTUUoIm9zbCIpCj4gPj4gPiAgCj4gPj4gPiBAQCAtNzQsNiArNzgsMTEgQEAgYWNw
aV9waHlzaWNhbF9hZGRyZXNzIF9faW5pdCBhY3BpX29zX2dldF9yb290X3BvaW50ZXIodm9pZCkK
PiA+PiA+ICAJCQkgICAgICAgIlN5c3RlbSBkZXNjcmlwdGlvbiB0YWJsZXMgbm90IGZvdW5kXG4i
KTsKPiA+PiA+ICAJCQlyZXR1cm4gMDsKPiA+PiA+ICAJCX0KPiA+PiA+ICsjaWZkZWYgQ09ORklH
X1BWSF9HVUVTVAo+ID4+ID4gKwl9IGVsc2UgaWYgKHB2aF9ib290KSB7Cj4gPj4gPiArCQlBU1NF
UlQocHZoX3JzZHBfcGEpOwo+ID4+ID4gKwkJcmV0dXJuIHB2aF9yc2RwX3BhOwo+ID4+ID4gKyNl
bmRpZgo+ID4+ID4gIAl9IGVsc2UgaWYgKElTX0VOQUJMRUQoQ09ORklHX0FDUElfTEVHQUNZX1RB
QkxFU19MT09LVVApKSB7Cj4gPj4gPiAgCQlhY3BpX3BoeXNpY2FsX2FkZHJlc3MgcGEgPSAwOwo+
ID4+IAo+ID4+IENhbiB0aGlzIGJlIGRvbmUgaW4gYSBub24tUFZIIHNwZWNpZmljIHdheT8KPiA+
PiAKPiA+PiBDYW4gd2UgaGF2ZSBhIGdsb2JhbCByc2RwX2hpbnQgdmFyaWFibGUgb3Igc2ltaWxh
ciB0aGF0IHdvdWxkIGJlIHVzZWQKPiA+PiBoZXJlIGlmIHNldD8KPiA+IAo+ID4gV2hvIHdpbGwg
YmUgdGhlIGFudGljaXBhdGVkIHVzZXIocykgb3RoZXIgdGhhbiBQVkg/Cj4gCj4gVGhhdCdzIG5v
dCBzbyBtdWNoIHRoZSBxdWVzdGlvbiBoZXJlIGltby4gSW5zdGVhZCB0aGUgaXNzdWUgSQo+IHNl
ZSBpcyB0aGF0IHRoZSB3YXkgeW91IGNvZGUgaXQgaXQncyByZWFsbHkgYSBsYXllcmluZyB2aW9s
YXRpb24uCj4gU2ltaWxhciBoYWNrZXJ5IHdhcyBhbHNvIHJlamVjdGVkIGluIExpbnV4IHJlY2Vu
dGx5LCBpaXJjLgo+IAoKT0suIEkgYnV5IHRoaXMgYXJndW1lbnQuCgpMZXQgbWUgaW52ZW50IGEg
cnNkcF9oaW50IGluc3RlYWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
