From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next RFC 3/4] pygrub: convert python
 files with 2to3
Date: Tue, 5 Mar 2019 17:51:04 +0000
Message-ID: <ed7db103-1ed4-2fa1-4b10-f7c27e551c1e@citrix.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-4-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rxLf=RI=citrix.com=prvs=96038945f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h1EFc-0006lK-OI
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 17:53:12 +0000
In-Reply-To: <20190305164206.6793-4-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNjo0MiwgV2VpIExpdSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IE5vdCBzdXJlIHRoaXMgd29ya3Mgd2l0
aCBweXRob24gMi40LCBidXQgaXQgc2hvdWxkIHdvcmsgd2l0aCAyLjcgc2luY2UKPiB0aGUgY2hh
bmdlcyBsb29rIG1vcmUgb3IgbGVzcyBpbiB0aGUgc2FtZSB2ZWluIGFzIHRoZSBjaGFuZ2VzIGlu
Cj4gbGlieGwuCj4KPiBUaGUgY29udmVyc2lvbiBvZiB0aGUgaW1wb3J0IGlzIGludGVyZXN0aW5n
LiBUaGlzIGRlZmluaXRlbHkgbmVlZHMKPiBzb21lIHRlc3RpbmcuCj4gLS0tCj4gIHRvb2xzL3B5
Z3J1Yi9zcmMvRXh0TGludXhDb25mLnB5IHwgMTYgKysrKysrKystLS0tLS0tLQo+ICB0b29scy9w
eWdydWIvc3JjL0dydWJDb25mLnB5ICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLQo+ICB0b29scy9weWdydWIvc3JjL0xpbG9Db25mLnB5ICAgICB8IDE2ICsrKysr
KysrLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAzNCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9weWdydWIvc3JjL0V4dExpbnV4Q29uZi5w
eSBiL3Rvb2xzL3B5Z3J1Yi9zcmMvRXh0TGludXhDb25mLnB5Cj4gaW5kZXggZDE3ODliZjAyMC4u
NjBkYTk2MGM0YiAxMDA2NDQKPiAtLS0gYS90b29scy9weWdydWIvc3JjL0V4dExpbnV4Q29uZi5w
eQo+ICsrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvRXh0TGludXhDb25mLnB5Cj4gQEAgLTEyLDcgKzEy
LDcgQEAKPiAgCj4gIGltcG9ydCBzeXMsIHJlLCBvcwo+ICBpbXBvcnQgbG9nZ2luZwo+IC1pbXBv
cnQgR3J1YkNvbmYKPiArZnJvbSAuIGltcG9ydCBHcnViQ29uZgoKUmVsYXRpdmUgaW1wb3J0cyBk
ZWZpbml0ZWx5IGRvbid0IGV4aXN0IGluIFB5IDIuNAoKPiAgCj4gIGNsYXNzIEV4dExpbnV4SW1h
Z2Uob2JqZWN0KToKPiAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBsaW5lcywgcGF0aCk6Cj4gQEAg
LTMyLDcgKzMyLDcgQEAgY2xhc3MgRXh0TGludXhJbWFnZShvYmplY3QpOgo+ICAgICAgICAgIHNl
bGYubGluZXMgPSBbXQo+ICAgICAgICAgIHNlbGYucGF0aCA9IHBhdGgKPiAgICAgICAgICBzZWxm
LnJvb3QgPSAiIgo+IC0gICAgICAgIG1hcChzZWxmLnNldF9mcm9tX2xpbmUsIGxpbmVzKQo+ICsg
ICAgICAgIGxpc3QobWFwKHNlbGYuc2V0X2Zyb21fbGluZSwgbGluZXMpKQoKVGhpcyBhbiBhYnVz
ZSBvZiBtYXAoKSBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCB0aGUgYXV0b21hdGljCnRyYW5zZm9y
bWF0aW9uIG1ha2VzIHRoZSByZXN1bHQgZXZlbiBtb3JlIGNvbmZ1c2luZy4KCkluc3RlYWQsIEkn
ZCByZXdyaXRlIHRoZSBjb2RlIGFzCgpmb3IgbGluZSBpbiBsaW5lczoKwqDCoMKgIHNlbGYuc2V0
X2Zyb21fbGluZShsaW5lKQoKd2hpY2ggbWFrZXMgaXQgY2xlYXIgd2hhdCBpcyBhY3R1YWxseSBn
b2luZyBvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
