From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 3/9] libxl: Get rid of support for
 QEMU_USER_BASE (xen-qemuuser-domidNN)
Date: Wed, 28 Nov 2018 17:02:30 +0000
Message-ID: <516E2908-A45E-44CE-94C1-F11D8A10195C@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-3-george.dunlap@citrix.com>
 <23550.50094.781157.267276@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/wkf=oh=citrix.com=prvs=86304e188=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gS3F8-0003e3-MY
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:03:18 +0000
In-Reply-To: <23550.50094.781157.267276@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <6F4CC0C7AAFF4E4E8F2CDCE74E4665D6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIE5vdiAyOCwgMjAxOCwgYXQgNDozNCBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0gg
My85XSBsaWJ4bDogR2V0IHJpZCBvZiBzdXBwb3J0IGZvciBRRU1VX1VTRVJfQkFTRSAoeGVuLXFl
bXV1c2VyLWRvbWlkTk4pIik6DQo+PiBRRU1VX1VTRVJfQkFTRSBhbGxvd3MgYSB1c2VyIHRvIHNw
ZWNpZnkgdGhlIFVJRCB0byB1c2Ugd2hlbiBydW5uaW5nDQo+PiB0aGUgZGV2aWNlbW9kZWwgZm9y
IGEgc3BlY2lmaWMgZG9tYWluIG51bWJlci4gIFVuZm9ydHVuYXRlbHksIHRoaXMgaXMNCj4+IG5v
dCByZWFsbHkgcHJhY3RpY2FsOiBJdCByZXF1aXJlcyBuZWFybHkgMzIsMDAwIGVudHJpZXMgaW4N
Cj4+IC9ldGMvcGFzc3dkLiAgUUVNVV9VU0VSX1JBTkdFX0JBU0UgaXMgbXVjaCBtb3JlIHByYWN0
aWNhbC4NCj4gDQo+IElzIHRoZSBwcmVzZW5jZSBvZiB0aGlzIGNvZGUgY2F1c2luZyBhIHByb2Js
ZW0gPyAgSSBhbSBoYXBweSB0bw0KPiBkZWNsYXJlIGl0IHVuc3VwcG9ydGVkLg0KPiANCj4gSSBw
cm92aWRlZCBpdCBiZWNhdXNlIHRoZSBiZWhhdmlvdXIgb2YgY2hvb3NpbmcgYSB1aWQgd2hpY2gg
aGFzICpubyoNCj4gcGFzc3dkIGVudHJ5IG1pZ2h0IHJlYXNvbmFibHkgYmUgcmVnYXJkZWQgYXMg
YW5vbWFsb3VzIGFuZA0KPiB1bmRlc2lyYWJsZS4NCj4gDQo+IEkgaGF2ZSB1c2VkIHN5c3RlbXMg
d2l0aCBPKDMyaykgcGFzc3dvcmQgZmlsZSBlbnRyaWVzIGZvciByZWFsDQo+IHVzZXJz4oCmDQoN
CldpdGggUUVNVV9VU0VSX0JBU0UsIHRoZXJlIGFyZSA1IHFlbXUgdWlkIGNhc2VzIHRvIGNvbnNp
ZGVyIChyb290LCBkZXZpY2VfbW9kZWxfdXNlciwgUUVNVV9VU0VSX1JBTkdFX0JBU0UsIFFFTVVf
VVNFUl9CQVNFLCBhbmQgUUVNVV9VU0VSX1NIQVJFRCkuICBIYXZpbmcgb25lIGxlc3MganVzdCBz
aW1wbGlmaWVzIHRoZSB0aGlua2luZyBhbmQgdGhlIGxvZ2ljLiAgU2luY2UgSSBjb25zaWRlcmVk
IFFFTVVfVVNFUl9CQVNFIHRvIGJlIGltcHJhY3RpY2FsLCBJIHRob3VnaHQgcmF0aGVyIHRoYW4g
c3BlbmQgdGltZSByZWFzb25pbmcgYWJvdXQgaXQsIEnigJlkIGp1c3QgZGVsZXRlIGl0Lg0KDQpJ
4oCZZCBwZXJzb25hbGx5IGp1c3QgYXMgc29vbiBsZWF2ZSBpdCBvdXQgKGFuZCBhZGQgaXQgYmFj
ayBpbiBpZiBzb21lb25lIGFza3MgZm9yIGl0KSwgYnV0IGlmIHlvdSB0aGluayBpdCBoYXMgdmFs
dWUgSSBjYW4gbGVhdmUgaXQgaW4gYW5kIGRvIHRoZSB3b3JrIG9mIHRoaW5raW5nIGFib3V0IHRo
ZSBsb2dpYy4NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
