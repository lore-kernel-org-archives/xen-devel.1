From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH RFC 06/10] passthrough/amd: remove guest
 iommu support
Date: Wed, 2 May 2018 12:10:12 -0500
Message-ID: <b9f288bf-ff6a-379f-e777-ae1db72e56df@amd.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-7-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fezt=hv=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1fDvGq-00028m-CI
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 17:10:24 +0000
In-Reply-To: <20180221214701.1646-7-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2VpLAoKT24gMi8yMS8xOCAzOjQ2IFBNLCBXZWkgTGl1IHdyb3RlOgo+IEl0IGlzIG5ldmVyIHVz
ZWQgYW5kIGl0IGlzIGdldHRpbmcgaW4gdGhlIHdheSBvZiBjbGVhbmluZyB1cC4KPiAKPiBUaGUg
b25seSBjYWxsc2l0ZSBvZiBndWVzdF9pb21tdV9hZGRfcHByX2xvZyBoYXMgbm8gZWZmZWN0IGJl
Y2F1c2UKPiBndWVzdCBpb21tdSBpcyBub3QgaW5pdGlhbGlzZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdTx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBTdXJhdmVlIFN1dGhp
a3VscGFuaXQ8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gLS0tCj4gICB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvYW1kL01ha2VmaWxlICAgICAgfCAgIDEgLQo+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2L2FtZC9pb21tdV9ndWVzdC5jIHwgOTI3IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvYW1kL2lvbW11
X2luaXQuYyAgfCAgMjEgKy0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmggICAg
ICAgICAgICAgICB8ICA1MSAtLQo+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1p
b21tdS1wcm90by5oIHwgICA4IC0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaCAgICAg
ICAgICAgICAgICAgICB8ICAgMSAtCj4gICA2IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMTAwMyBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC94ODYvYW1kL2lvbW11X2d1ZXN0LmMKCldvdWxkIGl0IGJlIHRvbyBtdWNoIHRy
b3VibGUgaWYgd2Uga2VlcCB0aGlzIGNvZGUgZm9yIG5vdy4gVGhlcmUgaXMgYSBwbGFuIHRvIHN1
cHBvcnQKSU9NTVUgaW4gZ3Vlc3QgaW4gdGhlIG5lYXIgZnV0dXJlLiBUaGlzIGNvdWxkIGJlIGNs
ZWFuIHVwIGF0IHRoYXQgcG9pbnQgaWYgbm8gbG9uZ2VyCm5lZWRlZC4KClRoYW5rcywKU3VyYXZl
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
