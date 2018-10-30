From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Tue, 30 Oct 2018 20:50:02 +0000
Message-ID: <20181030205002.3m7x7ybp5ojaiph6@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
 <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHaxk-0000x1-FM
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 20:50:08 +0000
Content-Disposition: inline
In-Reply-To: <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDg6Mjg6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGV5IGFyZSB1c2VmdWwgdG8gUFYgb25seS4KPiAKPiBDb25zaWRlcmluZyB0aGVy
ZSB3YXMgbm8gaXNfe2h2bSxwdn1fLi4uKCkgY2hlY2sgc28gZmFyLCBJIHRoaW5rCj4geW91IG5l
ZWQgdG8gZXh0ZW5kIHRoaXMgYSBsaXR0bGUgcGx1cyAuLi4KCkkgdGhvdWdodCB0aGUgY29kZSB3
YXMgc2VsZi1leHBsYW5hdG9yeSBlbm91Z2guCgpBbnl3YXksIEkgd2lsbCB1cGRhdGUgdGhlIGNv
bW1pdCBtZXNzYWdlIHRvIHRoZSBmb2xsb3dpbmc6CgpHb2luZyB0aHJvdWdoIHRoZSB0b29sc3Rh
Y2sgY29kZSwgdGhpcyBzZXQgb2YgaHlwZXJjYWxscyBpcyBvbmx5IGNhbGxlZApmb3IgUFYgZ3Vl
c3RzIG9uIHg4Ni4KCj4gCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+ID4gQEAgLTYwOCw2ICs2MDgsNyBAQCBsb25nIGFyY2hf
ZG9fZG9tY3RsKAo+ID4gICAgICAgICAgICAgIGNvcHliYWNrID0gdHJ1ZTsKPiA+ICAgICAgICAg
IGJyZWFrOwo+ID4gIAo+ID4gKyNpZmRlZiBDT05GSUdfUFYKPiA+ICAgICAgY2FzZSBYRU5fRE9N
Q1RMX3NldF9hZGRyZXNzX3NpemU6Cj4gPiAgICAgICAgICBpZiAoICgoZG9tY3RsLT51LmFkZHJl
c3Nfc2l6ZS5zaXplID09IDY0KSAmJiAhZC0+YXJjaC5pc18zMmJpdF9wdikgfHwKPiA+ICAgICAg
ICAgICAgICAgKChkb21jdGwtPnUuYWRkcmVzc19zaXplLnNpemUgPT0gMzIpICYmIGQtPmFyY2gu
aXNfMzJiaXRfcHYpICkKPiA+IEBAIC02MjMsNiArNjI0LDcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAo+ID4gQklUU19QRVJfTE9ORzsKPiA+ICAgICAgICAgIGNvcHliYWNrID0g
dHJ1ZTsKPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gKyNlbmRpZgo+IAo+IC4uLiBhZGQgc3VjaCBh
IGNoZWNrIHNvIHRoYXQgc2ltaWxhciBiZWhhdmlvciB3aWxsIHJlc3VsdCB3aXRoIFBWCj4gZW5h
YmxlZCBhbmQgZGlzYWJsZWQgKGVycm9yIGNvZGVzIG1heSBkaWZmZXIsIGJ1dCBzdWNjZXNzIHZz
Cj4gZXJyb3Igb3VnaHQgdG8gbWF0Y2gpLgoKSSBkb24ndCBmb2xsb3cuIERvIHlvdSBtZWFuIGFk
ZGluZyBpc19wdl9kb21haW4gY2hlY2sgc29tZXdoZXJlPwoKV2VpLgoKPiAKPiBKYW4KPiAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
