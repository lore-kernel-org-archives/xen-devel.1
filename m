From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 31/34] xen: refuse to create HVM guests when
 !CONFIG_HVM
Date: Mon, 20 Aug 2018 13:59:57 +0100
Message-ID: <3746e4b4-73ec-bb5e-7944-ec5c98fab9c4@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6aav=ld=citrix.com=prvs=763c8c697=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1frjmy-0000lG-U3
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:00:08 +0000
In-Reply-To: <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDgvMjAxOCAxNjoxMiwgV2VpIExpdSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vY29tbW9uL2RvbWFpbi5jIHwg
OCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9t
YWluLmMKPiBpbmRleCAxNzFkMjVlLi5hMjJkZjEyIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24v
ZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTMxOCw4ICszMTgsMTQg
QEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAo+ICAgICAgaWYg
KCAhaXNfaWRsZV9kb21haW4oZCkgKQo+ICAgICAgewo+ICAgICAgICAgIGlmICggY29uZmlnLT5m
bGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCApCgpBcyBkaXNjb3ZlcmVkIGR1cmluZyBt
eSBkb21haW4gY3JlYXRpb24gcmV3cml0ZSB3b3JrLCBsaWJ4bCBvbiBBUk0KZG9lc24ndCBzZXQg
aHZtL2hhcC4KCklNTywgdGhleSBzaG91bGQsIGFuZCBsaWJ4bCBzaG91bGQgYmUgZml4ZWQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
