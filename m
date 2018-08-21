From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 31/34] xen: refuse to create HVM guests when
 !CONFIG_HVM
Date: Tue, 21 Aug 2018 19:35:37 +0100
Message-ID: <d185aaa5-deb8-d576-fb8c-e0d65359c893@arm.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
 <3746e4b4-73ec-bb5e-7944-ec5c98fab9c4@citrix.com>
 <20180821104133.vlg3ngqeqooi4reh@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hivl=le=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsBVF-0004yT-Vn
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 18:35:42 +0000
In-Reply-To: <20180821104133.vlg3ngqeqooi4reh@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMDgvMjEvMjAxOCAxMTo0MSBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24s
IEF1ZyAyMCwgMjAxOCBhdCAwMTo1OTo1N1BNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
PiBPbiAxNy8wOC8yMDE4IDE2OjEyLCBXZWkgTGl1IHdyb3RlOgo+Pj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4gICB4ZW4vY29tbW9uL2Rv
bWFpbi5jIHwgOCArKysrKysrLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMg
Yi94ZW4vY29tbW9uL2RvbWFpbi5jCj4+PiBpbmRleCAxNzFkMjVlLi5hMjJkZjEyIDEwMDY0NAo+
Pj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4u
Ywo+Pj4gQEAgLTMxOCw4ICszMTgsMTQgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShk
b21pZF90IGRvbWlkLAo+Pj4gICAgICAgaWYgKCAhaXNfaWRsZV9kb21haW4oZCkgKQo+Pj4gICAg
ICAgewo+Pj4gICAgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2
bV9ndWVzdCApCj4+Cj4+IEFzIGRpc2NvdmVyZWQgZHVyaW5nIG15IGRvbWFpbiBjcmVhdGlvbiBy
ZXdyaXRlIHdvcmssIGxpYnhsIG9uIEFSTQo+PiBkb2Vzbid0IHNldCBodm0vaGFwLgo+Pgo+PiBJ
TU8sIHRoZXkgc2hvdWxkLCBhbmQgbGlieGwgc2hvdWxkIGJlIGZpeGVkLgo+Pgo+IAo+IElTVFIg
dGhleSB3YW50ZWQgZ3Vlc3QgdHlwZSB0byBiZSBQViBpbiBsaWJ4bC4KCkkgdGhpbmsgdGhhdCB3
YXMgYmVjYXVzZSBQViB3YXMgYWxsb3dpbmcgdXMgdG8gbm90IHN0YXJ0IFFFTVUuIE5vdyB0aGF0
IApQVkggZXhpc3RzIGluIGxpeGJsLCBsaWJ4bCBzaG91bGQgYmUgc3dpdGNoZWQgdG8gdXNlIFBW
SCBmb3IgQXJtIGd1ZXN0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
