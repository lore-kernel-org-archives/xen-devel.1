From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v2] don't pass r12 as reference
Date: Thu, 18 Jan 2018 23:14:19 +0000
Message-ID: <CAEC2CxoYTEcDe+F855bStfdoaQ9oqC1TFmaApcbC44BH7WNTAw@mail.gmail.com>
References: <alpine.DEB.2.10.1801151010360.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=z6ef=ad=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ecJO1-0005cV-T0
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 23:14:21 +0000
Received: by mail-qt0-x242.google.com with SMTP id u10so34543565qtg.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 15:14:20 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1801151010360.5767@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDE4IEphbnVhcnkgMjAxOCBhdCAyMTo0OCwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiByMTIgYW5kIHgxNiBhcmUgb2Yg
ZGlmZmVyZW50IHNpemVzOyB3aGVuIHBhc3NpbmcgcjEyIGFzIGEgcmVmZXJlbmNlIHRvCj4gZG9f
dHJhcF9oeXBlcmNhbGwgb24gYXJtNjQsIHdlIGVuZCB1cCBkZXJlZmVyZW5jaW5nIGl0IGFzIGEg
cG9pbnRlciB0byBhCj4gNjRiaXQgdmFsdWUsIGJ1dCBhY3R1YWxseSBpdCBpc24ndC4KPgo+IElu
c3RlYWQsIHVzZSBhIHRlbXBvcmFyeSB2YXJpYWJsZSB0byBwYXNzIHIxMiwgYW5kIHdyaXRlIGJh
Y2sgdGhlIHJlc3VsdAo+IGFmdGVyIHRoZSBjYWxsIHRvIGRvX3RyYXBfaHlwZXJjYWxsLgo+Cj4g
Q0lEOiAxNDU3NzA4Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGxpbmFyby5vcmc+CgpDaGVlcnMsCgo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFw
cy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBpbmRleCAwMTNjMTYwLi42N2E2OGZjIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBz
LmMKPiBAQCAtMjEyMyw2ICsyMTIzLDkgQEAgdm9pZCBkb190cmFwX2d1ZXN0X3N5bmMoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgZG9fdHJhcF9zbWMocmVncywgaHNyKTsK
PiAgICAgICAgICBicmVhazsKPiAgICAgIGNhc2UgSFNSX0VDX0hWQzMyOgo+ICsgICAgewo+ICsg
ICAgICAgIHJlZ2lzdGVyX3QgbnI7Cj4gKwo+ICAgICAgICAgIEdVRVNUX0JVR19PTighcHNyX21v
ZGVfaXNfMzJiaXQocmVncy0+Y3BzcikpOwo+ICAgICAgICAgIHBlcmZjX2luY3IodHJhcF9odmMz
Mik7Cj4gICNpZm5kZWYgTkRFQlVHCj4gQEAgLTIxMzEsOCArMjEzNCwxMSBAQCB2b2lkIGRvX3Ry
YXBfZ3Vlc3Rfc3luYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgI2VuZGlmCj4gICAg
ICAgICAgaWYgKCBoc3IuaXNzID09IDAgKQo+ICAgICAgICAgICAgICByZXR1cm4gZG9fdHJhcF9o
dmNfc21jY2MocmVncyk7Cj4gLSAgICAgICAgZG9fdHJhcF9oeXBlcmNhbGwocmVncywgKHJlZ2lz
dGVyX3QgKikmcmVncy0+cjEyLCBoc3IuaXNzKTsKPiArICAgICAgICBuciA9IHJlZ3MtPnIxMjsK
PiArICAgICAgICBkb190cmFwX2h5cGVyY2FsbChyZWdzLCAmbnIsIGhzci5pc3MpOwo+ICsgICAg
ICAgIHJlZ3MtPnIxMiA9ICh1aW50MzJfdClucjsKPiAgICAgICAgICBicmVhazsKPiArICAgIH0K
PiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAgICAgIGNhc2UgSFNSX0VDX0hWQzY0Ogo+ICAgICAg
ICAgIEdVRVNUX0JVR19PTihwc3JfbW9kZV9pc18zMmJpdChyZWdzLT5jcHNyKSk7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
