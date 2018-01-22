From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/shim: stash RSDP address for ACPI driver
Date: Mon, 22 Jan 2018 06:35:14 -0700
Message-ID: <5A65F6A202000078001A11C6@prv-mh.provo.novell.com>
References: <20180122124710.29590-1-wei.liu2@citrix.com>
 <20180122130314.gcxwlpgrhm323qdp@MacBook-Pro-de-Roger.local>
 <20180122132136.72f4gpv3fduofn3a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edcFx-0007HK-2S
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 13:35:25 +0000
In-Reply-To: <20180122132136.72f4gpv3fduofn3a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE0OjIxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMDE6MDM6MTRQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4gT24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMTI6NDc6MTBQTSArMDAwMCwgV2Vp
IExpdSB3cm90ZToKPj4gPiAtLS0gYS94ZW4vZHJpdmVycy9hY3BpL29zbC5jCj4+ID4gKysrIGIv
eGVuL2RyaXZlcnMvYWNwaS9vc2wuYwo+PiA+IEBAIC0zOCw2ICszOCwxMCBAQAo+PiA+ICAjaW5j
bHVkZSA8eGVuL2VmaS5oPgo+PiA+ICAjaW5jbHVkZSA8eGVuL3ZtYXAuaD4KPj4gPiAgCj4+ID4g
KyNpZmRlZiBDT05GSUdfUFZIX0dVRVNUCj4+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvcHZoLWJv
b3QuaD4KPj4gPiArI2VuZGlmCj4+ID4gKwo+PiA+ICAjZGVmaW5lIF9DT01QT05FTlQJCUFDUElf
T1NfU0VSVklDRVMKPj4gPiAgQUNQSV9NT0RVTEVfTkFNRSgib3NsIikKPj4gPiAgCj4+ID4gQEAg
LTc0LDYgKzc4LDExIEBAIGFjcGlfcGh5c2ljYWxfYWRkcmVzcyBfX2luaXQgYWNwaV9vc19nZXRf
cm9vdF9wb2ludGVyKHZvaWQpCj4+ID4gIAkJCSAgICAgICAiU3lzdGVtIGRlc2NyaXB0aW9uIHRh
YmxlcyBub3QgZm91bmRcbiIpOwo+PiA+ICAJCQlyZXR1cm4gMDsKPj4gPiAgCQl9Cj4+ID4gKyNp
ZmRlZiBDT05GSUdfUFZIX0dVRVNUCj4+ID4gKwl9IGVsc2UgaWYgKHB2aF9ib290KSB7Cj4+ID4g
KwkJQVNTRVJUKHB2aF9yc2RwX3BhKTsKPj4gPiArCQlyZXR1cm4gcHZoX3JzZHBfcGE7Cj4+ID4g
KyNlbmRpZgo+PiA+ICAJfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19BQ1BJX0xFR0FDWV9U
QUJMRVNfTE9PS1VQKSkgewo+PiA+ICAJCWFjcGlfcGh5c2ljYWxfYWRkcmVzcyBwYSA9IDA7Cj4+
IAo+PiBDYW4gdGhpcyBiZSBkb25lIGluIGEgbm9uLVBWSCBzcGVjaWZpYyB3YXk/Cj4+IAo+PiBD
YW4gd2UgaGF2ZSBhIGdsb2JhbCByc2RwX2hpbnQgdmFyaWFibGUgb3Igc2ltaWxhciB0aGF0IHdv
dWxkIGJlIHVzZWQKPj4gaGVyZSBpZiBzZXQ/Cj4gCj4gV2hvIHdpbGwgYmUgdGhlIGFudGljaXBh
dGVkIHVzZXIocykgb3RoZXIgdGhhbiBQVkg/CgpUaGF0J3Mgbm90IHNvIG11Y2ggdGhlIHF1ZXN0
aW9uIGhlcmUgaW1vLiBJbnN0ZWFkIHRoZSBpc3N1ZSBJCnNlZSBpcyB0aGF0IHRoZSB3YXkgeW91
IGNvZGUgaXQgaXQncyByZWFsbHkgYSBsYXllcmluZyB2aW9sYXRpb24uClNpbWlsYXIgaGFja2Vy
eSB3YXMgYWxzbyByZWplY3RlZCBpbiBMaW51eCByZWNlbnRseSwgaWlyYy4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
