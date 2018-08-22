From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v7 5/6] x86/iommu: switch the hwdom mapping
 function to use page_get_type
Date: Wed, 22 Aug 2018 10:45:46 +0100
Message-ID: <20180822094546.od5pte5nhphsjgmc@citrix.com>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsPi2-0003I2-Ao
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 09:45:50 +0000
Content-Disposition: inline
In-Reply-To: <20180822075200.50278-6-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDk6NTE6NTlBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoaXMgYXZvaWRzIHJlcGVhdGVkIGNhbGxzIHRvIHBhZ2VfaXNfcmFtX3R5cGUg
d2hpY2ggaW1wcm92ZXMKPiBwZXJmb3JtYW5jZSBhbmQgbWFrZXMgdGhlIGNvZGUgZWFzaWVyIHRv
IHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKPiAtLS0KPiBDaGFu
Z2VzIHNpbmNlIHY0Ogo+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCj4gLS0tCj4gQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gveDg2L2lvbW11LmMgfCA2MCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPiBpbmRleCAyNWUxZWJmOGIzLi5iOTQ3ZWQ2MDQzIDEw
MDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPiBAQCAtMTM0LDYgKzEzNCwzNyBA
QCB2b2lkIGFyY2hfaW9tbXVfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKPiAgewo+
ICB9Cj4gIAo+ICtzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXQgaHdkb21faW9tbXVfbWFwKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBwZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtYXhfcGZuKQoKQ29uc2lkZXIgdXNpbmcgdHlwZS1z
YWZlIHR5cGVzIGlmIHBvc3NpYmxlPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
